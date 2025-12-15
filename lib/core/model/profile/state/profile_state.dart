// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Suresh M, 13/11/2025

// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Suresh M, 13/11/2025

import 'package:file_picker/file_picker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mysafety_web/core/model/profile/languages/languages_response_model.dart';
import 'package:mysafety_web/core/model/user/user_model.dart';


part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    @Default(false) bool isAddressLoading,
    @Default(false) bool isLanguageListLoading,
    User? user,
    @Default(false) bool isUserResponseLoading,
    @Default([]) List<LanguagesResponseModel> languages,
    @Default([]) List<LanguagesResponseModel> globalLanguages,
    @Default([]) List<LanguagesResponseModel> localLanguages,
    LanguagesResponseModel? selectedLanguages,
    @Default(false) bool isUpdateProfileLoading,
    @Default(false) bool isAddMemberLoading,
    @Default(false) bool isFamilyMemberLoading,
    @Default(false) bool isDeleteMemberLoading,
    @Default(false) bool isDriverDetailsLoading,
    @Default(null) PlatformFile? drivingLicenseFile,
    @Default(false) bool isFileLoading,
    @Default(false) bool isaddDriverLoading,
    @Default(false) bool isUpdateMemberLoading,
    @Default(false) bool isUpdateDriverLoading,
    @Default(null) PlatformFile? avatarFile,

    // driver form
    @Default('') String driverName,
    @Default('') String driverPhone,
    @Default('') String driverLicenseNo,
    @Default(false) bool isDriverSubmitting,
    String? driverFormError,
  }) = _ProfileState;
}
