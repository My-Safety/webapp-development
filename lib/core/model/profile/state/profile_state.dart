// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Suresh M, 13/11/2025

// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Suresh M, 13/11/2025

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mysafety_web/core/model/address/address_model.dart';
import 'package:mysafety_web/core/model/profile/languages/languages_response_model.dart';
import 'package:mysafety_web/core/model/profile/predefined_message/predefined_message_model.dart';
import 'package:mysafety_web/core/model/qr/qr_scan_response_model.dart';
import 'package:mysafety_web/core/model/resolve_qr/resolve_qr_response_model.dart';
import 'package:mysafety_web/core/model/user/user_model.dart' hide Address;

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    @Default(false) bool isAddressLoading,
    @Default(false) bool isLanguageListLoading,
    User? user,
    AddressModel? addressModel,
    String? qrId,
    String? visitorId,

    @Default(false) bool isUserResponseLoading,
    @Default([]) List<LanguagesResponseModel> languages,
    @Default([]) List<LanguagesResponseModel> globalLanguages,
    @Default([]) List<LanguagesResponseModel> localLanguages,
    LanguagesResponseModel? selectedLanguages,
    QrScanResponseModel? qrScanResponse,
    ResolveQrResponseModel? resolveQrResponse,
    @Default(false) bool isUpdateProfileLoading,
    @Default(false) bool isHandleDoorBellLoading,
    String? activeProfileType,
    @Default([]) List<PredefinedMessageModel> predefinedMessages,
    @Default(false) bool isPredefinedMessagesLoading,
  }) = _ProfileState;
}
