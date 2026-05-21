import 'package:mysafety_web/core/model/resolve_qr/resolve_qr_response_model.dart';

class SocialLinkViewModel {
  final String platform;
  final String value;
  final String? imageUrl;

  SocialLinkViewModel({
    required this.platform,
    required this.value,
    this.imageUrl,
  });

  factory SocialLinkViewModel.fromDynamic(dynamic socialLink) {
    final String platform = (socialLink is SocialLink
            ? socialLink.type?.webSiteName
            : socialLink['platform']) ??
        'link';
    final String value =
        (socialLink is SocialLink ? socialLink.link : socialLink['value']) ?? '';
    final String? imageUrl =
        socialLink is SocialLink ? socialLink.type?.logoUrl : null;

    return SocialLinkViewModel(
      platform: platform,
      value: value,
      imageUrl: imageUrl,
    );
  }

  bool get isValid => value.isNotEmpty;
}
