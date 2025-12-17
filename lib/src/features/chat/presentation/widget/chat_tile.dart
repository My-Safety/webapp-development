import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mysafety_design_system/design_system/design_system.dart';

class ChatTile extends StatelessWidget {
  final bool isIncoming;
  final String messages;
  final String? imgUrl;
  final String? timeStamp;
  final String? fileUrl;
  final String? status;
  final String? name;

  const ChatTile({
    super.key,
    required this.isIncoming,
    required this.messages,
    this.imgUrl,
    this.timeStamp,
    this.fileUrl,
    this.status,
    this.name,
  });

  @override
  Widget build(BuildContext context) {
    final bubbleColor = isIncoming ? AppColors.greyFD : AppColors.grey8B;
    final textColor = isIncoming ? AppColors.black : Colors.white;

    return Padding(
      padding: EdgeInsets.only(
        left: isIncoming ? 12 : 48,
        right: isIncoming ? 48 : 12,
        top: 6,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: isIncoming
            ? MainAxisAlignment.start
            : MainAxisAlignment.end,
        children: [
          if (isIncoming && imgUrl != null) ...[
            CircleAvatar(
              radius: 16,
              backgroundColor: AppColors.greyCF,
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: imgUrl!,
                  width: 32,
                  height: 32,
                  fit: BoxFit.cover,
                  errorWidget: (_, __, ___) =>
                      Icon(Icons.person, size: 20, color: AppColors.grey7D),
                ),
              ),
            ),
            const SizedBox(width: 8),
          ],

          Flexible(
            child: Column(
              crossAxisAlignment: isIncoming
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.end,
              children: [
                /// Bubble
                Container(
                  constraints: const BoxConstraints(maxWidth: 280),
                  padding: EdgeInsets.symmetric(
                    horizontal: fileUrl != null ? 4 : 12,
                    vertical: fileUrl != null ? 4 : 8,
                  ),
                  decoration: BoxDecoration(
                    color: bubbleColor,
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(14),
                      topRight: const Radius.circular(14),
                      bottomLeft: Radius.circular(isIncoming ? 4 : 14),
                      bottomRight: Radius.circular(isIncoming ? 14 : 4),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (isIncoming && name != null)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 2),
                          child: BrandText.primary(
                            data: name!,
                            fontSize: 12,
                            fontColor: AppColors.blue,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                      if (messages.isNotEmpty)
                        BrandText.primary(
                          data: messages,
                          fontSize: 13,
                          textStyle: TextStyle(color: textColor, height: 1.3),
                        ),

                      if (fileUrl != null) ...[
                        const SizedBox(height: 6),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            imageUrl: fileUrl!,
                            width: 220,
                            height: 260,
                            fit: BoxFit.cover,
                            errorWidget: (_, __, ___) => Container(
                              width: 220,
                              height: 260,
                              color: AppColors.greyCF,
                              child: Icon(
                                Icons.broken_image,
                                size: 40,
                                color: AppColors.grey8B,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),

                const SizedBox(height: 4),

                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    BrandText.grey(
                      data: timeStamp ?? '',
                      fontSize: 9,
                      fontColor: AppColors.greyCF,
                      fontWeight: FontWeight.w600,
                    ),
                    if (!isIncoming) ...[
                      const SizedBox(width: 4),
                      Icon(
                        status == 'seen'
                            ? Icons.done_all
                            : status == 'delivered'
                            ? Icons.done_all
                            : Icons.done,
                        size: 12,
                        color: status == 'seen'
                            ? Colors.blue
                            : AppColors.greyCF,
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
