import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mysafety_web/core/model/chat/response/chat_history_response_model/chat_history_response_model.dart';
import 'package:mysafety_web/core/network/socket/web_socket.dart';

final oneToOneChatControllerProvider =
    StateNotifierProvider<
      OneToOneChatController,
      List<ChatHistoryResponseModel>
    >((ref) => OneToOneChatController(ref));

class OneToOneChatController
    extends StateNotifier<List<ChatHistoryResponseModel>> {
  OneToOneChatController(this.ref) : super([]);

  final Ref ref;

  StreamSubscription? _messageSub;
  StreamSubscription? _typingSub;
  StreamSubscription? _statusSub;

  bool isOtherTyping = false;
  String? roomId;

  Future<void> connect(String room) async {
    roomId = room;

    await WebSocketService.connect();
    WebSocketService.joinRoom(room);

    _listenMessages();
    _listenTyping();
    _listenStatus();
  }

  void _listenMessages() {
    _messageSub = WebSocketService.newMessageStream.listen((message) {
      state = [...state, message];

      if (message.senderType != "Visitor" && message.id != null) {
        WebSocketService.messageDelivered([message.id!]);
      }

      _markSeen();
    });
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

  Future<void> sendText(String text) {
    if (roomId == null) return Future.value();
    return WebSocketService.sendMessage(
      roomId: roomId!,
      messageType: 'Text',
      content: text,
    );
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
    _messageSub?.cancel();
    _typingSub?.cancel();
    _statusSub?.cancel();
    super.dispose();
  }
}
