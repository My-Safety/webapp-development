import 'package:flutter/material.dart';

class SocialLinkIcon extends StatelessWidget {
  final String? imageUrl;
  final Color backgroundColor;

  const SocialLinkIcon({
    super.key,
    required this.imageUrl,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: backgroundColor.withOpacity(0.35),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: imageUrl != null && imageUrl!.isNotEmpty
          ? ClipOval(
              child: Image.network(
                imageUrl!,
                width: 56,
                height: 56,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.link_rounded, color: Colors.white, size: 26),
              ),
            )
          : const Icon(Icons.link_rounded, color: Colors.white, size: 26),
    );
  }
}
