// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Adwaith c, 16/12/2025

import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mysafety_web/core/model/base/base_dynamic_response_model.dart';
import 'package:mysafety_web/core/model/profile/languages/languages_response_model.dart';
import 'package:mysafety_web/core/model/qr/qr_scan_response_model.dart';
import 'package:mysafety_web/core/model/resolve_qr/resolve_qr_response_model.dart';
import 'package:mysafety_web/core/network/endpoints/profile_endpoint.dart';
import 'package:mysafety_web/core/network/network.dart';
import 'package:mysafety_web/core/network/network_status.dart';
import 'package:mysafety_web/src/features/profile/data/profile_repo.dart';

class ProfileRemoteRepo implements ProfileRepo {
  @override
  Future<BaseDynamicResponse<List<LanguagesResponseModel>>>
  getlanguages() async {
    try {
      var response = await NetworkClient.get(
        endPoint: ProfileEndpoint.getLanguages,
      );

      if (response?.statusCode == NetworkStatus.status200.statusCode) {
        var body = json.decode(response!.body);
        var result = BaseDynamicResponse<LanguagesResponseModel>.fromJson(
          body,
          (json) =>
              LanguagesResponseModel.fromJson(json as Map<String, dynamic>),
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
  Future<BaseDynamicResponse<ResolveQrResponseModel>> resolveQr({
    required String qrId,
    String? latitude,
    String? longitude,
  }) async {
    try {
      final response = await NetworkClient.get(
        endPoint:
            '${ProfileEndpoint.resolveQr}/$qrId'
            '?latitude=$latitude&longitude=$longitude',
      );

      if (response?.statusCode == NetworkStatus.status200.statusCode) {
        var body = json.decode(response!.body);
        var result = BaseDynamicResponse<ResolveQrResponseModel>.fromJson(
          body,
          (json) =>
              ResolveQrResponseModel.fromJson(json as Map<String, dynamic>),
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
  Future<BaseDynamicResponse<QrScanResponseModel>> handleDoorbellScan({
    required String qrId,
  }) async {
    try {
      var response = await NetworkClient.post(
        endPoint: ProfileEndpoint.handleDoorbellScan,
        body: {'qrId': qrId},
      );

      if (response?.statusCode == NetworkStatus.status200.statusCode) {
        var body = json.decode(response!.body);
        var result = BaseDynamicResponse<QrScanResponseModel>.fromJson(
          body,
          (json) => QrScanResponseModel.fromJson(json as Map<String, dynamic>),
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
}

final profileRemoteRepoProvider = Provider<ProfileRemoteRepo>(
  (ref) => ProfileRemoteRepo(),
);
