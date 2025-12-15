// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Suresh M, 13/11/2025

import 'package:flutter/material.dart';
import 'package:mysafety_web/util/assets/assets.dart';
import 'package:mysafety_web/util/extension/extension.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:mysafety_design_system/design_system/design_system.dart';

class SliderButton extends StatelessWidget {
  final Future? Function()? onSubmit;
  final bool disabled;
  final String? title;
  const SliderButton({
    super.key,
    this.onSubmit,
    this.disabled = true,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SlideAction(
      height: 50,
      elevation: 0,
      borderRadius: 100,
      animationDuration: const Duration(milliseconds: 450),
      text: context.loc.login,
      textStyle: BrandTextStyle(
        color: AppColors.primary,
        fontSize: BrandFontSize.size16,
      ),
      innerColor: AppColors.white,
      outerColor: disabled ? AppColors.grey7D : AppColors.secondary,
      sliderButtonIcon: Container(
        width: 22,
        height: 22,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(child: Image.asset(Assets.nextIcon)),
      ),
      sliderButtonIconPadding: 10,
      sliderButtonIconSize: 15,
      sliderRotate: false,
      onSubmit: onSubmit,
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Center(
              child: BrandText.white(
                data: title ?? context.loc.login,
                fontSize: BrandFontSize.size16,
                fontColor: disabled ? AppColors.white : AppColors.primary,
                fontFamily: BrandFontFamily.inter,
                fontWeight: FontWeight.w600,
              ),
            ),
            // Positioned(
            //   right: 0,
            //   top: 0,
            //   bottom: 0,
            //   left: 0,
            //   child: Center(
            //     child: SizedBox(
            //       child: Shimmer.fromColors(
            //         highlightColor: AppColors.grey7D,
            //         baseColor: AppColors.white,
            //         child: Stack(
            //           children: [
            //             Positioned(
            //               top: 0,
            //               right: 22,
            //               bottom: 0,
            //               child: Icon(Icons.arrow_forward_ios_rounded),
            //             ),
            //             Positioned(
            //               top: 0,
            //               right: 32,
            //               bottom: 0,
            //               child: Icon(Icons.arrow_forward_ios_rounded),
            //             ),
            //             Positioned(
            //               top: 0,
            //               right: 42,
            //               bottom: 0,
            //               child: Icon(Icons.arrow_forward_ios_rounded),
            //             ),
            //           ],
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
