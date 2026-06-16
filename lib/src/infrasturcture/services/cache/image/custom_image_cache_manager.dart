part of 'cahced_network_image.dart';

class CustomImageCacheManager {
  static const key = 'customCompressedCacheKey';
  
  // Singleton CacheManager oluşturuyoruz
  static CacheManager instance = CacheManager(
    Config(
      key,
      stalePeriod: const Duration(days: 7), // Cache'te kalma süresi
      maxNrOfCacheObjects: 200, // Maksimum tutulacak resim sayısı
      repo: JsonCacheInfoRepository(databaseName: key),
      fileService: HttpFileService(),
    ),
  );

  /// Resmi indirir, sıkıştırır ve Cache'e yazar
  static Future<File> getAndCompressImage(String url) async {
    // 1. Resim zaten cache'de var mı kontrol et
    FileInfo? fileInfo = await instance.getFileFromCache(url);
    
    if (fileInfo != null) {
      return fileInfo.file; // Varsa direkt cache'deki dosyayı dön
    }

    // 2. Yoksa internetten indir
    File file = await instance.downloadFile(url).then((fileInfo) => fileInfo.file);

    // 3. Geçici bir klasörde sıkıştırılmış dosya yolu oluştur
    final targetDir = await getTemporaryDirectory();
    final targetPath = p.join(targetDir.path, "${DateTime.now().millisecondsSinceEpoch}.jpg");

    // 4. Resmi compress (sıkıştırma) işlemi
    XFile? compressedXFile = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      targetPath,
      quality: 70, // Sıkıştırma kalitesi (%70 genellikle idealdir)
      minWidth: 800, // İdeal genişlik (isteğe göre değiştirebilirsin)
      minHeight: 600, // İdeal yükseklik
    );

    if (compressedXFile == null) return file; // Sıkıştırma başarısız olursa orijinali dön

    File compressedFile = File(compressedXFile.path);

    // 5. Sıkıştırılmış resmi cache mekanizmasına kaydet
    await instance.putFile(
      url,
      compressedFile.readAsBytesSync(),
      fileExtension: 'jpg',
    );

    return compressedFile;
  }
}