// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Adwaith c, 16/12/2025
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'agora_start_call_request_model.freezed.dart';
part 'agora_start_call_request_model.g.dart';

@freezed
class AgoraStartCallRequestModel with _$AgoraStartCallRequestModel {
  const factory AgoraStartCallRequestModel({
    String? qrId,
    @Default('video') String callType,
  }) = _AgoraStartCallRequestModel;

  factory AgoraStartCallRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AgoraStartCallRequestModelFromJson(json);
}