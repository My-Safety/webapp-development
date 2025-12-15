// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Suresh M, 17/11/2025

import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mysafety_web/core/model/base/base_dynamic_response_model.dart';
import 'package:mysafety_web/core/model/profile/languages/languages_response_model.dart';
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

}

final profileRemoteRepoProvider = Provider<ProfileRemoteRepo>(
  (ref) => ProfileRemoteRepo(),
);
