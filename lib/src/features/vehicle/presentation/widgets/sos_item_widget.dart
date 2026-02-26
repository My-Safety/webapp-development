import 'package:flutter/material.dart';
import 'package:mysafety_design_system/design_system/design_system.dart';

class SosItemWidget extends StatelessWidget {
  final String? imageUrl, title, subTitle;
  final Function? onTap;
  const SosItemWidget({
    super.key,
    this.imageUrl,
    this.title,
    this.onTap,
    this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BrandRoundedContainer(
            borderColor: AppColors.white.withAlpha(40),
            borderRadius: 8,
            color: AppColors.primary,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Row(
                children: [
                  imageUrl?.isNotEmpty == true
                      ? Image.asset(imageUrl!, width: 45, height: 45)
                      : SizedBox(),
                  BrandHSpace.gap14(),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BrandText.white(data: title ?? "--"),
                        BrandVSpace.gap14(),
                        BrandText.white(data: subTitle ?? "--"),
                      ],
                    ),
                  ),
                  BrandInkWell(
                    onTap: () {
                      onTap?.call();
                    },
                    child: BrandRoundedContainer(
                      width: 50,
                      height: 50,
                      color: AppColors.blue46,
                      child: Icon(Icons.call, color: AppColors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          BrandVSpace.gap18(),
        ],
      ),
    );
  }
}
