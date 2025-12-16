// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Adwaith c, 16/12/2025


import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mysafety_web/core/model/auth/login_response_model.dart';
import 'package:mysafety_web/core/model/base/base_dynamic_response_model.dart';
import 'package:mysafety_web/core/model/user/user_model.dart';
import 'package:mysafety_web/core/network/endpoints/auth_endpoint.dart';
import 'package:mysafety_web/core/network/endpoints/location_endpoint.dart';
import 'package:mysafety_web/core/network/network.dart';
import 'package:mysafety_web/core/network/network_status.dart';
import 'package:mysafety_web/src/features/auth/data/auth_repo.dart';

class AuthRemoteRepo implements AuthRepo {
  @override
  Future<BaseDynamicResponse<LoginResponseModel?>> sendOtp({
    required String phoneNo,
    required String name,
    required String lang,
  }) async {
    try {
      var response = await NetworkClient.post(
        endPoint: AuthEndPoints.sendOtp,
        body: {"mobile": phoneNo, "name": name, "lang": lang},
      );

      if (response?.statusCode == NetworkStatus.status200.statusCode) {
        var body = json.decode(response!.body);
        var result = BaseDynamicResponse<LoginResponseModel?>.fromJson(
          body,
          (json) => LoginResponseModel.fromJson(json as Map<String, dynamic>),
        );
        return result;
      }
    } catch (e) {
      return BaseDynamicResponse.error();
    }
    return BaseDynamicResponse.error();
  }

  @override
  Future<BaseDynamicResponse<User?>> verifyOtp({
    required String phoneNo,
    required String otp,
  }) async {
    try {
      var response = await NetworkClient.post(
        endPoint: AuthEndPoints.verifyOtp,
        body: {"mobile": phoneNo, "otp": otp},
      );

      if (response?.statusCode == NetworkStatus.status200.statusCode) {
        var body = json.decode(response!.body);
        body = {
          "success": body['success'],
          "actionCode": body["actionCode"],
          "message": body["message"],
          "data": body['data']['user'],
        };
        var result = BaseDynamicResponse<User?>.fromJson(
          body,
          (json) => User.fromJson(json as Map<String, dynamic>),
        );
        return result;
      }
    } catch (e) {
      return BaseDynamicResponse.error();
    }
    return BaseDynamicResponse.error();
  }

  @override
  Future<BaseDynamicResponse<Address?>> getAddressFromLatLng({
    required LatLng latlng,
  }) async {
    try {
      var response = await NetworkClient.post(
        endPoint: LocationEndpoint.getAddressFromLatLng,
        body: {"lat": latlng.latitude, "lng": latlng.longitude},
      );

      if (response?.statusCode == NetworkStatus.status200.statusCode) {
        var body = json.decode(response!.body);
        var result = BaseDynamicResponse<Address?>.fromJson(
          body,
          (json) => Address.fromJson(json as Map<String, dynamic>),
        );
        return result;
      }
    } catch (e) {
      return BaseDynamicResponse.error();
    }
    return BaseDynamicResponse.error();
  }
}

final authRemoteRepoProvider = Provider<AuthRemoteRepo>(
  (ref) => AuthRemoteRepo(),
);
