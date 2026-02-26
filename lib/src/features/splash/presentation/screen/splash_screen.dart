// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Adwaith c, 16/12/2025

// ignore_for_file: avoid_web_libraries_in_flutter

// ignore: depend_on_referenced_packages
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mysafety_web/route/navigation_service.dart';
import 'package:mysafety_web/util/location/location_manager.dart';
// ignore: depend_on_referenced_packages
import 'package:web/web.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mysafety_web/route/route_name.dart';
import 'package:mysafety_web/src/features/profile/presentation/provider/profile_provider.dart';
import 'package:mysafety_web/util/assets/assets.dart';
import 'package:mysafety_web/util/extension/extension.dart';
import 'package:mysafety_design_system/design_system/design_system.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  late ProfileNotifierProvider provider;

  @override
  void initState() {
    super.initState();
    _loadInit();
  }

  Future<void> _loadInit() async {
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;

    provider = ref.read(profileProvider.notifier);
    final qrId = _getQrIdFromUrl();

    if (qrId.isNotEmpty) {
      provider.setQrId = qrId;
      debugPrint('qrId set: $qrId');
    } else {
      debugPrint('qrId is empty');
    }

    // Step 1: Get lat/long
    var location = await LocationManager.getCurrentLocation();
    if (location == null) {
      debugPrint('Unable to get location');
      return;
    }

    debugPrint(' Lat: ${location.latitude}, Long: ${location.longitude}');

    // Step 2: Get address
    await provider.getAddressFromLatLng(
      latlng: LatLng(location.latitude, location.longitude),
    );

    // Step 3: Resolve QR
    await provider.resolveQr(
      qrId: provider.qrId ?? '',
      latitude: location.latitude.toString(),
      longitude: location.longitude.toString(),
    );

    if (!mounted) return;

    // Step 4: Check profile - if null show error, else navigate to fetch address
    if (provider.hasProfile) {
      context.go(RouteName.fetchLocation);
      debugPrint('Profile  found house  assigned');
    } else {
      NavigationService.showErrorSnackbar(
        message: "Profile not found house not assigned",
      );
    }
  }

  String _getQrIdFromUrl() {
    final uri = Uri.parse(window.location.href);
    final qrId =
        uri.queryParameters['qrId']??"";
    debugPrint(' URL qrId extracted: $qrId');
    return qrId;
  }

  @override
  Widget build(BuildContext context) {
    provider = ref.read(profileProvider.notifier);

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
