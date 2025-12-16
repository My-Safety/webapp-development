// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Adwaith c, 16/12/2025

import 'dart:async';
import 'package:mysafety_web/app_config.dart';
import 'package:mysafety_web/util/auth/auth_manager.dart';
import 'package:mysafety_web/util/utils.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class ChatMessageModel {
  final String id;
  final String roomId;
  final String senderId;
  final String senderType;
  final String messageType;
  final String? content;
  final String? mediaUrl;
  final int? mediaDuration;
  final String status;
  final DateTime createdAt;

  ChatMessageModel({
    required this.id,
    required this.roomId,
    required this.senderId,
    required this.senderType,
    required this.messageType,
    this.content,
    this.mediaUrl,
    this.mediaDuration,
    required this.status,
    required this.createdAt,
  });

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) {
    return ChatMessageModel(
      id: json['_id'] ?? '',
      roomId: json['roomId'] ?? '',
      senderId: json['senderId'] ?? '',
      senderType: json['senderType'] ?? '',
      messageType: json['messageType'] ?? '',
      content: json['content'],
      mediaUrl: json['mediaUrl'],
      mediaDuration: json['mediaDuration'],
      status: json['status'] ?? 'Sent',
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}

abstract class WebSocketService {
  static io.Socket? socket;

  static final StreamController<ChatMessageModel> _newMessageController =
      StreamController.broadcast();

  static final StreamController<Map<String, dynamic>> _roomJoinedController =
      StreamController.broadcast();

  static final StreamController<List<Map<String, dynamic>>>
  _participantsStatusController = StreamController.broadcast();

  static final StreamController<dynamic> _typingController =
      StreamController.broadcast();

  static final StreamController<Map<String, dynamic>> _statusUpdateController =
      StreamController.broadcast();

  static final StreamController<Map<String, dynamic>>
  _participantSwitchedController = StreamController.broadcast();

  static final StreamController<String> _roomClosedController =
      StreamController.broadcast();

  static Stream<ChatMessageModel> get newMessageStream =>
      _newMessageController.stream;

  static Stream<Map<String, dynamic>> get roomJoinedStream =>
      _roomJoinedController.stream;

  static Stream<List<Map<String, dynamic>>> get participantsStatusStream =>
      _participantsStatusController.stream;

  static Stream<dynamic> get typingStream => _typingController.stream;

  static Stream<Map<String, dynamic>> get statusUpdateStream =>
      _statusUpdateController.stream;

  static Stream<Map<String, dynamic>> get participantSwitchedStream =>
      _participantSwitchedController.stream;

  static Stream<String> get roomClosedStream => _roomClosedController.stream;

  static Future<void> connect() async {
    if (socket?.connected == true) return;

    debugPrint('Connecting to: $webSocket/chat');
    socket = io.io(
      '$webSocket/chat',
      io.OptionBuilder().setTransports(['websocket']).setTimeout(10000).setAuth(
        {"token": AuthManager().token},
      ).build(),
    );

    socket?.onConnect((_) {
      debugPrint('✅ Chat socket connected');
      _setupEventListeners();
    });

    socket?.onConnectError((e) => debugPrint('❌ Connect error: $e'));
    socket?.onError((e) => debugPrint('❌ Socket error: $e'));
    socket?.connect();
  }

  static void _setupEventListeners() {
    if (socket == null) return;

    socket!.on('room_joined', (data) {
      _roomJoinedController.add(data);
    });

    socket!.on('new_message', (data) {
      debugPrint('Received new message: $data'); // debug
      final message = ChatMessageModel.fromJson(data);
      _newMessageController.add(message);
    });

    socket!.on('user_typing', (data) {
      _typingController.add(data);
    });

    socket!.on('message_status_update', (data) {
      _statusUpdateController.add(data);
    });

    socket!.on('participant_switched', (data) {
      _participantSwitchedController.add(data);
    });

    socket!.on('room_closed', (data) {
      final roomId = data['roomId'] as String?;
      if (roomId != null) _roomClosedController.add(roomId);
    });

    socket!.on('participants_status', (data) {
      final participants = List<Map<String, dynamic>>.from(data);
      _participantsStatusController.add(participants);
    });
  }

  static void joinRoom(String roomId) {
    socket?.emit('join_room', {'roomId': roomId});
    debugPrint('room joined : $roomId');
  }

  static Future<bool> sendMessage({
    required String roomId,
    required String messageType,
    String? content,
    String? mediaUrl,
    int? mediaDuration,
  }) async {
    if (socket?.connected != true) return false;

    final data = {'roomId': roomId, 'messageType': messageType};
    if (content != null && content.isNotEmpty) data['content'] = content;
    if (mediaUrl != null) data['mediaUrl'] = mediaUrl;
    // if (mediaDuration != null) data['mediaDuration'] = mediaDuration;

    try {
      socket?.emit('send_message', data);
      return true;
    } catch (e) {
      debugPrint('Send message error: $e');
      return false;
    }
  }

  static void sendTyping(String roomId, bool isTyping) {
    socket?.emit('typing', {'roomId': roomId, 'isTyping': isTyping});
  }

  static void messageDelivered(List<String> messageIds) {
    socket?.emit('message_delivered', {'messageIds': messageIds});
  }

  static void messageSeen(String roomId, List<String> messageIds) {
    socket?.emit('message_seen', {'roomId': roomId, 'messageIds': messageIds});
  }

  static void switchParticipant(
    String roomId,
    String participantId,
    String participantType,
  ) {
    socket?.emit('switch_participant', {
      'roomId': roomId,
      'participantId': participantId,
      'participantType': participantType,
    });
  }

  static void closeRoom(String roomId) {
    socket?.emit('close_room', {'roomId': roomId});
  }

  static void disconnect() {
    socket?.disconnect();
  }

  static bool get isConnected => socket?.connected ?? false;
}
