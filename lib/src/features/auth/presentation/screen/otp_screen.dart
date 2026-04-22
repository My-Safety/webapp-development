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
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController otpController = TextEditingController();

  // Convenience getters — no setState, state lives in provider
  AuthNotifierProvider get _auth => ref.read(authProvider.notifier);
  ProfileNotifierProvider get _profile => ref.read(profileProvider.notifier);

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  Future<void> verifyOtp() async {
    if (otpController.text.length < 4) return;

    try {
      final isVerify = await _auth.verifyOtp(
        otp: otpController.text,
        qrId: _profile.qrId ?? '1833db932dde41c5cbd39e1930330caf',
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

  Future<void> _handlePostVerification() async {
    await _handleDoorBellScan();
  }

  Future<void> _handleDoorBellScan() async {
    try {
      var location = await LocationManager.getCurrentLocation();
      if (location == null) {
        debugPrint('🔴 Unable to get location');
        return;
      }
      await _profile.handleDoorBellScan(
        location: LatLng(location.latitude, location.longitude),
        qrId: _profile.qrId ?? '1833db932dde41c5cbd39e1930330caf',
      );
      _navigateToSelectOption();
    } catch (e) {
      debugPrint('Doorbell scan error: $e');
    }
  }

  Future<void> resendOtp() async {
    try {
      final profile = ref.read(profileProvider);
      final lang = profile.selectedLanguages?.code?.toString() ?? 'en';

      if (_auth.phoneNo == null) {
        debugPrint('Phone number not available');
        return;
      }

      await _auth.sendOtp(
        phoneNo: _auth.phoneNo!,
        name: _auth.name!,
        lang: lang,
        qrId: _profile.qrId ?? '1833db932dde41c5cbd39e1930330caf',
      );
    } catch (e) {
      debugPrint('Resend OTP error: $e');
    }
  }

  void _navigateToSelectOption() {
    final authState = ref.read(authProvider);
    final roomId = _profile.qrScanResponse?.chatRoom?.id;
    final visitorId = authState.user?.id;

    debugPrint('🔍 Auth State User: ${authState.user}');
    debugPrint('🔍 Visitor ID: $visitorId');

    // ignore: avoid_print
    print(
      'Navigating to SelectOptionScreen with roomId: $roomId, visitorId: $visitorId',
    );
    final qrId = _profile.qrId ?? '1833db932dde41c5cbd39e1930330caf';
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
    // Watch provider state — widget rebuilds automatically when these change
    final isLoading = ref.watch(authProvider).isVerifyOtpLoading;
    final isOtpComplete = ref.watch(authProvider).isOtpComplete;

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
                  length: 4,
                  controller: otpController,
                  onCompleted: (value) {
                    // Use provider setter — no setState
                    ref.read(authProvider.notifier).setOtpComplete = true;
                    verifyOtp();
                  },
                  onChanged: (value) {
                    // Use provider setter — no setState
                    ref.read(authProvider.notifier).setOtpComplete =
                        value.length == 4;
                  },
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
              if (isLoading)
                const SizedBox(
                  height: 60,
                  width: 60,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: AppColors.white,
                      strokeWidth: 3,
                    ),
                  ),
                )
              else if (isOtpComplete)
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    BrandIconButton.next(
                      height: 60,
                      width: 60,
                      isLoading: false,
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
