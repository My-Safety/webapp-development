import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mysafety_design_system/design_system/design_system.dart';

class ChatScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String avatarUrl;
  final String userName;
  final String status;
  final VoidCallback? onAudioCall;
  final VoidCallback? onVideoCall;
  
  const ChatScreenAppBar({
    required this.avatarUrl,
    required this.userName,
    required this.status,
    this.onAudioCall,
    this.onVideoCall,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      foregroundColor: AppColors.primary,
      surfaceTintColor: AppColors.primary,
      elevation: 0,
      backgroundColor: AppColors.primary,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: AppColors.white, size: 24),
            onPressed: () => Navigator.of(context).pop(),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
          BrandHSpace.gap12(),

          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey[200],
            child: ClipOval(
              child: CachedNetworkImage(
                imageUrl: avatarUrl,
                width: 40,
                height: 40,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator(strokeWidth: 2)),
                errorWidget: (context, url, error) =>
                    const Icon(Icons.person, color: AppColors.primary),
              ),
            ),
          ),
          BrandHSpace.gap12(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BrandText.primary(
                data: userName,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              fontColor: AppColors.white,
              ),
              BrandText.secondary(
                data: status,
                fontSize: 12,
                fontColor: AppColors.green24,
              ),
            ],
          ),

        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.call, color: AppColors.white),
          onPressed: onAudioCall,
          tooltip: 'Audio Call',
        ),
        IconButton(
          icon: const Icon(Icons.video_call_rounded, color: AppColors.white),
          onPressed: onVideoCall,
          tooltip: 'Video Call',
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
