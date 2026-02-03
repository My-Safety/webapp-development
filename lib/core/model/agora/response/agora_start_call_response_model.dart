// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Adwaith c, 16/12/2025
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'agora_start_call_response_model.freezed.dart';
part 'agora_start_call_response_model.g.dart';

@freezed
class AgoraStartCallResponseModel with _$AgoraStartCallResponseModel {
  const factory AgoraStartCallResponseModel({
    required String callId,
    required String channelName,
    required String endsAt,
    required int maxDurationSeconds,
    required int maxParticipants,
    @Default('audio') String callType,
  }) = _AgoraStartCallResponseModel;

  factory AgoraStartCallResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AgoraStartCallResponseModelFromJson(json);
}