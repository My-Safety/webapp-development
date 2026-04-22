import 'package:flutter/material.dart';
import 'package:mysafety_web/core/model/resolve_qr/resolve_qr_response_model.dart';
import 'package:mysafety_web/util/url_launcher_manager/url_launcher_manager.dart';
import 'package:mysafety_design_system/design_system/theme/_theme.dart';

class SocialLinkItem extends StatelessWidget {
  final SocialLink socialLink;

  const SocialLinkItem({super.key, required this.socialLink});

  @override
  Widget build(BuildContext context) {
    final linkUrl = socialLink.link ?? '';
    final websiteName = socialLink.type?.webSiteName ?? '';
    final logoUrl = socialLink.type?.logoUrl ?? '';

    if (linkUrl.isEmpty) return const SizedBox.shrink();

    return GestureDetector(
      onTap: () => _launchUrl(linkUrl),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildIcon(websiteName, logoUrl),
          const SizedBox(height: 8),
          if (websiteName.isNotEmpty)
            Text(
              websiteName,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 12,
              ),
            ),
        ],
      ),
    );
  }

  void _launchUrl(String linkUrl) {
    final url = linkUrl.startsWith('http') ? linkUrl : 'https://$linkUrl';
    UrlLauncherManager.launchURL(url);
  }

  Widget _buildIcon(String websiteName, String logoUrl) {
    if (logoUrl.isNotEmpty) {
      return Container(
        width: 70,
        height: 70,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: ClipOval(
          child: Image.network(
            logoUrl,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => _buildFallbackIcon(websiteName),
          ),
        ),
      );
    }
    return _buildFallbackIcon(websiteName);
  }

  Widget _buildFallbackIcon(String websiteName) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _getColor(websiteName),
      ),
      child: Icon(
        _getIcon(websiteName),
        color: Colors.white,
        size: 30,
      ),
    );
  }

  Color _getColor(String websiteName) {
    final name = websiteName.toLowerCase();
    if (name.contains('whatsapp')) return const Color(0xFF25D366);
    if (name.contains('instagram')) return const Color(0xFFE4405F);
    if (name.contains('telegram')) return const Color(0xFF0088CC);
    if (name.contains('facebook')) return const Color(0xFF1877F2);
    if (name.contains('linkedin')) return const Color(0xFF0A66C2);
    if (name.contains('twitter') || name.contains('x')) return const Color(0xFF1DA1F2);
    return AppColors.primary;
  }

  IconData _getIcon(String websiteName) {
    final name = websiteName.toLowerCase();
    if (name.contains('whatsapp')) return Icons.phone;
    if (name.contains('instagram')) return Icons.camera_alt;
    if (name.contains('telegram')) return Icons.send;
    if (name.contains('facebook')) return Icons.facebook;
    if (name.contains('linkedin')) return Icons.business;
    if (name.contains('twitter') || name.contains('x')) return Icons.tag;
    return Icons.link;
  }
}
