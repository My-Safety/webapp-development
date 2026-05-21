import 'package:flutter/material.dart';

class SocialLinkStyleHelper {
  static String getDisplayLabel(String platform) {
    switch (platform.toLowerCase().trim()) {
      case 'whatsapp':
        return 'WhatsApp';
      case 'telegram':
        return 'Telegram';
      case 'signal':
        return 'Signal';
      case 'instagram':
        return 'Direct';
      case 'twitter':
        return 'Twitter';
      case 'x':
        return 'X';
      case 'facebook':
        return 'Facebook';
      case 'linkedin':
        return 'LinkedIn';
      case 'snapchat':
        return 'Snapchat';
      case 'tiktok':
        return 'TikTok';
      case 'youtube':
        return 'YouTube';
      case 'github':
        return 'GitHub';
      case 'email':
        return 'Email';
      case 'phone':
      case 'call':
        return 'Call';
      case 'sms':
      case 'text':
        return 'SMS';
      case 'copy url':
      case 'copyurl':
      case 'copy_url':
        return 'Copy url';
      default:
        return platform.isNotEmpty
            ? platform[0].toUpperCase() + platform.substring(1).toLowerCase()
            : 'Link';
    }
  }

  static Color getBackgroundColor(String platform) {
    switch (platform.toLowerCase().trim()) {
      case 'whatsapp':
        return const Color(0xFF25D366);
      case 'telegram':
        return const Color(0xFF2AABEE);
      case 'signal':
        return const Color(0xFF3A76F0);
      case 'instagram':
        return const Color(0xFFE1306C);
      case 'twitter':
      case 'x':
        return const Color(0xFF1DA1F2);
      case 'facebook':
        return const Color(0xFF1877F2);
      case 'linkedin':
        return const Color(0xFF0A66C2);
      case 'snapchat':
        return const Color(0xFFFFFC00);
      case 'tiktok':
        return const Color(0xFFEE1D52);
      case 'youtube':
        return const Color(0xFFFF0000);
      case 'github':
        return const Color(0xFF181717);
      case 'email':
        return const Color(0xFFEA4335);
      case 'phone':
      case 'call':
        return const Color(0xFF4CAF50);
      case 'sms':
      case 'text':
        return const Color(0xFF607D8B);
      case 'copy url':
      case 'copyurl':
      case 'copy_url':
        return const Color(0xFF3A3A3A);
      default:
        return const Color(0xFF555555);
    }
  }
}
