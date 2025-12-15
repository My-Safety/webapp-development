// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Adwaith c, 12/12/2025

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
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
  ProfileNotifierProvider(this.ref) : super(const ProfileState()) {
    driverNameController.addListener(
      () => state = state.copyWith(driverName: driverNameController.text),
    );
    driverPhoneController.addListener(
      () => state = state.copyWith(driverPhone: driverPhoneController.text),
    );
    driverLicenseController.addListener(
      () =>
          state = state.copyWith(driverLicenseNo: driverLicenseController.text),
    );
  }
  final TextEditingController driverNameController = TextEditingController();
  final TextEditingController driverPhoneController = TextEditingController();
  final TextEditingController driverLicenseController = TextEditingController();

  // validation
  String? validateDriverName() {
    if (state.driverName.trim().isEmpty) return 'Name is required';
    return null;
  }

  String? validateDriverPhone() {
    final phone = state.driverPhone.trim();
    if (phone.isEmpty) return 'Mobile no is required';
    if (phone.length < 10) return 'Enter valid mobile no';
    return null;
  }

  String? validateDriverLicense() {
    if (state.driverLicenseNo.trim().isEmpty) {
      return 'License no is required';
    }
    return null;
  }

  bool validateDriverForm() {
    final n = validateDriverName();
    final p = validateDriverPhone();
    final l = validateDriverLicense();
    final hasError = n != null || p != null || l != null;
    state = state.copyWith(
      driverFormError: hasError ? 'Please fix the errors above' : null,
    );
    return !hasError;
  }

  Future<void> submitDriver() async {
    if (!validateDriverForm()) return;

    state = state.copyWith(isDriverSubmitting: true);

    state = state.copyWith(isDriverSubmitting: false);
  }

  @override
  void dispose() {
    driverNameController.dispose();
    driverPhoneController.dispose();
    driverLicenseController.dispose();
    super.dispose();
  }

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

  bool get isAddMemberLoading => state.isAddMemberLoading;

  bool get isFamilyMemberLoading => state.isFamilyMemberLoading;

  bool get isDeleteMemberLoading => state.isDeleteMemberLoading;

  bool get isDriverDetailsLoading => state.isDriverDetailsLoading;

  PlatformFile? get drivingLicenseFile => state.drivingLicenseFile;

  bool get isFileLoading => state.isFileLoading;

  bool get isaddDriverLoading => state.isaddDriverLoading;

  bool get isUpdateMemberLoading => state.isUpdateMemberLoading;

  bool get isUpdateDriverLoading => state.isUpdateDriverLoading;

  PlatformFile? get avatarFile => state.avatarFile;

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

  void updatePhone(String? phone) {
    User? u;
    if (user == null) {
      u = User(phone: phone);
    } else {
      u = user?.copyWith(phone: phone);
    }
    state = state.copyWith(user: u);
  }

  void updateName(String? name) {
    User? u;
    if (user == null) {
      u = User(name: name);
    } else {
      u = user?.copyWith(name: name);
    }
    state = state.copyWith(user: u);
  }

  void updateEmail(String? email) {
    User? u;
    if (user == null) {
      u = User(email: email);
    } else {
      u = user?.copyWith(email: email);
    }
    state = state.copyWith(user: u);
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
