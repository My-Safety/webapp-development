// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Adwaith c, 16/12/2025

import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mysafety_web/core/model/agora/request/agora_join_call_request_model.dart';
import 'package:mysafety_web/core/model/agora/request/agora_start_call_request_model.dart';
import 'package:mysafety_web/core/model/agora/request/agora_token_request_model.dart';
import 'package:mysafety_web/core/model/agora/response/agora_start_call_response_model.dart';
import 'package:mysafety_web/core/model/agora/response/agora_token_response_model.dart';
import 'package:mysafety_web/core/model/base/base_dynamic_response_model.dart';
import 'package:mysafety_web/core/network/endpoints/agora_endpoint.dart';
import 'package:mysafety_web/core/network/network.dart';
import 'package:mysafety_web/core/network/network_status.dart';
import 'package:mysafety_web/src/features/agora/data/agora_repo.dart';

class AgoraRemoteRepo implements AgoraRepo {
  @override
  Future<BaseDynamicResponse<AgoraStartCallResponseModel?>> startCall({
    required AgoraStartCallRequestModel request,
  }) async {
    try {
      var response = await NetworkClient.post(
        endPoint: AgoraEndPoints.startCall,
        body: request.toJson(),
      );

      if (response?.statusCode == NetworkStatus.status200.statusCode) {
        var body = json.decode(response!.body);
        var result = BaseDynamicResponse<AgoraStartCallResponseModel?>.fromJson(
          body,
          (json) => AgoraStartCallResponseModel.fromJson(
            json as Map<String, dynamic>,
          ),
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
  Future<BaseDynamicResponse<AgoraTokenResponseModel?>> joinCall({
    required String callId,
    required AgoraJoinCallRequestModel request,
  }) async {
    try {
      var response = await NetworkClient.post(
        endPoint: AgoraEndPoints.joinCall(callId),
        body: request.toJson(),
      );

      if (response?.statusCode == NetworkStatus.status200.statusCode) {
        var body = json.decode(response!.body);
        var result = BaseDynamicResponse<AgoraTokenResponseModel?>.fromJson(
          body,
          (json) =>
              AgoraTokenResponseModel.fromJson(json as Map<String, dynamic>),
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
  Future<BaseDynamicResponse<AgoraTokenResponseModel?>> generateToken({
    required String callId,
    required AgoraTokenRequestModel request,
  }) async {
    try {
      var response = await NetworkClient.post(
        endPoint: AgoraEndPoints.generateToken(callId),
        body: request.toJson(),
      );

      if (response?.statusCode == NetworkStatus.status200.statusCode) {
        var body = json.decode(response!.body);
        var result = BaseDynamicResponse<AgoraTokenResponseModel?>.fromJson(
          body,
          (json) =>
              AgoraTokenResponseModel.fromJson(json as Map<String, dynamic>),
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
  Future<BaseDynamicResponse<Map<String, dynamic>?>> endCall({
    required String callId,
  }) async {
    try {
      var response = await NetworkClient.post(
        endPoint: AgoraEndPoints.endCall(callId),
        body: {'callId': callId},
      );

      if (response?.statusCode == NetworkStatus.status200.statusCode) {
        var body = json.decode(response!.body);
        var result = BaseDynamicResponse<Map<String, dynamic>?>.fromJson(
          body,
          (json) => json as Map<String, dynamic>,
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

final agoraRemoteRepoProvider = Provider<AgoraRemoteRepo>(
  (ref) => AgoraRemoteRepo(),
);
