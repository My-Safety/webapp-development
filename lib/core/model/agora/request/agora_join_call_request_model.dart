// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Adwaith c, 16/12/2025
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'agora_join_call_request_model.freezed.dart';
part 'agora_join_call_request_model.g.dart';

@freezed
class AgoraJoinCallRequestModel with _$AgoraJoinCallRequestModel {
  const factory AgoraJoinCallRequestModel({
    @Default('owner') String role,
  }) = _AgoraJoinCallRequestModel;

  factory AgoraJoinCallRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AgoraJoinCallRequestModelFromJson(json);
}