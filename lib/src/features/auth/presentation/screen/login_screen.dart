// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Adwaith c, 16/12/2025

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:mysafety_design_system/design_system/design_system.dart';
import 'package:mysafety_web/route/route_name.dart';
import 'package:mysafety_web/src/common/widget/slider_button.dart';
import 'package:mysafety_web/src/features/auth/presentation/provider/auth_provider.dart';
import 'package:mysafety_web/src/features/profile/presentation/provider/profile_provider.dart';
import 'package:mysafety_web/util/assets/assets.dart';
import 'package:mysafety_web/util/extension/extension.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  late AuthNotifierProvider provider;
  late ProfileNotifierProvider proprovider;

  final GlobalKey<FormState> formKey = GlobalKey();

  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  Future<void> sendOtp() async {
    if (!(formKey.currentState?.validate() ?? false)) return;

    final profile = ref.read(profileProvider);
    final lang = profile.selectedLanguages?.code?.toString() ?? 'en';

    final isSend = await provider.sendOtp(
      phoneNo: phoneController.text,
      name: nameController.text,
      lang: lang,
      qrId: profile.qrId ?? 'e984cacef7ac469118002759547df6a8',
    );

    if (!isSend) return;

    _goToOtpScreen();
  }

  void _goToOtpScreen() {
    context.push(RouteName.otp);
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(authProvider);
    provider = ref.read(authProvider.notifier);
    return BaseLayout(
      child: Expanded(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BrandVSpace.gap40(),
                Center(
                  child: Image.asset(
                    Assets.logo,
                    width: context.screenWidth * 0.4,
                  ),
                ),
                BrandVSpace.gap60(),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      BrandTextField(
                        fillColor: AppColors.blue4D,
                        filled: true,
                        showCountryCode: false,
                        label: context.loc.name,
                        initialCountryCode:
                            provider.defaultCountries.first.code,
                        countries: provider.defaultCountries,
                        controller: nameController,
                        keyboardType: TextInputType.name,
                        onPhoneCountryCodeChange: (p0) {
                          provider.setSelectedCountry = p0;
                        },
                        hintText: context.loc.please_enter_your_name,
                        textStyle: BrandTextStyle(color: AppColors.white),
                        // validator: ,
                        onChanged: (value) {
                          provider.setName = value;
                        },
                      ),
                      BrandVSpace.gap40(),

                      BrandTextField(
                        fillColor: AppColors.blue4D,
                        filled: true,
                        showCountryCode: true,
                        label: context.loc.mobile_no,
                        initialCountryCode:
                            provider.defaultCountries.first.code,
                        countries: provider.defaultCountries,
                        controller: phoneController,
                        keyboardType: TextInputType.number,
                        onPhoneCountryCodeChange: (p0) {
                          provider.setSelectedCountry = p0;
                        },
                        hintText: context.loc.enter_mobile_number,
                        textStyle: BrandTextStyle(color: AppColors.white),
                        phoneValidator: (phone) {
                          var val = phone?.number;
                          if (val?.isEmpty ?? true) {
                            return context.loc.please_enter_phone_number;
                          } else if (val!.length <
                              provider.selectedCountry.minLength) {
                            return context.loc.phone_number_not_valid;
                          }
                          return null;
                        },
                        phoneNumberOnChange: (p0) {
                          provider.setIsEnteredPhone =
                              p0.number.length <
                                  provider.selectedCountry.minLength
                              ? false
                              : true;
                          provider.setPhoneNumber = p0.number;
                        },
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.lock, color: AppColors.greyB5, size: 14),
                    BrandHSpace.gap4(),
                    BrandText.grey(
                      data: context.loc.your_information_is_secure_protected,
                      fontColor: AppColors.greyB5,
                      fontSize: BrandFontSize.size12,
                    ),
                  ],
                ),
                BrandVSpace.gap100(),
                BrandVSpace.gap40(),
                Row(
                  children: [
                    BrandCheckBox(
                      value: provider.isTermsAccepted,
                      onChanged: (value) {
                        provider.setIsTermsAccepted = value ?? false;
                      },
                    ),
                    Flexible(
                      child: BrandText.grey(
                        data: context
                            .loc
                            .i_understand_and_accept_the_terms_conditions,
                        fontColor: AppColors.greyB5,
                        fontSize: BrandFontSize.size14,
                      ),
                    ),
                  ],
                ),
                BrandVSpace.gap10(),
                SliderButton(
                  disabled: !provider.enableLoginButton,
                  onSubmit: sendOtp,
                ),
                BrandVSpace.gap80(),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     BrandRoundedContainer(
                //       color: AppColors.white.withAlpha(100),
                //       child: Padding(
                //         padding: const EdgeInsets.all(24.0),
                //         child: Image.asset(Assets.googleIcon, width: 24),
                //       ),
                //     ),
                //     BrandHSpace.gap10(),
                //     BrandRoundedContainer(
                //       color: AppColors.white.withAlpha(100),
                //       child: Padding(
                //         padding: const EdgeInsets.all(24.0),
                //         child: Image.asset(Assets.appleIcon, width: 24),
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
