// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Adwaith c, 16/12/2025
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'agora_token_response_model.freezed.dart';
part 'agora_token_response_model.g.dart';

@freezed
class AgoraTokenResponseModel with _$AgoraTokenResponseModel {
  const factory AgoraTokenResponseModel({
    required String agoraToken,
    required String appId,
    required String channelName,
    required int uid,
    required String expiresAt,
  }) = _AgoraTokenResponseModel;

  factory AgoraTokenResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AgoraTokenResponseModelFromJson(json);
}