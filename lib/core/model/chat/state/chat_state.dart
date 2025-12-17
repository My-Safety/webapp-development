// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Pavithra R, 10/09/2025

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mysafety_web/core/model/chat/avatar/avatar_response_model.dart';


part 'chat_state.freezed.dart';

@freezed
class ChatState with _$ChatState {
  const factory ChatState({
    @Default(false) bool isError,
    Avatar? uploadedFile,
    @Default(false) bool isPremiumUser,
    @Default(false) bool isFileUploading,
    @Default(null) String? roomId,

  }) = _ChatState;
}
