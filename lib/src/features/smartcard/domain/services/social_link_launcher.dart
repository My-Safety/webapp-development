import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'social_link_url_builder.dart';

class SocialLinkLauncher {
  static Future<void> launch(
    BuildContext context,
    String platform,
    String value,
  ) async {
    final p = platform.toLowerCase().replaceAll(' ', '').replaceAll('_', '');

    if (p == 'copyurl') {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('URL copied!')),
        );
      }
      return;
    }

    final urlString = SocialLinkUrlBuilder.buildUrl(platform, value);
    final uri = Uri.parse(urlString);

    bool launched = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!launched) {
      launched = await launchUrl(uri, mode: LaunchMode.platformDefault);
    }
    if (!launched && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not open $platform')),
      );
    }
  }
}
