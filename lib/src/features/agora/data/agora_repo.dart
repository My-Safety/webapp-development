// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Adwaith c, 16/12/2025

import 'package:mysafety_web/core/model/agora/request/agora_join_call_request_model.dart';
import 'package:mysafety_web/core/model/agora/request/agora_start_call_request_model.dart';
import 'package:mysafety_web/core/model/agora/request/agora_token_request_model.dart';
import 'package:mysafety_web/core/model/agora/response/agora_start_call_response_model.dart';
import 'package:mysafety_web/core/model/agora/response/agora_token_response_model.dart';
import 'package:mysafety_web/core/model/base/base_dynamic_response_model.dart';

abstract class AgoraRepo {
  Future<BaseDynamicResponse<AgoraStartCallResponseModel?>> startCall({
    required AgoraStartCallRequestModel request,
  });

  Future<BaseDynamicResponse<AgoraTokenResponseModel?>> joinCall({
    required String callId,
    required AgoraJoinCallRequestModel request,
  });

  Future<BaseDynamicResponse<AgoraTokenResponseModel?>> generateToken({
    required String callId,
    required AgoraTokenRequestModel request,
  });

  Future<BaseDynamicResponse<Map<String, dynamic>?>> endCall({
    required String callId,
  });
}