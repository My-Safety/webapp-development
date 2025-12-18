// ignore_for_file: use_build_context_synchronously
// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd.
// Created By Adwaith c, 16/12/2025

import 'dart:async';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mysafety_design_system/design_system/design_system.dart';
import 'package:mysafety_web/core/model/chat/response/chat_history_response_model/chat_history_response_model.dart';
import 'package:mysafety_web/core/network/socket/web_socket.dart';
import 'package:mysafety_web/src/features/chat/presentation/provider/chat_provider.dart';
import 'package:mysafety_web/src/features/chat/presentation/widget/chat_input_bar.dart';
import 'package:mysafety_web/src/features/chat/presentation/widget/chat_screen_appbar.dart';
import 'package:mysafety_web/src/features/chat/presentation/widget/chat_tile.dart';
import 'package:mysafety_web/src/features/profile/presentation/provider/profile_provider.dart';
import 'package:mysafety_web/util/formator/date_formator.dart';
import 'package:record/record.dart';
class OneToOneChatScreen extends ConsumerStatefulWidget {
  const OneToOneChatScreen({super.key});

  @override
  ConsumerState<OneToOneChatScreen> createState() => _OneToOneChatScreenState();
}

class _OneToOneChatScreenState extends ConsumerState<OneToOneChatScreen>
    with WidgetsBindingObserver {
  final _controller = TextEditingController();
  final _scrollController = ScrollController();
  final _chatFocusNode = FocusNode();
  final _picker = ImagePicker();
  late ChatNotifierProvider provider;

  final ValueNotifier<List<ChatHistoryResponseModel>> _messages = ValueNotifier(
    [],
  );

  StreamSubscription? _newMessageSub;
  StreamSubscription? _typingSub;
  StreamSubscription? _statusUpdateSub;

  bool _isOtherTyping = false;
  String? _roomId;
  String? visitorName;
  String? _audioFilePath;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _chatFocusNode.requestFocus();

    final profileState = ref.read(profileProvider);
    _roomId = profileState.qrScanResponse?.chatRoom?.id;
    visitorName = profileState.resolveQrResponse?.qr?.ownerId?.name;

    if (_roomId != null) {
      _connectSocket();
    }
  }

  Future<void> _connectSocket() async {
    await WebSocketService.connect();
    WebSocketService.joinRoom(_roomId!);

    // NEW MESSAGE
    _newMessageSub = WebSocketService.newMessageStream.listen((message) {
      _messages.value = [..._messages.value, message];

      // Mark delivered for incoming messages
      if (message.senderType != "Visitor" && message.id != null) {
        WebSocketService.messageDelivered([message.id!]);
      }

      _scrollToBottom();
      _markMessagesSeen();
    });

    // TYPING
    _typingSub = WebSocketService.typingStream.listen((data) {
      _isOtherTyping = data['isTyping'] ?? false;
      setState(() {});
    });

    // STATUS UPDATE
    _statusUpdateSub = WebSocketService.statusUpdateStream.listen((data) {
      final List<dynamic>? messageIds = data['messageIds'];
      final status = data['status'];

      debugPrint(
        'MESSAGE STATUS UPDATE -> messageIds: $messageIds | status: $status',
      );

      if (messageIds == null || status == null) return;

      _messages.value = _messages.value.map((m) {
        if (messageIds.contains(m.id)) {
          return m.copyWith(status: status.toString().toLowerCase());
        }
        return m;
      }).toList();
    });
  }

  void _markMessagesSeen() {
    final unseen = _messages.value
        .where(
          (m) =>
              m.senderType != "Visitor" && m.status != 'seen' && m.id != null,
        )
        .map((m) => m.id!)
        .toList();

    if (unseen.isNotEmpty && _roomId != null) {
      WebSocketService.messageSeen(_roomId!, unseen);
    }
  }

  Future<void> _sendText() async {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    final success = await WebSocketService.sendMessage(
      roomId: _roomId!,
      messageType: 'Text',
      content: text,
    );

    if (success) _controller.clear();
  }

  Future<void> _pickAudio() async {
    if (_roomId == null) return;

    final result = await FilePicker.platform.pickFiles(type: FileType.audio);
    if (result == null || result.files.isEmpty) return;

    final file = result.files.first;
    final notifier = ref.read(chatProvider.notifier);

    notifier.setUploadFile = file;

    final success = await notifier.sendFileGetUrl();
    if (!success) {
      debugPrint('❌ Audio upload failed');
      return;
    }

    final uploadedFile = ref.read(chatProvider).uploadedFile;
    if (uploadedFile?.fileUrl == null) return;

    debugPrint('🎧 AUDIO URL: ${uploadedFile!.fileUrl}');

    await WebSocketService.sendMessage(
      roomId: _roomId!,
      messageType: 'Voice',
      mediaUrl: uploadedFile.fileUrl,
      mediaDuration: file.size ~/ 16000,
    );
  }

  Future<void> _pickImage() async {
    final picked = await _picker.pickImage(source: ImageSource.gallery);
    if (picked == null || _roomId == null) return;

    final platformFile = PlatformFile(
      name: picked.name,
      path: picked.path,
      size: await picked.length(),
    );

    final notifier = ref.read(chatProvider.notifier);

    // Set file
    notifier.setUploadFile = platformFile;

    // Upload
    final success = await notifier.sendFileGetUrl();
    if (!success) {
      // debugPrint('Image upload failed');
      return;
    }

    final uploadedFile = ref.read(chatProvider).uploadedFile;
    // debugPrint('✅ IMAGE URL: ${uploadedFile?.fileUrl}');

    await WebSocketService.sendMessage(
      roomId: _roomId!,
      messageType: 'Image',
      mediaUrl: uploadedFile!.fileUrl,
    );
  }

  void _sendTyping(bool isTyping) {
    WebSocketService.sendTyping(_roomId!, isTyping);
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
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _newMessageSub?.cancel();
    _typingSub?.cancel();
    _statusUpdateSub?.cancel();
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
                avatarUrl: '',
                userName: visitorName ?? '',
                status: _isOtherTyping ? 'typing...' : 'online',
              ),
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: _messages,
                  builder: (_, messages, __) {
                    return ListView.builder(
                      controller: _scrollController,
                      padding: const EdgeInsets.all(16),
                      itemCount: messages.length,
                      itemBuilder: (_, index) {
                        final msg = messages[index];
                        return ChatTile(
                          isIncoming: msg.senderType != "Visitor",
                          messages: msg.content ?? '',
                          timeStamp: DateFormats.formatTime(msg.createdAt),
                          status: msg.status,
                          name: msg.senderDetails?.name ?? '',
                          fileUrl: msg.messageType == 'Image'
                              ? msg.mediaUrl
                              : null,
                          imgUrl:
                              'https://imgs.search.brave.com/zS2iFJDpmWeWHCv2DAzSV2hmCHq4Kxm9kMiC9Ulugvw/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9oaXBz/LmhlYXJzdGFwcHMu/Y29tL2htZy1wcm9k/L2ltYWdlcy9iYWQt/YnVubnkta2VuZGFs/bC1qZW5uZXItZ2V0/dHlpbWFnZXMtMTY3/Njk5MTYxNS5qcGc_/Y3JvcD0wLjUwMnh3/OjEuMDB4aDswLjQ5/OHh3LDAmcmVzaXpl/PTM2MDoq',
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
                onAudioTap: _pickAudio, // 🔥 ADD
              ),
            ],
          ),
        ),
      ),
    );
  }
}
