// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Adwaith c, 09/12/2025



import 'package:flutter/material.dart';
import 'package:mysafety_design_system/design_system/design_system.dart';

abstract class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  static void showSnackbar(String message) {
    scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(content: BrandText(data: message)),
    );
  }

  ///[message] default to "Something went wrong"
  static void showErrorSnackbar({String? message}) {
    scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        content: BrandText(
          data: message ?? 'Something went wrong',
          fontWeight: FontWeight.w600,
        ),
        backgroundColor: AppColors.red36,
      ),
    );
  }

  ///[message] default to "Success"
  static void showSuccessSnackbar({String? message}) {
    scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        content: BrandText(
          data: message ?? 'Success',
          fontWeight: FontWeight.w600,
          fontColor: AppColors.white,
        ),
        backgroundColor: AppColors.green33,
      ),
    );
  }
}
