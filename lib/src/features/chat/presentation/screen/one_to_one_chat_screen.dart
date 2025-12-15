// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mysafety_design_system/design_system/design_system.dart';
import 'package:mysafety_web/core/network/socket/web_socket.dart';
import 'package:mysafety_web/route/navigation_service.dart';
import 'package:mysafety_web/src/features/chat/presentation/widget/chat_input_bar.dart';
import 'package:mysafety_web/src/features/chat/presentation/widget/chat_screen_appbar.dart';
import 'package:mysafety_web/src/features/chat/presentation/widget/chat_tile.dart';
import 'package:mysafety_web/src/features/chat/presentation/widget/shimmer_loader.dart';
import 'package:mysafety_web/util/chat/chat_manager.dart';
import 'package:mysafety_web/util/formator/date_formator.dart';

class OneToOneChatScreen extends StatefulWidget {
  const OneToOneChatScreen({super.key});

  @override
  State<OneToOneChatScreen> createState() => _OneToOneChatScreenState();
}

class _OneToOneChatScreenState extends State<OneToOneChatScreen>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  final _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final FocusNode _chatFocusNode = FocusNode();
  final ImagePicker _picker = ImagePicker();

  // Subscriptions
  StreamSubscription? _newMessageSubscription;
  StreamSubscription? _roomJoinedSubscription;
  StreamSubscription? _typingSubscription;
  StreamSubscription? _statusUpdateSubscription;
  StreamSubscription? _roomClosedSubscription;

  bool _isTyping = false;
  List<ChatMessageModel> _messages = [];
  bool _isLoading = true;
  String? _roomId;
  bool _roomJoined = false;

  String? _avatarUrl, _userName, _userStatus;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _chatFocusNode.requestFocus();
    _initChat();
  }

  Future<void> _initChat() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _setupParticipantInfo();
      await WebSocketService.connect();
      _setupListeners();
    });
  }

  void _setupParticipantInfo() {
    // if (widget.routeArgs != null && widget.routeArgs is Map<String, dynamic>) {
    //   _userName = widget.routeArgs["name"];
    //   _userStatus = widget.routeArgs["status"];
    //   _avatarUrl = widget.routeArgs["avatar"];
    //   _roomId = widget.routeArgs["roomId"];
    // }
  }

  void _setupListeners() {
    // Listen for room joined (initial messages + room data)
    _roomJoinedSubscription = WebSocketService.roomJoinedStream.listen((data) {
      setState(() {
        _roomId = data['room']?['_id'];
        _roomJoined = true;
        _isLoading = false;
        // Add initial messages from room_joined
        final messages = List<Map<String, dynamic>>.from(
          data['messages'] ?? [],
        );
        _messages = messages.reversed
            .map((m) => ChatMessageModel.fromJson(m))
            .toList();
      });
      _scrollToBottom();
    });

    // New messages
    _newMessageSubscription = WebSocketService.newMessageStream.listen((
      message,
    ) {
      setState(() {
        _messages.add(message);
      });
      _scrollToBottom();
      ChatManager().addMessage(message: message);
    });

    // Typing indicators
    _typingSubscription = WebSocketService.typingStream.listen((data) {
      setState(() {
        _isTyping = data['isTyping'];
      });
    });

    // Message status updates
    _statusUpdateSubscription = WebSocketService.statusUpdateStream.listen((
      data,
    ) {
      final status = data['status'];
      final messageIds = List<String>.from(data['messageIds'] ?? []);

      setState(() {
        for (var messageId in messageIds) {
          final index = _messages.indexWhere((m) => m.id == messageId);
          if (index != -1) {
            switch (status) {
              case 'Delivered':
                _messages[index] = ChatMessageModel(
                  id: _messages[index].id,
                  roomId: _messages[index].roomId,
                  senderId: _messages[index].senderId,
                  senderType: _messages[index].senderType,
                  messageType: _messages[index].messageType,
                  content: _messages[index].content,
                  mediaUrl: _messages[index].mediaUrl,
                  mediaDuration: _messages[index].mediaDuration,
                  status: 'Delivered',
                  createdAt: _messages[index].createdAt,
                );
                break;
              case 'Seen':
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
                break;
            }
          }
        }
      });
    });

    // Room closed
    _roomClosedSubscription = WebSocketService.roomClosedStream.listen((
      roomId,
    ) {
      if (mounted) {
        NavigationService.showSnackbar('Chat room closed');
        context.pop();
      }
    });

    // Join room after listeners are set
    if (_roomId != null) {
      WebSocketService.joinRoom(_roomId!);
    }
  }

  // bool get _isIncomingMessage => _messages.isNotEmpty &&
  //     _messages.last.senderId != ChatManager().userId;

  Future<void> _sendTextMessage() async {
    final message = _controller.text.trim();
    if (message.isEmpty) return;

    final success = await WebSocketService.sendMessage(
      roomId: _roomId!,
      messageType: 'Text',
      content: message,
    );

    if (success) {
      _controller.clear();
      _chatFocusNode.unfocus();
    } else {
      NavigationService.showErrorSnackbar(message: 'Failed to send message');
    }
  }

  Future<void> _pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        // // Upload image first, then send URL
        // final uploadUrl = await ChatManager().uploadMedia(image.path);
        // if (uploadUrl != null) {
        //   await _sendMediaMessage(uploadUrl);
        // }
      }
    } catch (e) {
      NavigationService.showErrorSnackbar();
    }
  }

  Future<void> _scrollToBottom({bool delayed = true}) async {
    await Future.delayed(Duration(milliseconds: delayed ? 300 : 100));
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  void _handleTyping(bool isTyping) {
    WebSocketService.sendTyping(_roomId!, isTyping);
  }

  // void _markMessagesAsSeen() {
  //   final unseenMessageIds = _messages
  //       .where((m) => m.status != 'Seen')
  //       .map((m) => m.id)
  //       .toList();

  //   if (unseenMessageIds.isNotEmpty) {
  //     WebSocketService.messageSeen(_roomId!, unseenMessageIds);
  //   }
  // }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    if (MediaQuery.of(context).viewInsets.bottom > 0) {
      _scrollToBottom(delayed: false);
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _newMessageSubscription?.cancel();
    _roomJoinedSubscription?.cancel();
    _typingSubscription?.cancel();
    _statusUpdateSubscription?.cancel();
    _roomClosedSubscription?.cancel();
    _controller.dispose();
    _scrollController.dispose();
    _chatFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseLayout(backgroundColor: AppColors.primary,
      child: Expanded(
        child: Scaffold(backgroundColor: AppColors.primary,
          resizeToAvoidBottomInset: true,
          body: Column(
            children: [
              ChatScreenAppBar(
                avatarUrl: _avatarUrl ?? '',
                userName: _userName ?? 'Chat',
                status: _userStatus ?? 'offline',
              ),
              // if (_isLoading)
              //   const Expanded(child: ChatShimmerLoader())
              // else if (!_roomJoined)
              //   const Expanded(
              //     child: Center(child: CircularProgressIndicator()),
              //   )
              // else
                Expanded(
                  child: Container(
                    color: AppColors.primary,
                    child: ListView.builder(
                      controller: _scrollController,
                      padding: const EdgeInsets.all(16),
                      itemCount: _messages.length,
                      itemBuilder: (context, index) {
                        final message = _messages[index];
                        return ChatTile(
                          isIncoming: true,
                          imgUrl: _avatarUrl,

                          timeStamp: DateFormats.time12A.format(
                            message.createdAt.toLocal(),
                          ),
                          messages: message.content ?? '',
                          fileUrl: message.mediaUrl,
                          // messageType: message.messageType,
                          // status: message.status,
                          // onLongPress: () => _markMessagesAsSeen(),
                        );
                      },
                    ),
                  ),
                ),
              ChatInputBar(
                chatController: _controller,
                onSend: _sendTextMessage,
                onTyping: _handleTyping,
                isOtherTyping: _isTyping,
                onMediaTap: _pickImage,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
