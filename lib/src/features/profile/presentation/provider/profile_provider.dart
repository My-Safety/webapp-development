// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Adwaith c, 12/12/2025

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mysafety_web/core/model/profile/languages/languages_response_model.dart';
import 'package:mysafety_web/core/model/profile/state/profile_state.dart';
import 'package:mysafety_web/core/model/user/user_model.dart';
import 'package:mysafety_web/core/network/network_status.dart';
import 'package:mysafety_web/src/features/auth/data/auth_remote_repo.dart';
import 'package:mysafety_web/src/features/profile/data/profile_remote_repo.dart';
import 'package:mysafety_web/util/enum/language_enum.dart';

final profileProvider =
    StateNotifierProvider<ProfileNotifierProvider, ProfileState>(
      (ref) => ProfileNotifierProvider(ref),
    );

class ProfileNotifierProvider extends StateNotifier<ProfileState> {
  ProfileNotifierProvider(this.ref) : super(const ProfileState());

  final Ref ref;

  User? get user => state.user;

  String? get name => user?.name;

  bool get isAddressLoading => state.isAddressLoading;

  bool get isLanguageListLoading => state.isLanguageListLoading;

  List<LanguagesResponseModel> get languages => state.languages;

  List<LanguagesResponseModel> get globalLanguages => state.globalLanguages;

  List<LanguagesResponseModel> get localLanguages => state.localLanguages;

  LanguagesResponseModel? get selectedLanguages => state.selectedLanguages;

  bool get isUserResponseLoading => state.isUserResponseLoading;

  bool get isUpdateProfileLoading => state.isUpdateProfileLoading;
  bool get isHandleDoorBellLoading => state.isHandleDoorBellLoading;
  String? get qrId => state.qrId;

  void setQrId(String value) {
    state = state.copyWith(qrId: value);
  }

  Future<void> getAddressFromLatLng({required LatLng latlng}) async {
    state = state.copyWith(isAddressLoading: true);

    var result = await ref
        .read(authRemoteRepoProvider)
        .getAddressFromLatLng(latlng: latlng);

    if (result.success == ActionStatus.success.code) {
      state = state.copyWith(
        isAddressLoading: false,
        user: user?.copyWith(address: result.data),
      );
    } else {
      state = state.copyWith(isAddressLoading: false, user: null);
    }
  }

  Future<void> getLanguages() async {
    state = state.copyWith(isLanguageListLoading: true);

    var result = await ref.read(profileRemoteRepoProvider).getlanguages();

    if (result.success == ActionStatus.success.code) {
      state = state.copyWith(
        isLanguageListLoading: false,
        languages: result.data,
      );
      if (languages.isNotEmpty) {
        filterLanguages();
      }
    } else {
      state = state.copyWith(isLanguageListLoading: false, languages: []);
    }
  }

  Future<void> handleDoorBellScan() async {
    state = state.copyWith(isHandleDoorBellLoading: true);

    var result = await ref
        .read(profileRemoteRepoProvider)
        .handleDoorbellScan(qrId: state.qrId.toString());

    if (result.success == ActionStatus.success.code) {
      state = state.copyWith(
        isLanguageListLoading: false,
        qrScanResponse: result.data,
      );
      print(state.qrScanResponse!.chatRoom!.qrId.toString());
    } else {
      state = state.copyWith(isHandleDoorBellLoading: false, languages: []);
    }
  }

  void filterLanguages() {
    List<LanguagesResponseModel> lList = [];

    List<LanguagesResponseModel> gList = [];

    for (var i in languages) {
      if (i.type == LanguageTypeEnum.local.name) {
        lList.add(i);
      } else {
        gList.add(i);
      }
    }
    state = state.copyWith(globalLanguages: gList, localLanguages: lList);
  }





  void updateFullAddress(String? address) {
    var a = user?.address?.copyWith(fulladdress: address);
    var u = user?.copyWith(address: a);
    state = state.copyWith(user: u);
  }

  void updatePincode(String? pincode) {
    var a = user?.address?.copyWith(pincode: pincode);
    var u = user?.copyWith(address: a);
    state = state.copyWith(user: u);
  }

  void updateLandmark(String? landmark) {
    var a = user?.address?.copyWith(landmark: landmark);
    var u = user?.copyWith(address: a);
    state = state.copyWith(user: u);
  }

  set setIsAddressLoading(bool value) {
    state = state.copyWith(isAddressLoading: value);
  }

  set setSelectedLanguage(LanguagesResponseModel value) {
    state = state.copyWith(selectedLanguages: value);
  }
}
