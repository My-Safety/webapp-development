// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Simplified for WebSocket-only - No LocalStorage - Adwaith C, 12/12/2025

import 'package:flutter/material.dart';
import 'package:mysafety_web/core/network/socket/web_socket.dart';

class ChatManager {
  static final ChatManager _instance = ChatManager._internal();

  factory ChatManager() => _instance;

  ChatManager._internal();

  // In-memory only (clears on app restart)
  final List<ChatMessageModel> _messages = [];
  List<ChatMessageModel> get messages => _messages;

  // Current user ID
  String? _currentUserId;
  String? get currentUserId => _currentUserId;

  // ✅ Set current user ID (call after login)
  void setCurrentUserId(String userId) {
    _currentUserId = userId;
  }

  // ✅ Add new message (WebSocket primary)
  void addMessage({required ChatMessageModel message}) {
    _messages.add(message);
  }

  // ✅ Get messages for specific room
  List<ChatMessageModel> getMessagesForRoom(String roomId) {
    return _messages.where((message) => message.roomId == roomId).toList()
      ..sort((a, b) => a.createdAt.compareTo(b.createdAt));
  }

  // ✅ Get unread count for room
  int getUnreadCount(String roomId, {String? excludeUserId}) {
    return _messages.where((message) {
      return message.roomId == roomId &&
          message.senderId != (excludeUserId ?? _currentUserId) &&
          message.status != 'Seen';
    }).length;
  }

  // ✅ Mark messages as seen for room (LOCAL ONLY)
  void markRoomAsSeen(String roomId) {
    final unseenMessages = _messages
        .where((m) {
          return m.roomId == roomId &&
              m.status != 'Seen' &&
              m.senderId != _currentUserId;
        })
        .map((m) => m.id)
        .toList();

    // Update local state only
    for (var messageId in unseenMessages) {
      final index = _messages.indexWhere((m) => m.id == messageId);
      if (index != -1) {
        _messages[index] = ChatMessageModel(
          id: _messages[index].id,
          roomId: _messages[index].roomId,
          senderId: _messages[index].senderId,
          senderType: _messages[index].senderType,
          messageType: _messages[index].messageType,
          content: _messages[index].content,
          mediaUrl: _messages[index].mediaUrl,
          mediaDuration: _messages[index].mediaDuration,
          status: 'Seen',
          createdAt: _messages[index].createdAt,
        );
      }
    }
  }

  void clearAll() {
    _messages.clear();
  }

  void clearRoom(String roomId) {
    _messages.removeWhere((m) => m.roomId == roomId);
  }

  Future<String?> uploadMedia(String filePath) async {
    // Your existing upload logic here
    try {
      // final uploadResponse = await YourUploadService.upload(filePath);
      return null; // Return uploaded URL
    } catch (e) {
      debugPrint('Upload failed: $e');
      return null;
    }
  }

  bool isOutgoingMessage(ChatMessageModel message) {
    return message.senderId == _currentUserId;
  }

  // ✅ Get message by ID
  ChatMessageModel? getMessageById(String messageId) {
    try {
      return _messages.firstWhere((m) => m.id == messageId);
    } catch (e) {
      return null;
    }
  }
}
