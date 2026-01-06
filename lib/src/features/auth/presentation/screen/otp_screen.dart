// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Adwaith c, 15/12/2025

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:mysafety_design_system/design_system/design_system.dart';
import 'package:mysafety_web/route/route_name.dart';
import 'package:mysafety_web/src/features/auth/presentation/provider/auth_provider.dart';
import 'package:mysafety_web/src/features/profile/presentation/provider/profile_provider.dart';
import 'package:mysafety_web/src/theme/pin_put_theme.dart';
import 'package:mysafety_web/util/extension/extension.dart';
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

  Future<void> verifyOtp() async {
    final authProviderNotifier = ref.read(authProvider.notifier);
    final isVerify = await authProviderNotifier.verifyOtp(
      otp: otpController.text,
    );

    if (isVerify) {
      await ref.read(profileProvider.notifier).handleDoorBellScan();
      gotoSelectOptionScreen();
    }
  }

  Future<void> handleDoorBellScan() async {
    await profileprovider.handleDoorBellScan();
  }



  void gotoSelectOptionScreen() {
    context.go(RouteName.selectOptionScreen);
  }

  void gotoBack() {
    context.pop();
  }

  Future<void> resendOtp() async {
    final profile = ref.read(profileProvider);
    final lang = profile.selectedLanguages?.code?.toString() ?? 'en';
    if (provider.phoneNo == null) return;
    await provider.sendOtp(
      phoneNo: provider.phoneNo!,
      name: provider.name!,
      lang: lang,
    );
  }

  Future<void> fetchData() async {}

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(authProvider);
    provider = ref.read(authProvider.notifier);
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
