// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Adwaith c, 17/12/2025

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mysafety_web/core/model/chat/avatar/avatar_response_model.dart';
import 'package:mysafety_web/core/model/chat/state/chat_state.dart';
import 'package:mysafety_web/core/model/file/response/file_upload_response_model.dart';
import 'package:mysafety_web/core/network/network_status.dart';
import 'package:mysafety_web/src/features/chat/data/chat_remote_repo.dart';

final chatProvider = StateNotifierProvider<ChatNotifierProvider, ChatState>(
  (ref) => ChatNotifierProvider(ref),
);
final chatRemoteRepoProvider = Provider<ChatRemoteRepo>(
  (ref) => ChatRemoteRepo(),
);

class ChatNotifierProvider extends StateNotifier<ChatState> {
  ChatNotifierProvider(this.ref) : super(const ChatState());

  // CallLogType get activeCallLogTab => state.activeCallLogTab;

  // bool get isPremiumUser => state.isPremiumUser;

  final Ref ref;
  PlatformFile? get mediafile => state.mediafile;

  Future<bool> sendFileGetUrl() async {
    if (mediafile == null) return false;

    state = state.copyWith(isFileUploading: true);

    var result = await ref
        .read(chatRemoteRepoProvider)
        .fileUpload(file: mediafile!);

    if (result.success == ActionStatus.success.code) {
      state = state.copyWith(isFileUploading: false, uploadedFile: result.data);
      return true;
    } else {
      state = state.copyWith(isFileUploading: false, uploadedFile: null);
      return false;
    }
  }

  set setUploadFile(PlatformFile file) {
    state = state.copyWith(mediafile: file);
  }
}
