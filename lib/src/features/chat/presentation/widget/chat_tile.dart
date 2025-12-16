import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mysafety_design_system/design_system/design_system.dart';

class ChatTile extends StatelessWidget {
  final bool isIncoming;
  final String messages;
  final String? imgUrl;
  final String? timeStamp;
  final String? fileUrl; // Add this param for image file URL

  const ChatTile({
    super.key,
    required this.isIncoming,
    required this.messages,
    this.imgUrl,
    this.timeStamp,
    this.fileUrl,
  });

  @override
  Widget build(BuildContext context) {
    final bubbleColor = isIncoming ? AppColors.greyFD : AppColors.grey8B;
    final textColor = isIncoming ? AppColors.black : Colors.white;

    return Padding(
      padding: EdgeInsets.only(
        left: isIncoming ? 12 : 40,
        right: isIncoming ? 40 : 12,
        top: 6,
        bottom: 0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: isIncoming
            ? MainAxisAlignment.start
            : MainAxisAlignment.end,
        children: [
          if (isIncoming && imgUrl != null)
            CircleAvatar(
              radius: 15,
              backgroundColor: AppColors.greyCF,
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: imgUrl!,
                  width: 30,
                  height: 30,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    color: AppColors.greyCF,
                    child: const Center(
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    color: AppColors.greyCF,
                    width: 30,
                    height: 30,
                    child: Icon(
                      Icons.person,
                      color: AppColors.grey7D,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ),
          const SizedBox(width: 8),
          Flexible(
            child: Column(
              crossAxisAlignment: isIncoming
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: bubbleColor,
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(13),
                      topRight: const Radius.circular(13),
                      bottomLeft: Radius.circular(isIncoming ? 2 : 13),
                      bottomRight: Radius.circular(isIncoming ? 13 : 2),
                    ),
                  ),
                  padding: fileUrl != null
                      ? const EdgeInsets.symmetric(horizontal: 3, vertical: 3)
                      : const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        ),
                  child: Column(
                    crossAxisAlignment: isIncoming
                        ? CrossAxisAlignment.start
                        : CrossAxisAlignment.end,
                    children: [
                      if (messages.isNotEmpty)
                        BrandText.primary(
                          data: messages,
                          textStyle: TextStyle(color: textColor),
                          fontSize: 15,
                        ),
                      if (fileUrl != null) ...[
                        // const BrandHSpace.gap10(),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            imageUrl: fileUrl!,
                            width: 200,
                            height: 300,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Container(
                              color: AppColors.greyCF,
                              child: const Center(
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) => Container(
                              color: AppColors.greyCF,
                              width: 200,
                              height: 300,
                              child: Icon(
                                Icons.broken_image,
                                color: AppColors.grey8B,
                                size: 50,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                BrandVSpace.gap4(),
                if (timeStamp != null)
                  BrandText.grey(
                    data: timeStamp!,
                    maxLines: 1,
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                    fontColor: AppColors.greyCF,
                  ),
              ],
            ),
          ),
          if (!isIncoming) const SizedBox(width: 12),
        ],
      ),
    );
  }
}
