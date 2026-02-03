import 'package:flutter/material.dart';
import 'package:mysafety_design_system/design_system/design_system.dart';

class ChatInputBar extends StatelessWidget {
  final VoidCallback onSend;
  final VoidCallback onMediaTap;
  final Function(bool) onTyping;
  final bool isOtherTyping;
  final TextEditingController chatController;
  final FocusNode? chatFocusNode;
  final VoidCallback onAudioTap;

  const ChatInputBar({
    super.key,
    required this.onSend,
    required this.onAudioTap,
    required this.onMediaTap,
    required this.onTyping,
    required this.isOtherTyping,
    required this.chatController,
    this.chatFocusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Typing indicator
          if (isOtherTyping)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  const Icon(
                    Icons.edit_outlined,
                    size: 18,
                    color: AppColors.grey8D,
                  ),
                  BrandHSpace.gap8(),
                  Text(
                    'Typing...',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.grey8D,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),

          // Input row
          Row(
            children: [
              // Media attachment
              IconButton(
                icon: const Icon(Icons.attach_file, color: AppColors.grey8D),
                onPressed: onMediaTap,
                tooltip: 'Attach media',
              ),

              // Text input
              Expanded(
                child: BrandTextField(
                  controller: chatController,
                  maxLines: null,
                  textStyle: const TextStyle(
                    color: AppColors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: InputDecoration(
                    hintText: isOtherTyping
                        ? "They are typing..."
                        : "Write your message",
                    hintStyle: TextStyle(color: AppColors.grey8D),
                    filled: true,
                    fillColor: AppColors.greyf6,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: BorderSide(
                        color: AppColors.primary,
                        width: 2,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 16,
                    ),
                  ),
                ),
              ),

              BrandHSpace.gap8(),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                child: IconButton(
                  icon: Icon(Icons.send, color: AppColors.primary),
                  onPressed: onSend,

                  tooltip: chatController.text.trim().isNotEmpty
                      ? 'Send message'
                      : 'Record audio',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
