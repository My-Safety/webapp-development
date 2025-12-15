// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Suresh M, 19/11/2025

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mysafety_design_system/design_system/design_system.dart';

class BottomNavBarIcon extends StatelessWidget {
  final VoidCallback? onTap;
  final String iconPath;

  final bool isActive;
  const BottomNavBarIcon({
    super.key,
    this.onTap,
    required this.iconPath,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return BrandInkWell(
      onTap: onTap,
      child: Container(
        color: AppColors.transparent,
        child: SvgPicture.asset(
          width: 25,
          height: 25,
          iconPath,
          // ignore: deprecated_member_use
          color: isActive ? AppColors.secondary : AppColors.grey81,
        ),
      ),
    );
  }
}
