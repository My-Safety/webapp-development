// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Adwaith c, 16/12/2025

import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mysafety_web/core/model/address/address_model.dart';
import 'package:mysafety_web/core/model/auth/login_response_model.dart';
import 'package:mysafety_web/core/model/base/base_dynamic_response_model.dart';
import 'package:mysafety_web/core/model/user/user_model.dart';
import 'package:mysafety_web/core/network/endpoints/auth_endpoint.dart';
import 'package:mysafety_web/core/network/endpoints/location_endpoint.dart';
import 'package:mysafety_web/core/network/network.dart';
import 'package:mysafety_web/core/network/network_status.dart';
import 'package:mysafety_web/src/features/auth/data/auth_repo.dart';
import 'package:mysafety_web/util/utils.dart';

class AuthRemoteRepo implements AuthRepo {
  @override
  Future<BaseDynamicResponse<LoginResponseModel?>> sendOtp({
    required String phoneNo,
    required String name,
    required String lang,
    String? qrId,
  }) async {
    try {
      var body = {"mobile": phoneNo, "name": name, "lang": lang, "qrId": qrId};
      if (qrId != null) {
        debugPrint('🔵 Auth Remote Repo - Adding qrId to request: $qrId');
      } else {
        debugPrint('🔴 Auth Remote Repo - qrId is null, not adding to request');
      }

      var response = await NetworkClient.post(
        endPoint: AuthEndPoints.sendOtp,
        body: body,
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
    String? qrId,
  }) async {
    try {
      var response = await NetworkClient.post(
        endPoint: AuthEndPoints.verifyOtp,
        body: {"mobile": phoneNo, "otp": otp, "qrId": qrId},
      );

      if (response?.statusCode == NetworkStatus.status200.statusCode) {
        var body = json.decode(response!.body);

        var result = BaseDynamicResponse<User?>.fromJson(
          body,
          (json) => User.fromJson(json as Map<String, dynamic>),
        );
        return BaseDynamicResponse(
          data: result.data,
          message: result.message,
          statusCode: result.statusCode,
          success: result.success,
        );
      }
    } catch (e) {
      return BaseDynamicResponse.error();
    }
    return BaseDynamicResponse.error();
  }

  @override
  Future<BaseDynamicResponse<AddressModel?>> getAddressFromLatLng({
    required LatLng latlng,
  }) async {
    try {
      var response = await NetworkClient.post(
        endPoint: LocationEndpoint.getAddressFromLatLng,
        body: {"lat": latlng.latitude, "lng": latlng.longitude},
      );

      if (response?.statusCode == NetworkStatus.status200.statusCode) {
        var body = json.decode(response!.body);
        var result = BaseDynamicResponse<AddressModel?>.fromJson(
          body,
          (json) => AddressModel.fromJson(json as Map<String, dynamic>),
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
