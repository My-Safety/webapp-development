// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Adwaith c, 16/12/2025

import 'dart:async';
import 'package:mysafety_web/app_config.dart';
import 'package:mysafety_web/core/model/chat/response/chat_history_response_model/chat_history_response_model.dart';
import 'package:mysafety_web/util/auth/auth_manager.dart';
import 'package:mysafety_web/util/utils.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

abstract class WebSocketService {
  static io.Socket? socket;
  static bool _listenersSetUp = false;
  static String? _lastRoomId;
  static Timer? _reconnectTimer;
  static bool _isConnecting = false;

  static final StreamController<ChatHistoryResponseModel>
  _newMessageController = StreamController.broadcast();

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

  static final StreamController<Map<String, dynamic>> _callStartedController =
      StreamController.broadcast();

  static Stream<ChatHistoryResponseModel> get newMessageStream =>
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

  static Stream<Map<String, dynamic>> get callStartedStream =>
      _callStartedController.stream;

  static Future<void> connect() async {
    if (socket?.connected == true) {
      debugPrint('✅ Already connected');
      return;
    }

    if (_isConnecting) {
      debugPrint('⏳ Connection in progress, waiting...');
      // Wait for existing connection attempt
      int attempts = 0;
      while (_isConnecting && attempts < 50) {
        await Future.delayed(const Duration(milliseconds: 100));
        attempts++;
      }
      return;
    }

    _isConnecting = true;
    
    // Ensure token is fetched from storage
    await AuthManager().fetchToken();
    var token = AuthManager().token;
    
    // For web users without login, create a temporary visitor token
    if (token == null) {
      token = 'visitor_${DateTime.now().millisecondsSinceEpoch}';
      await AuthManager().setToken(token);
      debugPrint('📝 Created visitor token: $token');
    }
    
    debugPrint('🔌 Connecting to: $webSocket/chat');
    
    // Clean disconnect first
    if (socket != null) {
      socket!.disconnect();
      socket = null;
    }
    
    socket = io.io(
      '$webSocket/chat',
      io.OptionBuilder()
        .setTransports(['websocket'])
        .setTimeout(15000)
        .setAuth({"token": token})
        .build(),
    );

    final completer = Completer<void>();

    socket?.onConnect((_) {
      debugPrint('✅ Chat socket connected');
      _isConnecting = false;
      _setupEventListeners();
      _rejoinLastRoom();
      if (!completer.isCompleted) completer.complete();
    });

    socket?.onDisconnect((reason) {
      debugPrint('❌ Socket disconnected: $reason');
      _isConnecting = false;
      _listenersSetUp = false;
      if (reason != 'io client disconnect') {
        _scheduleReconnect();
      }
    });

    socket?.onConnectError((e) {
      debugPrint('❌ Connect error: $e');
      _isConnecting = false;
      if (e.toString().contains('Authentication failed')) {
        AuthManager().handleTokenExpiry();
      }
      if (!completer.isCompleted) completer.completeError(e);
    });

    socket?.onError((e) => debugPrint('❌ Socket error: $e'));
    
    socket?.connect();
    
    try {
      await completer.future.timeout(const Duration(seconds: 15));
    } catch (e) {
      debugPrint('❌ Connection timeout: $e');
      _isConnecting = false;
      socket?.disconnect();
      rethrow;
    }
  }

  static void _setupEventListeners() {
    if (socket == null || _listenersSetUp) return;

    _listenersSetUp = true;

    socket!.on('room_joined', (data) {
      _roomJoinedController.add(data);
    });

    socket!.on('new_message', (data) {
      debugPrint('Received new message: $data'); // debug
      final message = ChatHistoryResponseModel.fromJson(data);
      _newMessageController.add(message);
    });

    socket!.on('user_typing', (data) {
      _typingController.add(data);
    });

    socket!.on('message_status_update', (data) {
      debugPrint('RAW MESSAGE STATUS UPDATE FROM SOCKET: $data');
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
    socket!.on('call_started', (data) {
      debugPrint('Call started event received: $data');
      _callStartedController.add(data);
    });
  }

  static void joinRoom(String roomId) {
    _lastRoomId = roomId;
    socket?.emit('join_room', {'roomId': roomId});
    debugPrint('room joined : $roomId');
  }

  static void _rejoinLastRoom() {
    if (_lastRoomId != null) {
      debugPrint('🔄 Rejoining room: $_lastRoomId');
      joinRoom(_lastRoomId!);
    }
  }

  static void _scheduleReconnect() {
    _reconnectTimer?.cancel();
    _reconnectTimer = Timer(const Duration(seconds: 5), () {
      if (!isConnected) {
        debugPrint('🔄 Attempting reconnect...');
        connect().catchError((e) {
          debugPrint('🔴 Reconnect failed: $e');
        });
      }
    });
  }

  static Future<bool> sendMessage({
    required String roomId,
    required String messageType,
    String? content,
    String? mediaUrl,
    int? mediaDuration,
  }) async {
    if (socket?.connected != true) {
      debugPrint('🔴 Cannot send - socket not connected');
      // Try to reconnect
      try {
        await connect();
      } catch (e) {
        debugPrint('🔴 Reconnect failed: $e');
        return false;
      }
    }

    final data = {'roomId': roomId, 'messageType': messageType};
    if (content != null && content.isNotEmpty) data['content'] = content;
    if (mediaUrl != null) data['mediaUrl'] = mediaUrl;

    try {
      socket?.emit('send_message', data);
      debugPrint('📤 Message sent: $content');
      return true;
    } catch (e) {
      debugPrint('🔴 Send message error: $e');
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
    _reconnectTimer?.cancel();
    _reconnectTimer = null;
    if (socket != null) {
      socket!.disconnect();
      socket = null;
    }
    _listenersSetUp = false;
    _lastRoomId = null;
  }

  static bool get isConnected => socket?.connected ?? false;
}
