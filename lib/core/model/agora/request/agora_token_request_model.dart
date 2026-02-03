// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Adwaith c, 16/12/2025
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'agora_token_request_model.freezed.dart';
part 'agora_token_request_model.g.dart';

@freezed
class AgoraTokenRequestModel with _$AgoraTokenRequestModel {
  const factory AgoraTokenRequestModel({
    required int uid,
    @Default('publisher') String role,
  }) = _AgoraTokenRequestModel;

  factory AgoraTokenRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AgoraTokenRequestModelFromJson(json);
}