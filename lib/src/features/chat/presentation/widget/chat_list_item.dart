import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mysafety_design_system/design_system/design_system.dart';

class ChatListItem extends StatelessWidget {
  final String avatarUrl;
  final String userName;
  final String lastMessage;
  final String dateTime;
  final bool unread;
  final int? unreadCount;
  final VoidCallback? onTap;

  const ChatListItem({
    super.key,
    required this.avatarUrl,
    required this.userName,
    required this.lastMessage,
    required this.dateTime,
    this.unread = false,
    this.unreadCount,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: AppColors.greyCF,
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: avatarUrl,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    color: AppColors.greyCF,
                    child: const Center(
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    color: AppColors.greyCF,
                    child: Icon(
                      Icons.person,
                      color: AppColors.grey81,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ),
            BrandHSpace.gap12(),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BrandText.secondary(
                    data: userName,
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                  ),
                  BrandVSpace.gap4(),
                  BrandText.secondary(
                    data: lastMessage,
                    fontColor: AppColors.grey81,
                    fontSize: 15,
                  ),
                ],
              ),
            ),
            BrandHSpace.gap8(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                BrandText.secondary(
                  data: dateTime,
                  fontColor: unreadCount != 0
                      ? AppColors.primary
                      : AppColors.grey3C,
                  fontSize: 13,
                  fontWeight: unread ? FontWeight.bold : FontWeight.normal,
                ),
                BrandVSpace.gap4(),
                if (unreadCount != null && unreadCount! > 0)
                  Container(
                    width: 18,
                    height: 18,
                    padding: const EdgeInsets.all(0),
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: BrandText.primary(
                        data: "$unreadCount",
                        fontColor: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 8,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
