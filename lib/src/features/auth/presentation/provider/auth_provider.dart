// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Adwaith c, 16/12/2025

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:mysafety_web/core/model/auth/login_response_model.dart';
import 'package:mysafety_web/core/model/auth/state/auth_state.dart';
import 'package:mysafety_web/core/model/user/user_model.dart';
import 'package:mysafety_web/core/network/network_status.dart';
import 'package:mysafety_web/src/features/auth/data/auth_remote_repo.dart';
import 'package:mysafety_web/util/enum/otp_loading_enum.dart';
import 'package:mysafety_web/util/utils.dart';

final authProvider = StateNotifierProvider<AuthNotifierProvider, AuthState>(
  (ref) => AuthNotifierProvider(ref),
);

class AuthNotifierProvider extends StateNotifier<AuthState> {
  AuthNotifierProvider(this.ref) : super(const AuthState());

  final Ref ref;

  bool get isTermsAccepted => state.isTermsAccepted;

  bool get enableLoginButton => state.isTermsAccepted && state.isEnteredPhoneNo;

  Country get selectedCountry => state.selectedCountry;

  String? get phoneNo => state.phoneNo;

  String? get name => state.name;

  String? get email => state.email;
  OtpLoadingStep get loadingStep => state.loadingStep;

  set setLoadingStep(OtpLoadingStep step) {
    state = state.copyWith(loadingStep: step);
  }

  bool get isLoading => state.loadingStep != OtpLoadingStep.none;

  bool get isOtpComplete => state.isOtpComplete;

  set setOtpComplete(bool value) {
    state = state.copyWith(isOtpComplete: value);
  }

  

  bool get isExistingUser => state.isExisting;

  User? get user => state.user;
  LoginResponseModel? get loginresponse => state.loginResponse;
  String? get visitorId => state.user?.id;

  List<Country> defaultCountries = [
    Country(
      name: "India",
      nameTranslations: {},
      flag: "🇮🇳",
      code: "IN",
      dialCode: "91",
      minLength: 10,
      maxLength: 10,
    ),
  ];

  Future<bool> sendOtp({
    required String phoneNo,
    required String name,
    required String lang,
    required String qrId,
  }) async {
    state = state.copyWith(isSendOtpLoading: true);

    debugPrint('🔵 Auth Provider - qrId from profile: $qrId');

    var result = await ref
        .read(authRemoteRepoProvider)
        .sendOtp(phoneNo: phoneNo, name: name, lang: lang, qrId: qrId);

    if (result.success == ActionStatus.success.code) {
      state = state.copyWith(
        isSendOtpLoading: false,
        loginResponse: result.data,
      );

      return true;
    } else {
      return false;
    }
  }

Future<bool> verifyOtp({required String otp, required String qrId}) async {
  if (phoneNo == null) return false;

  // Was: state.copyWith(isVerifyOtpLoading: true, ...)
  state = state.copyWith(loadingStep: OtpLoadingStep.verifying, isOtpComplete: false);

  var result = await ref
      .read(authRemoteRepoProvider)
      .verifyOtp(phoneNo: phoneNo!, otp: otp, qrId: qrId);

  if (result.success == ActionStatus.success.code) {
    state = state.copyWith(
      loadingStep: OtpLoadingStep.none,   // was: isVerifyOtpLoading: false
      isOtpComplete: false,
      user: result.data,
    );
    return true;
  } else {
    state = state.copyWith(
      loadingStep: OtpLoadingStep.none,   // was: isVerifyOtpLoading: false
      isOtpComplete: true,
    );
    return false;
  }
}

  set setIsTermsAccepted(bool value) {
    state = state.copyWith(isTermsAccepted: value);
  }

  set setIsEnteredPhone(bool value) {
    state = state.copyWith(isEnteredPhoneNo: value);
  }

  set setSelectedCountry(Country value) {
    state = state.copyWith(selectedCountry: value);
  }

  set setPhoneNumber(String value) {
    state = state.copyWith(phoneNo: value);
  }

  set setName(String value) {
    state = state.copyWith(name: value);
  }
}
