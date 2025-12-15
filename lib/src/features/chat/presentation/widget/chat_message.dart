import 'package:flutter/material.dart';
import 'package:mysafety_design_system/design_system/design_system.dart';
import 'package:mysafety_web/src/features/chat/presentation/widget/chat_message_buble.dart';

class ChatMessageList extends StatefulWidget {
  final bool? isSentByMe;
  final String? newMessage;
  final ScrollController? controller;

  const ChatMessageList({super.key, this.controller, this.newMessage, this.isSentByMe});

  @override
  State<ChatMessageList> createState() => _ChatMessageListState();
}

class _ChatMessageListState extends State<ChatMessageList> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = widget.controller ?? ScrollController();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      color: AppColors.white,
      child: ListView(
        controller: _scrollController,
        padding: const EdgeInsets.symmetric(vertical: 18),
        children: [
          if (widget.newMessage != null && widget.newMessage!.isNotEmpty)
            ChatMessageBubble(
              isSentByMe: widget.isSentByMe!,
              text: widget.newMessage!,
              // Example usage if you add back full message model:
              // isSentByMe: msg.senderId == profileProvider.filledPageData?.userId,
              // time: msg.time ?? '',
              // avatarUrl: msg.avatarUrl,
              // showAvatar: !(msg.isSentByMe ?? false),
              // imageUrl: msg.imageUrl,
              // isRead: msg.isRead ?? false,
              // isSent: msg.isSent ?? false,
            )
          else
            const Center(
              child: Text(
                "No messages yet",
                style: TextStyle(color: Colors.grey),
              ),
            ),
        ],
      ),
    );
  }
}
