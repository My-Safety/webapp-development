// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Adwaith c, 16/12/2025

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mysafety_web/core/model/agora/response/agora_start_call_response_model.dart';
import 'package:mysafety_web/core/model/agora/response/agora_token_response_model.dart';

part 'agora_state.freezed.dart';

@freezed
class AgoraState with _$AgoraState {
  const factory AgoraState({
    @Default(false) bool isLoading,
    @Default(false) bool isCallActive,
    @Default(false) bool isMuted,
    @Default(false) bool isVideoEnabled,
    @Default(false) bool isFrontCamera,
    @Default(false) bool isRemoteUserJoined,
    @Default(false) bool isWebSdkLoaded,
    @Default(false) bool isSpeakerOn,
    @Default(false) bool isCallInitiated,

    AgoraTokenResponseModel? tokenData,
    AgoraStartCallResponseModel? startCallData,
    AgoraTokenResponseModel? joinCallData,
    String? error,
    @Default([]) List<int> remoteUsers,
  }) = _AgoraState;
}
