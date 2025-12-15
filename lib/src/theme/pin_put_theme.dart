// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Suresh M, 10/03/2025

import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:mysafety_design_system/design_system/design_system.dart';

abstract class PinPutTheme {
  static PinTheme get defaultTheme => PinTheme(
    width: 68,
    height: 68,
    decoration: BoxDecoration(
      color: AppColors.darkBlue,
      border: Border.all(color: AppColors.secondary.withAlpha(100)),
      borderRadius: BorderRadius.circular(5),
    ),
    textStyle: BrandTextStyle(
      fontSize: BrandFontSize.size26,
      color: AppColors.white,
    ),
  );

  static PinTheme get focusedTheme => PinTheme(
    width: 68,
    height: 68,
    decoration: BoxDecoration(
      color: AppColors.darkBlue,
      border: Border.all(color: AppColors.secondary.withAlpha(90)),
      borderRadius: BorderRadius.circular(5),
    ),
    textStyle: BrandTextStyle(
      fontSize: BrandFontSize.size20,
      color: AppColors.white,
    ),
  );

  static PinTheme get pinDefaultTheme => PinTheme(
    width: 40,
    height: 40,
    decoration: BoxDecoration(
      border: Border.all(color: AppColors.transparent),
      borderRadius: BorderRadius.circular(40),
    ),
    textStyle: BrandTextStyle(fontSize: BrandFontSize.size20),
  );

  static PinTheme get pinFocusedTheme => PinTheme(
    width: 40,
    height: 40,
    decoration: BoxDecoration(
      border: Border.all(color: AppColors.transparent),
      borderRadius: BorderRadius.circular(40),
    ),
    textStyle: BrandTextStyle(fontSize: BrandFontSize.size20),
  );

  static PinTheme get enterPinDefaultTheme => PinTheme(
    width: 68,
    height: 68,
    decoration: BoxDecoration(
      color: AppColors.white,
      border: Border.all(color: AppColors.white),
      borderRadius: BorderRadius.circular(15),
    ),
    textStyle: BrandTextStyle(fontSize: BrandFontSize.size20),
  );

  static PinTheme get enterPinFocusedTheme => PinTheme(
    width: 68,
    height: 68,
    decoration: BoxDecoration(
      color: AppColors.white,
      border: Border.all(color: AppColors.secondary.withAlpha(90)),
      borderRadius: BorderRadius.circular(15),
    ),
    textStyle: BrandTextStyle(fontSize: BrandFontSize.size26),
  );
}
