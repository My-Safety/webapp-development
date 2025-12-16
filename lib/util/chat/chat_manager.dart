// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Simplified for WebSocket-only - No LocalStorage - Adwaith C, 12/12/2025
// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Adwaith c, 16/12/2025


import 'package:flutter/material.dart';
import 'package:mysafety_web/core/network/socket/web_socket.dart';

class ChatManager {
  static final ChatManager _instance = ChatManager._internal();

  factory ChatManager() => _instance;

  ChatManager._internal();

  final List<ChatMessageModel> _messages = [];
  List<ChatMessageModel> get messages => _messages;

  String? _currentUserId;
  String? get currentUserId => _currentUserId;

  void setCurrentUserId(String userId) {
    _currentUserId = userId;
  }

  void addMessage({required ChatMessageModel message}) {
    _messages.add(message);
  }

  List<ChatMessageModel> getMessagesForRoom(String roomId) {
    return _messages.where((message) => message.roomId == roomId).toList()
      ..sort((a, b) => a.createdAt.compareTo(b.createdAt));
  }

  int getUnreadCount(String roomId, {String? excludeUserId}) {
    return _messages.where((message) {
      return message.roomId == roomId &&
          message.senderId != (excludeUserId ?? _currentUserId) &&
          message.status != 'Seen';
    }).length;
  }

  void markRoomAsSeen(String roomId) {
    final unseenMessages = _messages
        .where((m) {
          return m.roomId == roomId &&
              m.status != 'Seen' &&
              m.senderId != _currentUserId;
        })
        .map((m) => m.id)
        .toList();

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
    try {
      return null; 
    } catch (e) {
      debugPrint('Upload failed: $e');
      return null;
    }
  }

  bool isOutgoingMessage(ChatMessageModel message) {
    return message.senderId == _currentUserId;
  }

  ChatMessageModel? getMessageById(String messageId) {
    try {
      return _messages.firstWhere((m) => m.id == messageId);
    } catch (e) {
      return null;
    }
  }
}
