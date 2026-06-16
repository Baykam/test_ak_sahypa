part  of '../home.dart';

class AutoPlayDroneBanner extends StatefulWidget {
  final List<String> imageUrls;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  const AutoPlayDroneBanner({
    super.key,
    required this.imageUrls,
    this.title = 'A month with DJI Mini 3 Pro',
    this.subtitle = 'DJI • Jul 10, 2023',
    this.onTap,
  });

  @override
  State<AutoPlayDroneBanner> createState() => _AutoPlayDroneBannerState();
}

class _AutoPlayDroneBannerState extends State<AutoPlayDroneBanner> {
  int _currentPage = 0;
  late PageController _pageController;
  Timer? _timer; // Zamanlayıcı tanımlaması

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);

    // Sayfa oluşturulduğunda otomatik kaydırma zamanlayıcısını başlatıyoruz
    _startAutoPlay();
  }

  // 3 saniyede bir tetiklenecek fonksiyon
  void _startAutoPlay() {
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (widget.imageUrls.isNotEmpty) {
        // Eğer son sayfadaysak ilk sayfaya dön, değilse bir sonraki sayfaya geç
        if (_currentPage < widget.imageUrls.length - 1) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }

        // Sayfa geçiş animasyonu (300 milisaniye sürer ve yumuşak geçiş yapar)
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      }
    });
  }

  @override
  void dispose() {
    // Hafıza sızıntısını (memory leak) önlemek için timer ve controller'ı kapatıyoruz
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.imageUrls.isEmpty) return const SizedBox.shrink();

    return Container(
      margin: const EdgeInsets.all(16.0),
      height: 220,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Stack(
        children: [
          // 1. Kaydırılabilir ve Zaman Ayarlı Resim Alanı
          PageView.builder(
            controller: _pageController,
            itemCount: widget.imageUrls.length,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page; // Kullanıcı elle kaydırırsa indisi güncelle
              });

              // ÖNEMLİ: Kullanıcı elle kaydırdığında zamanlayıcıyı sıfırlıyoruz.
              // Böylece tam kaydırdığı anın üstüne 3 saniye daha sayar, görseller üst üste hızlıca atlamaz.
              _timer?.cancel();
              _startAutoPlay();
            },
            itemBuilder: (context, index) {
              return Image.asset(
                widget.imageUrls[index],
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[800],
                    child: const Icon(Icons.broken_image, color: Colors.white38, size: 40),
                  );
                },
              );
            },
          ),

          // Karartma Katmanı (Yazı okunabilirliği için)
          IgnorePointer(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.1),
                    Colors.black.withOpacity(0.7),
                  ],
                ),
              ),
            ),
          ),

          // Dinamik Sayfalama Noktaları
          Positioned(
            top: 16,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                      widget.imageUrls.length,
                          (index) => _buildDot(isActive: index == _currentPage),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Alt Metinler ve Yönlendirme İkonu
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        widget.subtitle,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        widget.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -0.5,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: widget.onTap,
                  icon: const Icon(
                    Icons.north_east,
                    color: Colors.white,
                    size: 28,
                  ),
                  constraints: const BoxConstraints(),
                  padding: EdgeInsets.zero,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDot({required bool isActive}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(horizontal: 2),
      width: 6,
      height: 6,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.white.withOpacity(0.4),
        shape: BoxShape.circle,
      ),
    );
  }
}