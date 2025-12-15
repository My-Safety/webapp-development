// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Suresh M, 11/11/2025

import 'package:flutter/material.dart';
import 'package:mysafety_web/localization/l10n/l10n.dart';

extension LocalizationExtension on BuildContext {
  S get loc => S.of(this);

  double get screenWidth => MediaQuery.sizeOf(this).width;
  double get screenHeight => MediaQuery.sizeOf(this).height;
}

extension StringOperation on String {
  String toFirstCaps() {
    try {
      return (this).substring(0, 1).toUpperCase() +
          (this).substring(1, (this).length).toLowerCase();
    } catch (e) {
      return this;
    }
  }
}

extension AppColorFilter on Color {
  ColorFilter get colorFilter => ColorFilter.mode(this, BlendMode.src);
}
