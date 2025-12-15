// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Suresh M, 12/11/2025

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mysafety_web/route/route_name.dart';
import 'package:mysafety_web/util/assets/assets.dart';
import 'package:mysafety_web/util/auth/auth_manager.dart';
import 'package:mysafety_web/util/extension/extension.dart';
import 'package:mysafety_design_system/design_system/design_system.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // Future<void> gotoLanguageSelection() async {
  //   Future.delayed(const Duration(seconds: 2), () {
  //     if (mounted) {
  //       context.go(RouteName.selectLanguageScreen);
  //     }
  //   });
  // }

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    await AuthManager().fetchToken();

    if (!mounted) return;

    if (AuthManager().token == null || AuthManager().token!.isEmpty) {
      gotoLanguageSelection();
      return;
    }

    goToHome();
  }

  void gotoLanguageSelection() {
    context.go(RouteName.selectLanguageScreen);
  }

  void goToHome() {
    context.go(RouteName.home);
  }

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Image.asset(Assets.logo, width: context.screenWidth * 0.4),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36),
              child: Column(
                children: [
                  BrandRichText(
                    titleValue: context.loc.safety_with_a_touch_of,
                    actionValue: context.loc.comfort,
                    titleFontFamily: BrandFontFamily.salmond,
                    actionFontFamily: BrandFontFamily.salmond,
                    titleFontSize: BrandFontSize.size36,
                    actionFontSize: BrandFontSize.size36,
                    onTap: () {},
                  ),
                  BrandLoaderWidget(width: 55),
                ],
              ),
            ),
            Column(
              children: [
                Image.asset(Assets.logoGrey, width: context.screenWidth * 0.9),
                BrandVSpace.gap16(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
