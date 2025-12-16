// ignore_for_file: use_build_context_synchronously
// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Adwaith c, 16/12/2025


import 'dart:async';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mysafety_design_system/design_system/design_system.dart';
import 'package:mysafety_web/core/network/socket/web_socket.dart';
import 'package:mysafety_web/src/features/chat/presentation/widget/chat_input_bar.dart';
import 'package:mysafety_web/src/features/chat/presentation/widget/chat_screen_appbar.dart';
import 'package:mysafety_web/src/features/chat/presentation/widget/chat_tile.dart';
import 'package:mysafety_web/util/formator/date_formator.dart';

class OneToOneChatScreen extends StatefulWidget {
  final String? roomId;
  final String? userName;
  final String? avatarUrl;

  const OneToOneChatScreen({
    super.key,
    this.roomId = '6940f72ba2d22f17d7a43168',
    this.userName = "Asok",
    this.avatarUrl = '',
  });

  @override
  State<OneToOneChatScreen> createState() => _OneToOneChatScreenState();
}

class _OneToOneChatScreenState extends State<OneToOneChatScreen>
    with WidgetsBindingObserver {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final FocusNode _chatFocusNode = FocusNode();
  final ImagePicker _picker = ImagePicker();

  final ValueNotifier<List<ChatMessageModel>> _messages = ValueNotifier([]);

  bool _isOtherTyping = false;

  StreamSubscription? _newMessageSub;
  StreamSubscription? _typingSub;
  StreamSubscription? _roomClosedSub;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _chatFocusNode.requestFocus();
    _connectWebSocket();
  }

  Future<void> _connectWebSocket() async {
    await WebSocketService.connect();

    WebSocketService.joinRoom(widget.roomId!);

    _newMessageSub = WebSocketService.newMessageStream.listen((message) {
      _messages.value = [..._messages.value, message];
      _scrollToBottom();
    });

    _typingSub = WebSocketService.typingStream.listen((data) {
      _isOtherTyping = data['isTyping'] ?? false;
    });

    _roomClosedSub = WebSocketService.roomClosedStream.listen((_) {
      if (mounted) {
        // ScaffoldMessenger.of(
        //   context,
        // ).showSnackBar(const SnackBar(content: Text('Chat room closed')));
        // Navigator.of(context).pop();
      }
    });
  }

  Future<void> _sendText() async {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    final success = await WebSocketService.sendMessage(
      roomId: widget.roomId!,
      messageType: 'Text',
      content: text,
    );

    if (success) {
      _controller.clear();
    }
  }

  Future<void> _pickImage() async {
    try {
      final image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {}
    } catch (_) {}
  }

  void _sendTyping(bool isTyping) {
    WebSocketService.sendTyping(widget.roomId!, isTyping);
  }

  Future<void> _scrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 200));
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    if (MediaQuery.of(context).viewInsets.bottom > 0) {
      _scrollToBottom();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _newMessageSub?.cancel();
    _typingSub?.cancel();
    _roomClosedSub?.cancel();
    _controller.dispose();
    _scrollController.dispose();
    _chatFocusNode.dispose();
    _messages.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      backgroundColor: AppColors.primary,
      child: Expanded(
        child: Scaffold(
          backgroundColor: AppColors.primary,
          body: Column(
            children: [
              ChatScreenAppBar(
                avatarUrl: widget.avatarUrl!,
                userName: widget.userName!,
                status: _isOtherTyping ? 'typing...' : 'online',
              ),
              Expanded(
                child: ValueListenableBuilder<List<ChatMessageModel>>(
                  valueListenable: _messages,
                  builder: (_, messages, _) {
                    return ListView.builder(
                      shrinkWrap: true,
                      controller: _scrollController,
                      padding: const EdgeInsets.all(16),
                      itemCount: messages.length,
                      itemBuilder: (_, index) {
                        final msg = messages[index];
                        // final isIncoming =
                        //     msg.senderId != ChatManager().currentUserId;
                        return ChatTile(
                          isIncoming: true,
                          imgUrl: widget.avatarUrl,
                          timeStamp: DateFormats.time12A.format(
                            msg.createdAt.toLocal(),
                          ),
                          messages: msg.content ?? '',
                          fileUrl: msg.mediaUrl,
                        );
                      },
                    );
                  },
                ),
              ),
              ChatInputBar(
                chatController: _controller,
                onSend: _sendText,
                onTyping: _sendTyping,
                isOtherTyping: _isOtherTyping,
                onMediaTap: _pickImage,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
