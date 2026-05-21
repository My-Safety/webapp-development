class SocialLinkUrlBuilder {
  static String buildUrl(String platform, String value) {
    final p = platform.toLowerCase().trim();
    final v = value.trim();

    switch (p) {
      case 'whatsapp':
        final digits = v.replaceAll(RegExp(r'\D'), '');
        return 'https://wa.me/$digits';

      case 'telegram':
        if (v.startsWith('+') || RegExp(r'^\d').hasMatch(v)) {
          final digits = v.replaceAll(RegExp(r'\D'), '');
          return 'https://t.me/+$digits';
        }
        return 'https://t.me/$v';

      case 'signal':
        final digits = v.replaceAll(RegExp(r'\D'), '');
        return 'https://signal.me/#p/+$digits';

      case 'instagram':
        final username = v.replaceAll('@', '');
        return 'https://instagram.com/$username';

      case 'twitter':
      case 'x':
        final username = v.replaceAll('@', '');
        return 'https://x.com/$username';

      case 'facebook':
        if (v.startsWith('http')) return v;
        return 'https://facebook.com/$v';

      case 'linkedin':
        if (v.startsWith('http')) return v;
        return 'https://linkedin.com/in/$v';

      case 'snapchat':
        final username = v.replaceAll('@', '');
        return 'https://snapchat.com/add/$username';

      case 'tiktok':
        final username = v.replaceAll('@', '');
        return 'https://tiktok.com/@$username';

      case 'youtube':
        if (v.startsWith('http')) return v;
        return 'https://youtube.com/@$v';

      case 'pinterest':
        if (v.startsWith('http')) return v;
        return 'https://pinterest.com/$v';

      case 'reddit':
        if (v.startsWith('http')) return v;
        return 'https://reddit.com/user/$v';

      case 'github':
        if (v.startsWith('http')) return v;
        return 'https://github.com/$v';

      case 'phone':
      case 'call':
        final digits = v.replaceAll(RegExp(r'\s'), '');
        return 'tel:$digits';

      case 'sms':
      case 'text':
        final digits = v.replaceAll(RegExp(r'\D'), '');
        return 'sms:$digits';

      case 'email':
        return v.startsWith('mailto:') ? v : 'mailto:$v';

      case 'copy url':
      case 'copyurl':
      case 'copy_url':
        return v.startsWith('http') ? v : 'https://$v';

      case 'website':
      case 'url':
      case 'link':
      default:
        if (v.startsWith('http://') || v.startsWith('https://')) return v;
        return 'https://$v';
    }
  }
}
