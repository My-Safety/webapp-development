// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Adwaith c, 17/12/2025

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mysafety_web/core/model/chat/avatar/avatar_response_model.dart';
import 'package:mysafety_web/core/model/chat/state/chat_state.dart';
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

 Future<Avatar?> sendFileGetUrl(String filePath) async {
  if (filePath.isEmpty) return null;

  state = state.copyWith(isFileUploading: true);

  final fileBytes = await File(filePath).readAsBytes();
  final platformFile = PlatformFile(
    name: filePath.split('/').last,
    path: filePath,
    bytes: fileBytes,
    size: fileBytes.length,
  );

  final result = await ref
      .read(chatRemoteRepoProvider)
      .fileUpload(file: platformFile);

  state = state.copyWith(isFileUploading: false);

  if (result.success == ActionStatus.success.code && result.data != null) {
    state = state.copyWith(uploadedFile: result.data);
    return result.data;
  }

  return null;
}

}
