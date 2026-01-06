import 'dart:async';
import 'package:mysafety_web/core/model/chat/response/chat_history_response_model/chat_history_response_model.dart';
import 'package:mysafety_web/core/network/socket/web_socket.dart';

class ChatSocketManager {
  ChatSocketManager._();
  static final instance = ChatSocketManager._();

  Stream<ChatHistoryResponseModel> get messages =>
      WebSocketService.newMessageStream;

  Stream<bool> get typing =>
      WebSocketService.typingStream.map(
        (e) => e['isTyping'] ?? false,
      );

  Stream<Map<String, dynamic>> get status =>
      WebSocketService.statusUpdateStream;

  Future<void> connect(String roomId) async {
    await WebSocketService.connect();
    WebSocketService.joinRoom(roomId);
  }

  Future<void> sendText({
    required String roomId,
    required String text,
  }) {
    return WebSocketService.sendMessage(
      roomId: roomId,
      messageType: 'Text',
      content: text,
    );
  }

  void sendTyping(String roomId, bool isTyping) {
    WebSocketService.sendTyping(roomId, isTyping);
  }

  void messageDelivered(List<String> ids) {
    WebSocketService.messageDelivered(ids);
  }

  void messageSeen(String roomId, List<String> ids) {
    WebSocketService.messageSeen(roomId, ids);
  }
}
