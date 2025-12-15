// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Suresh M, 16/11/2025

import 'package:flutter/material.dart';
import 'package:mysafety_design_system/design_system/design_system.dart';
import 'package:mysafety_web/util/extension/extension.dart';

class SelectableChip extends StatelessWidget {
  final bool isSelected;
  final String? title;
  final double? width;
  final VoidCallback? onTap;
  const SelectableChip({
    super.key,
    this.isSelected = false,
    this.title,
    this.width,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BrandInkWell(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 750),
        constraints: BoxConstraints(
          minWidth: 58,
          minHeight: 45,
          maxWidth: width ?? context.screenWidth * 0.4,
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.secondary.withAlpha(25)
              : AppColors.darkBlue,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected
                ? AppColors.secondary
                : AppColors.white.withAlpha(65),
          ),
        ),
        child: Row(
          mainAxisSize: .min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isSelected) ...[
              Icon(Icons.check_circle, color: AppColors.secondary),
              BrandHSpace.gap10(),
            ],
            Row(
              children: [
                BrandText.secondary(
                  data: title ?? context.loc.na,
                  fontColor: AppColors.white,
                  maxLines: 1,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
