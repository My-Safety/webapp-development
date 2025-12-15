// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Suresh M, 13/11/2025

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:mysafety_web/core/model/auth/login_response_model.dart';
import 'package:mysafety_web/core/model/user/user_model.dart';
part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(false) bool isSendOtpLoading,
    @Default(false) bool isEmailValid,
    @Default(false) bool isPhoneValid,
    @Default(false) bool isError,
    @Default(false) bool isVerifyOtpLoading,
    @Default(false) bool enableLoginButton,
    @Default(false) bool isTermsAccepted,
    @Default(false) bool isEnteredPhoneNo,
    @Default(false) bool isExisting,
    @Default(null) User? user,
    @Default(null) LoginResponseModel? loginResponse,

    @Default(
      Country(
        name: "India",
        flag: "🇮🇳",
        code: "IN",
        dialCode: "91",
        minLength: 10,
        maxLength: 10,
        nameTranslations: {},
      ),
    )
    Country selectedCountry,
    String? phoneNo,
    String? email,
    String? name,
    String? fullAddress,
    String? pinCode,
    String? landmark,
  }) = _AuthState;
}
