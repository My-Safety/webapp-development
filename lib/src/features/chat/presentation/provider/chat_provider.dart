import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mysafety_web/core/model/chat/response/chat_history_response_model/chat_history_response_model.dart';
import 'package:mysafety_web/core/network/socket/web_socket.dart';
import 'package:mysafety_web/util/utils.dart';
import 'package:mysafety_web/util/lifecycle/web_lifecycle_manager.dart';

final oneToOneChatControllerProvider =
    StateNotifierProvider<
      OneToOneChatController,
      List<ChatHistoryResponseModel>
    >((ref) => OneToOneChatController(ref));

final selectedMessageIndexProvider = StateProvider<int?>((ref) => null);

class OneToOneChatController
    extends StateNotifier<List<ChatHistoryResponseModel>> {
  OneToOneChatController(this.ref) : super([]);

  final Ref ref;

  StreamSubscription? _messageSub;
  StreamSubscription? _typingSub;
  StreamSubscription? _statusSub;

  bool isOtherTyping = false;
  String? roomId;
  DateTime? _lastSendTime;

  Future<void> connect(String room) async {
    if (roomId == room && _messageSub != null && WebSocketService.isConnected) {
      debugPrint('✅ Already connected to room: $room');
      return;
    }

    // Disconnect existing listeners first
    disconnect();
    
    roomId = room;
    debugPrint('🔵 Connecting to room: $room');

    // Set room for lifecycle management
    WebLifecycleManager.instance.setCurrentRoom(room);

    try {
      await WebSocketService.connect();
      WebSocketService.joinRoom(room);
      
      // Small delay to ensure room join is processed
      await Future.delayed(const Duration(milliseconds: 300));
      
      _listenMessages();
      _listenTyping();
      _listenStatus();
      
      debugPrint('✅ Chat connected and listening');
    } catch (e) {
      debugPrint('🔴 Failed to connect: $e');
      // Don't rethrow auth errors to prevent multiple connection attempts
      if (!e.toString().contains('Authentication')) {
        rethrow;
      }
    }
  }

  Future<void> listenChatSoket() async {
    _listenMessages();
    _listenTyping();
    _listenStatus();

    debugPrint('✅ Chat listeners active');
  }

  void disconnect() {
    _messageSub?.cancel();
    _typingSub?.cancel();
    _statusSub?.cancel();
    _messageSub = null;
    _typingSub = null;
    _statusSub = null;
    roomId = null;
  }

  void _listenMessages() {
    _messageSub?.cancel();
    _messageSub = WebSocketService.newMessageStream.listen((message) {
      debugPrint('📥 New message received: ${message.content}');
      state = [...state, message];

      if (message.senderType != "Visitor" && message.id != null) {
        WebSocketService.messageDelivered([message.id!]);
      }

      _markSeen();
    }, onError: (error) => debugPrint('🔴 Message stream error: $error'));
    debugPrint('👂 Message listener active');
  }

  void _listenTyping() {
    _typingSub = WebSocketService.typingStream.listen((data) {
      isOtherTyping = data['isTyping'] ?? false;
    });
  }

  void _listenStatus() {
    _statusSub = WebSocketService.statusUpdateStream.listen((data) {
      final ids = data['messageIds'];
      final status = data['status'];

      if (ids == null || status == null) return;

      state = state
          .map(
            (m) => ids.contains(m.id)
                ? m.copyWith(status: status.toString().toLowerCase())
                : m,
          )
          .toList();
    });
  }

  Future<void> sendText(String text, {int? messageIndex}) async {
    if (messageIndex != null) {
      ref.read(selectedMessageIndexProvider.notifier).state = messageIndex;
    }


    if (roomId == null) {
      debugPrint('🔴 Cannot send - roomId is null');
      return;
    }

    final now = DateTime.now();
    if (_lastSendTime != null &&
        now.difference(_lastSendTime!).inMilliseconds < 500) {
      debugPrint('⚠️ Message send debounced');
      return;
    }

    _lastSendTime = now;
    debugPrint('📤 Sending message to room $roomId: $text');

    // Check connection before sending
    if (!WebSocketService.isConnected) {
      debugPrint('⚠️ Socket disconnected, attempting to reconnect...');
      try {
        await connect(roomId!);
      } catch (e) {
        debugPrint('🔴 Reconnect failed: $e');
        return;
      }
    }

    final success = await WebSocketService.sendMessage(
      roomId: roomId!,
      messageType: 'Text',
      content: text,
    );

    debugPrint(success ? '✅ Message sent' : '🔴 Send failed');
  }

  void sendTyping(bool typing) {
    if (roomId == null) return;
    WebSocketService.sendTyping(roomId!, typing);
  }

  void _markSeen() {
    final unseen = state
        .where(
          (m) =>
              m.senderType != "Visitor" && m.status != 'seen' && m.id != null,
        )
        .map((m) => m.id!)
        .toList();

    if (unseen.isNotEmpty && roomId != null) {
      WebSocketService.messageSeen(roomId!, unseen);
    }
  }

  @override
  void dispose() {
    disconnect();
    super.dispose();
  }
}
