// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Suresh M, 11/11/2025

import 'package:flutter/material.dart';
import 'package:mysafety_design_system/design_system/design_system.dart';

abstract class SearchFieldTheme {
  static ThemeData get lightTheme => ThemeData(
    primaryColor: AppColors.primary,
    fontFamily: BrandFontFamily.inter,
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide.none,
      ),
      // enabledBorder: OutlineInputBorder(
      //   borderRadius: BorderRadius.circular(15),
      //   borderSide: BorderSide(color: AppColors.greyE4, width: 2),
      // ),
      // focusedBorder: OutlineInputBorder(
      //   borderRadius: BorderRadius.circular(15),
      //   borderSide: BorderSide(color: AppColors.primary, width: 2),
      // ),
      // disabledBorder: OutlineInputBorder(
      //   borderRadius: BorderRadius.circular(15),
      //   borderSide: BorderSide(color: AppColors.greyFD, width: 2),
      // ),
    ),
  );

  static ThemeData get borderlessTheme => ThemeData(
    primaryColor: AppColors.primary,
    fontFamily: BrandFontFamily.inter,
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(horizontal: 10),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0),
        borderSide: BorderSide.none,
      ),
      // enabledBorder: OutlineInputBorder(
      //   borderRadius: BorderRadius.circular(15),
      //   borderSide: BorderSide(color: AppColors.greyE4, width: 2),
      // ),
      // focusedBorder: OutlineInputBorder(
      //   borderRadius: BorderRadius.circular(15),
      //   borderSide: BorderSide(color: AppColors.primary, width: 2),
      // ),
      // disabledBorder: OutlineInputBorder(
      //   borderRadius: BorderRadius.circular(15),
      //   borderSide: BorderSide(color: AppColors.greyFD, width: 2),
      // ),
    ),
  );

  static ThemeData get borderTheme => ThemeData(
    primaryColor: AppColors.primary,
    fontFamily: BrandFontFamily.inter,
    inputDecorationTheme: InputDecorationTheme(
      suffixIconColor: AppColors.black,
      suffixIconConstraints: BoxConstraints(minWidth: 120, maxWidth: 120),
      hintStyle: TextStyle(color: AppColors.red),
      contentPadding: EdgeInsets.symmetric(horizontal: 10),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.black),
      ),
    ),
  );
}
