// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mysafety_design_system/design_system/design_system.dart';
import 'package:mysafety_web/src/features/chat/presentation/provider/chat_provider.dart';
import 'package:mysafety_web/src/features/chat/presentation/widget/chat_input_bar.dart';
import 'package:mysafety_web/src/features/chat/presentation/widget/chat_screen_appbar.dart';
import 'package:mysafety_web/src/features/chat/presentation/widget/chat_tile.dart';
import 'package:mysafety_web/src/features/profile/presentation/provider/profile_provider.dart';
import 'package:mysafety_web/util/formator/date_formator.dart';

class OneToOneChatScreen extends ConsumerStatefulWidget {
  const OneToOneChatScreen({super.key});

  @override
  ConsumerState<OneToOneChatScreen> createState() => _OneToOneChatScreenState();
}

class _OneToOneChatScreenState extends ConsumerState<OneToOneChatScreen> {
  final _controller = TextEditingController();
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    final profile = ref.read(profileProvider);
    final roomId = profile.qrScanResponse?.chatRoom?.id;

    if (roomId != null) {
      ref.read(oneToOneChatControllerProvider.notifier).connect(roomId);
    }
  }

  @override
  Widget build(BuildContext context) {
    final messages = ref.watch(oneToOneChatControllerProvider);
    final controller = ref.read(oneToOneChatControllerProvider.notifier);

    final visitorName =
        ref.read(profileProvider).resolveQrResponse?.qr?.ownerId?.name ?? '';

    return BaseLayout(
      backgroundColor: AppColors.primary,
      child: Expanded(
        child: Scaffold(
          backgroundColor: AppColors.primary,
          body: Column(
            children: [
              ChatScreenAppBar(
                avatarUrl: '',
                userName: visitorName,
                status: controller.isOtherTyping ? 'typing...' : 'online',
              ),
              Expanded(
                child: ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.all(16),
                  itemCount: messages.length,
                  itemBuilder: (_, index) {
                    final msg = messages[index];

                    return ChatTile(
                      isIncoming: msg.senderType != "Visitor",
                      messages: msg.content ?? '',
                      timeStamp: msg.createdAt != null
                          ? DateFormats.formatTime(msg.createdAt!)
                          : null,
                      status: msg.status,
                      name: msg.senderDetails?.name ?? '',
                      fileUrl: msg.messageType == 'Image' ? msg.mediaUrl : null,
                      imgUrl: '',
                    );
                  },
                ),
              ),
              ChatInputBar(
                chatController: _controller,
                onSend: () async {
                  final text = _controller.text.trim();
                  if (text.isEmpty) return;
                  await controller.sendText(text);
                  _controller.clear();
                },
                onTyping: controller.sendTyping,
                isOtherTyping: controller.isOtherTyping,
                onAudioTap: () {},
                onMediaTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}
