// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Suresh M, 13/11/2025

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mysafety_web/core/model/auth/login_response_model.dart';
import 'package:mysafety_web/core/model/base/base_dynamic_response_model.dart';
import 'package:mysafety_web/core/model/user/user_model.dart';

abstract class AuthRepo {
  Future<BaseDynamicResponse<LoginResponseModel?>> sendOtp({
    required String phoneNo,
    required String name,
    required String lang,
  });

  Future<BaseDynamicResponse<User?>> verifyOtp({
    required String phoneNo,
    required String otp,
  });

  Future<BaseDynamicResponse<Address?>> getAddressFromLatLng({
    required LatLng latlng,
  });

}
