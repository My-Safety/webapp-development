// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Adwaith c, 15/12/2025

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:mysafety_design_system/design_system/design_system.dart';
import 'package:mysafety_web/route/route_name.dart';
import 'package:mysafety_web/src/features/auth/presentation/provider/auth_provider.dart';
import 'package:mysafety_web/src/features/profile/presentation/provider/profile_provider.dart';
import 'package:mysafety_web/src/theme/pin_put_theme.dart';
import 'package:mysafety_web/util/extension/extension.dart';
import 'package:mysafety_web/util/location/location_manager.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends ConsumerStatefulWidget {
  final dynamic rouetArgs;
  const OtpScreen({super.key, this.rouetArgs});

  @override
  ConsumerState<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends ConsumerState<OtpScreen> {
  late AuthNotifierProvider provider;
  late ProfileNotifierProvider profileprovider;

  GlobalKey<FormState> formKey = GlobalKey();

  TextEditingController otpController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _initialize();
  }

  Future<void> _initialize() async {}

  Future<void> verifyOtp() async {
    if (!_validateOtp()) return;

    try {
      final isVerify = await provider.verifyOtp(
        otp: otpController.text,
        qrId: profileprovider.qrId ?? 'e984cacef7ac469118002759547df6a8',
      );

      if (isVerify) {
        debugPrint(
          '🟢 OTP Verified - User ID: ${ref.read(authProvider).user?.id}',
        );
        await _handlePostVerification();
      }
    } catch (e) {
      debugPrint('OTP verification error: $e');
    }
  }

  bool _validateOtp() {
    if (otpController.text.isEmpty) {
      return false;
    }
    return true;
  }

  Future<void> _handlePostVerification() async {
    await _handleDoorBellScan();
    _navigateToSelectOption();
  }

  Future<void> _handleDoorBellScan() async {
    try {
      // Step 1: Get lat/long
      var location = await LocationManager.getCurrentLocation();
      if (location == null) {
        debugPrint('🔴 Unable to get location');
        return;
      }
      await profileprovider.handleDoorBellScan(
        location: LatLng(location.latitude, location.longitude),
        qrId: "e984cacef7ac469118002759547df6a8",
        // qrId: profileprovider.qrId ?? ,
      );
    } catch (e) {
      debugPrint('Doorbell scan error: $e');
    }
  }

  Future<void> resendOtp() async {
    try {
      final profile = ref.read(profileProvider);
      final lang = profile.selectedLanguages?.code?.toString() ?? 'en';

      if (provider.phoneNo == null) {
        debugPrint('Phone number not available');
        return;
      }

      await provider.sendOtp(
        phoneNo: provider.phoneNo!,
        name: provider.name!,
        lang: lang,
        qrId: profileprovider.qrId ?? 'e984cacef7ac469118002759547df6a8',
      );
    } catch (e) {
      debugPrint('Resend OTP error: $e');
    }
  }

  void _navigateToSelectOption() {
    final authState = ref.read(authProvider);
    final roomId = profileprovider.qrScanResponse?.chatRoom?.id;
    final visitorId = authState.user?.id;

    debugPrint('🔍 Auth State User: ${authState.user}');
    debugPrint('🔍 Visitor ID: $visitorId');

    // ignore: avoid_print
    print(
      'Navigating to SelectOptionScreen with roomId: $roomId, visitorId: $visitorId',
    );
    final qrId = profileprovider.qrId ?? "e984cacef7ac469118002759547df6a8";
    if (roomId != null) {
      context.go(
        '${RouteName.selectOptionScreen}?roomId=$roomId&qrId=$qrId&visitorId=$visitorId',
      );
    } else {
      context.go(RouteName.selectOptionScreen);
    }
  }

  void gotoBack() {
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    provider = ref.read(authProvider.notifier);
    profileprovider = ref.read(profileProvider.notifier);
    return BaseLayout(
      appBar: BrandAppBar(title: context.loc.enter_otp, centerTitle: false),
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Pinput(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  autofocus: true,
                  controller: otpController,
                  onCompleted: (value) {},
                  onChanged: (value) {},
                  defaultPinTheme: PinPutTheme.defaultTheme,
                  focusedPinTheme: PinPutTheme.focusedTheme,
                ),
              ),
              BrandVSpace.gap12(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  BrandTextButton(
                    fontColor: AppColors.white,
                    decoration: TextDecoration.underline,
                    title: context.loc.resend,
                    onTap: resendOtp,
                  ),
                ],
              ),
              BrandVSpace.gap100(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  BrandIconButton.next(
                    height: 60,
                    width: 60,
                    isLoading: provider.isVerifyOtpLoading,
                    onTap: verifyOtp,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
