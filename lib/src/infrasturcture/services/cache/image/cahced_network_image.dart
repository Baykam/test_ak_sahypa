import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;


part 'custom_image_cache_manager.dart';

class ProductImage extends StatefulWidget {
  const ProductImage({super.key, required this.url});

  final String url;

  @override
  State<ProductImage> createState() => _ProductImageState();
}

class _ProductImageState extends State<ProductImage> {
  late Future<File> _imageFuture;

  @override
  void initState() {
    super.initState();
    // Widget ilk açıldığında sıkıştırma ve cache fonksiyonunu doğrudan tetikliyoruz
    _imageFuture = CustomImageCacheManager.getAndCompressImage(widget.url);
  }

  @override
  void didUpdateWidget(covariant ProductImage oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Eğer dışarıdan gelen URL değişirse resmi yeniden yükle
    if (oldWidget.url != widget.url) {
      setState(() {
        _imageFuture = CustomImageCacheManager.getAndCompressImage(widget.url);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.url.isEmpty) {
      return const Icon(Icons.image_not_supported);
    }

    // Fonksiyondan gelecek olan File (Dosya) sonucunu bekleyen FutureBuilder
    return FutureBuilder<File>(
      future: _imageFuture,
      builder: (context, snapshot) {
        // 1. Durum: Resim indiriliyor veya sıkıştırılıyor (Placeholder)
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        // 2. Durum: Hata oluştu (Error Widget)
        if (snapshot.hasError || !snapshot.hasData) {
          return const Icon(Icons.error);
        }

        // 3. Durum: İşlem başarılı, sıkıştırılmış yerel dosya hazır!
        final compressedFile = snapshot.data!;

        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            image: DecorationImage(
              // CachedNetworkImage yerine doğrudan yerel dosyadan (FileImage) okuyoruz
              image: FileImage(compressedFile),
              fit: BoxFit.cover,
              colorFilter: const ColorFilter.mode(
                Colors.red,
                BlendMode.colorBurn,
              ),
            ),
          ),
        );
      },
    );
  }
}