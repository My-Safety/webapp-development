import 'package:flutter/material.dart';
import 'package:mysafety_design_system/design_system/design_system.dart';

class SosItemWidget extends StatelessWidget {
  final String? imageUrl, title, subTitle;
  final VoidCallback? onTap;
  final bool isLoading;
  final double imageSize;

  const SosItemWidget({
    super.key,
    this.imageUrl,
    this.title,
    this.onTap,
    this.subTitle,
    this.isLoading = false,
    this.imageSize = 28,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: BrandRoundedContainer(
        borderColor: AppColors.white.withAlpha(38),
        borderRadius: 8,
        color: AppColors.darkBlue,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 7, 7, 7),
          child: Row(
            children: [
              if (imageUrl?.isNotEmpty == true) ...[
                Image.asset(imageUrl!, width: imageSize, height: imageSize),
                const SizedBox(width: 12),
              ],
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BrandText.white(
                      data: title?.trim().isNotEmpty == true ? title! : '--',
                      fontWeight: FontWeight.w500,
                    ),
                    if (subTitle?.trim().isNotEmpty == true) ...[
                      const SizedBox(height: 3),
                      BrandText.grey(
                        data: subTitle!,
                        fontColor: AppColors.greyB5,
                        fontSize: 12,
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(width: 10),
              BrandInkWell(
                onTap: isLoading ? null : onTap,
                child: BrandRoundedContainer(
                  width: 40,
                  height: 40,
                  borderRadius: 3,
                  color: AppColors.blue97,
                  child: Center(
                    child: isLoading
                        ? const SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: AppColors.white,
                            ),
                          )
                        : const Icon(
                            Icons.phone_outlined,
                            size: 18,
                            color: AppColors.white,
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
