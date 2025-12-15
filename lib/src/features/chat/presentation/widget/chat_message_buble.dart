import 'package:flutter/material.dart';
import 'package:mysafety_design_system/design_system/design_system.dart';

class ChatMessageBubble extends StatelessWidget {
  final String text;
  final bool isSentByMe;
  final String? time;
  final String? avatarUrl;
  final bool showAvatar;
  final bool? isRead;
  final bool? isSent;
  final String? imageUrl;

  const ChatMessageBubble({
    super.key,
    required this.text,
    required this.isSentByMe,
    this.time,
    this.avatarUrl,
    this.showAvatar = false,
    this.imageUrl,
    this.isRead,
    this.isSent,
  });

  @override
  Widget build(BuildContext context) {
    final bubbleColor = isSentByMe ? AppColors.primary : AppColors.grey81;
    final textColor = isSentByMe ? Colors.white : AppColors.black;

    return Padding(
      padding: EdgeInsets.only(
        left: isSentByMe ? 40 : 12,
        right: isSentByMe ? 12 : 40,
        top: 6,
        bottom: 0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isSentByMe && showAvatar)
            CircleAvatar(
              radius: 17,
              backgroundImage: NetworkImage(avatarUrl ?? ''),
            ),
          if (!isSentByMe && showAvatar) BrandHSpace.gap6(),
          Expanded(
            child: Column(
              crossAxisAlignment: isSentByMe
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                if (imageUrl != null)
                  Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        imageUrl!,
                        width: 140,
                        height: 110,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                Container(
                  decoration: BoxDecoration(
                    color: bubbleColor,
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(13),
                      topRight: const Radius.circular(13),
                      bottomLeft: Radius.circular(isSentByMe ? 13 : 2),
                      bottomRight: Radius.circular(isSentByMe ? 2 : 13),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: BrandText.primary(
                    data: text,
                    fontColor: textColor,
                    fontSize: 15,
                  ),
                ),
                BrandVSpace.gap4(),
                if (time != null || isSentByMe)
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: isSentByMe
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                    children: [
                      if (time != null)
                        BrandText.secondary(
                          data: time!,
                          fontSize: 12,
                          fontColor: AppColors.grey81,
                        ),
                      if (isSentByMe) BrandHSpace.gap4(),
                      if (isSentByMe)
                        Icon(
                          isRead! ? Icons.done_all : Icons.done,
                          size: 16,
                          color: isRead! ? Colors.blue : Colors.grey,
                        ),
                    ],
                  ),
              ],
            ),
          ),
          if (isSentByMe) BrandHSpace.gap6(),
          if (isSentByMe && showAvatar)
            CircleAvatar(
              radius: 15,
              backgroundImage: NetworkImage(avatarUrl ?? ''),
            ),
        ],
      ),
    );
  }
}
