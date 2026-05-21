import 'package:flutter/material.dart';
import '../../domain/models/social_link_view_model.dart';
import '../../domain/services/social_link_launcher.dart';
import '../../domain/services/social_link_style_helper.dart';
import 'social_link_icon.dart';

class SocialLinkItem extends StatelessWidget {
  final dynamic socialLink;

  const SocialLinkItem({super.key, required this.socialLink});

  @override
  Widget build(BuildContext context) {
    final viewModel = SocialLinkViewModel.fromDynamic(socialLink);

    if (!viewModel.isValid) return const SizedBox.shrink();

    final backgroundColor = SocialLinkStyleHelper.getBackgroundColor(viewModel.platform);
    final label = SocialLinkStyleHelper.getDisplayLabel(viewModel.platform);

    return GestureDetector(
      onTap: () => SocialLinkLauncher.launch(
        context,
        viewModel.platform,
        viewModel.value,
      ),
      child: SizedBox(
        width: 68,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SocialLinkIcon(
              imageUrl: viewModel.imageUrl,
              backgroundColor: backgroundColor,
            ),
            const SizedBox(height: 7),
            Text(
              label,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.w400,
                height: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
