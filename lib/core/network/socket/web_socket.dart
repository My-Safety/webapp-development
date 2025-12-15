// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Updated for ChatSocketHandler integration - Adwaith C, 12/12/2025

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

  // Stream controllers for all events
  static final StreamController<ChatMessageModel> _newMessageController =
      StreamController.broadcast();
  static final StreamController<Map<String, dynamic>> _roomJoinedController =
      StreamController.broadcast();
  static final StreamController<List<Map<String, dynamic>>> _participantsStatusController =
      StreamController.broadcast();
  static final StreamController<dynamic> _typingController =
      StreamController.broadcast();
  static final StreamController<Map<String, dynamic>> _statusUpdateController =
      StreamController.broadcast();
  static final StreamController<Map<String, dynamic>> _participantSwitchedController =
      StreamController.broadcast();
  static final StreamController<String> _roomClosedController =
      StreamController.broadcast();

  // Public streams
  static Stream<ChatMessageModel> get newMessageStream => _newMessageController.stream;
  static Stream<Map<String, dynamic>> get roomJoinedStream => _roomJoinedController.stream;
  static Stream<List<Map<String, dynamic>>> get participantsStatusStream => _participantsStatusController.stream;
  static Stream<dynamic> get typingStream => _typingController.stream;
  static Stream<Map<String, dynamic>> get statusUpdateStream => _statusUpdateController.stream;
  static Stream<Map<String, dynamic>> get participantSwitchedStream => _participantSwitchedController.stream;
  static Stream<String> get roomClosedStream => _roomClosedController.stream;

  static Future<void> connect() async {
    if (socket?.connected == true) return;

    socket = io.io(
      webSocket,
      io.OptionBuilder()
          .setTransports(['websocket'])
          .setAuth({"token": AuthManager().token})
          .build(),
    );

    socket?.onConnect((_) {
      debugPrint('Chat socket connected');
      _setupEventListeners();
    });

    socket?.onDisconnect((_) => debugPrint('Chat socket disconnected'));
    socket?.onError((e) => debugPrint('Chat socket error: $e'));
    socket?.onConnectError((e) => debugPrint('Chat socket connect error: $e'));

    socket?.connect();
  }

  static void _setupEventListeners() {
    // Room joined with history
    socket?.on('room_joined', (data) {
      debugPrint('Room joined: ${data['roomId']}');
      _roomJoinedController.add(data);
    });

    // New messages
    socket?.on('new_message', (data) {
      debugPrint('New message: ${data['_id']}');
      final message = ChatMessageModel.fromJson(data);
      _newMessageController.add(message);
    });

    // Typing indicators
    socket?.on('user_typing', (data) {
      debugPrint('Typing: ${data['userId']}');
      _typingController.add(data);
    });

    // Message status updates
    socket?.on('message_status_update', (data) {
      debugPrint('Status update: ${data['status']}');
      _statusUpdateController.add(data);
    });

    // Participants online status
    socket?.on('participants_status', (data) {
      debugPrint('Participants status: $data');
      _participantsStatusController.add(List<Map<String, dynamic>>.from(data));
    });

    // Participant switched
    socket?.on('participant_switched', (data) {
      debugPrint('Participant switched: ${data['activeParticipantId']}');
      _participantSwitchedController.add(data);
    });

    // Room closed
    socket?.on('room_closed', (data) {
      debugPrint('Room closed: ${data['roomId']}');
      _roomClosedController.add(data['roomId']);
    });

    // Errors
    socket?.on('error', (data) {
      debugPrint('Socket error: ${data['message']}');
    });

    // User status changes (global)
    socket?.on('user_status_change', (data) {
      debugPrint('User status: ${data['userId']} - ${data['online']}');
    });
  }

  // Join chat room
  static void joinRoom(String roomId) {
    socket?.emit('join_room', {'roomId': roomId});
  }

  static Future<bool> sendMessage({
    required String roomId,
    required String messageType, 
    String? content,
    String? mediaUrl,
    int? mediaDuration,
  }) async {
    if (socket?.connected != true) return false;

    final data = {
      'roomId': roomId,
      'messageType': messageType,
    };
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

  // Typing indicator
  static void sendTyping(String roomId, bool isTyping) {
    socket?.emit('typing', {'roomId': roomId, 'isTyping': isTyping});
  }

  // Message delivered acknowledgment
  static void messageDelivered(List<String> messageIds) {
    socket?.emit('message_delivered', {'messageIds': messageIds});
  }

  // Message seen acknowledgment
  static void messageSeen(String roomId, List<String> messageIds) {
    socket?.emit('message_seen', {'roomId': roomId, 'messageIds': messageIds});
  }

  // Switch participant
  static void switchParticipant(String roomId, String participantId, String participantType) {
    socket?.emit('switch_participant', {
      'roomId': roomId,
      'participantId': participantId,
      'participantType': participantType,
    });
  }

  // Close room
  static void closeRoom(String roomId) {
    socket?.emit('close_room', {'roomId': roomId});
  }

  static void disconnect() {
    socket?.disconnect();
  }

  static bool get isConnected => socket?.connected ?? false;
}
