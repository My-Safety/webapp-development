import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mysafety_design_system/design_system/design_system.dart';
import 'dart:html' as html;

class ImageViewer extends StatelessWidget {
  final String imageUrl;

  const ImageViewer({
    super.key,
    required this.imageUrl,
  });

  void _downloadImage() {
    try {
      final anchor = html.AnchorElement(href: imageUrl)
        ..setAttribute('download', 'image_${DateTime.now().millisecondsSinceEpoch}.jpg')
        ..click();
      debugPrint(' Image download initiated');
    } catch (e) {
      debugPrint(' Download error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.download, color: Colors.white),
            onPressed: _downloadImage,
            tooltip: 'Save image',
          ),
        ],
      ),
      body: Center(
        child: InteractiveViewer(

          child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.fitHeight,
            placeholder: (_, __) => const Center(
              child: CircularProgressIndicator(color: Colors.white),
            ),
            errorWidget: (_, _, __) => const Center(
              child: Icon(
                Icons.broken_image,
                size: 80,
                color: Colors.white54,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
