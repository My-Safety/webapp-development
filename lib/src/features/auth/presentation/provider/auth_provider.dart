// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Adwaith c, 16/12/2025



import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:mysafety_web/core/model/auth/login_response_model.dart';
import 'package:mysafety_web/core/model/auth/state/auth_state.dart';
import 'package:mysafety_web/core/model/user/user_model.dart';
import 'package:mysafety_web/core/network/network_status.dart';
import 'package:mysafety_web/src/features/auth/data/auth_remote_repo.dart';

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

  bool get isVerifyOtpLoading => state.isVerifyOtpLoading;

  bool get isExistingUser => state.isExisting;

  User? get user => state.user;
  LoginResponseModel? get loginresponse => state.loginResponse;

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
  }) async {
    state = state.copyWith(isSendOtpLoading: true);

    var result = await ref
        .read(authRemoteRepoProvider)
        .sendOtp(phoneNo: phoneNo, name: name, lang: lang);

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

  Future<bool> verifyOtp({required String otp}) async {
    if (phoneNo == null) return false;

    state = state.copyWith(isVerifyOtpLoading: true);

    var result = await ref
        .read(authRemoteRepoProvider)
        .verifyOtp(phoneNo: phoneNo!, otp: otp);

    if (result.success == ActionStatus.success.code) {
      state = state.copyWith(isVerifyOtpLoading: false, user: result.data);
      return true;
    } else {
      state = state.copyWith(isVerifyOtpLoading: false, user: null);
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
