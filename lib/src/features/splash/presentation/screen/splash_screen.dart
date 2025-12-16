// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Adwaith c, 16/12/2025


// ignore_for_file: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mysafety_web/route/route_name.dart';
import 'package:mysafety_web/src/features/profile/presentation/provider/profile_provider.dart';
import 'package:mysafety_web/util/assets/assets.dart';
import 'package:mysafety_web/util/auth/auth_manager.dart';
import 'package:mysafety_web/util/extension/extension.dart';
import 'package:mysafety_design_system/design_system/design_system.dart';
import 'dart:html' as html;
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();

    final qrId = _getQrIdFromUrl();

    if (qrId != null && qrId.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(profileProvider.notifier).setQrId(qrId);

        // ref.read(profileProvider.notifier).handleDoorBellScan();
      });
    }
    _loadInit();
  }

  void _loadInit() {
    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      _init();
    });
  }

  String? _getQrIdFromUrl() {
    final uri = Uri.parse(html.window.location.href);
    return uri.queryParameters['qrId'];
  }

  Future<void> _init() async {
    await AuthManager().fetchToken();

    if (!mounted) return;

    if (AuthManager().token == null || AuthManager().token!.isEmpty) {
      gotoLanguageSelection();
      return;
    }
    await ref.read(profileProvider.notifier).handleDoorBellScan();

    goToHome();
  }

  void gotoLanguageSelection() {
    context.go(RouteName.selectLanguageScreen);
  }

  void goToHome() {
    context.go(RouteName.oneToOneChatScreen);
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
