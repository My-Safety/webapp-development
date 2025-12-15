import 'package:flutter/material.dart';
import 'package:mysafety_design_system/design_system/theme/colors.dart';
import 'package:mysafety_web/src/features/chat/presentation/widget/shimmers/chat_list_item.dart';

Widget shimmerExpanded({
  required Widget child,
  required bool isLoading,
  int shimmerCount = 5,
}) {
  if (isLoading) {
    return Container(
      color: AppColors.white,
      child: ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: shimmerCount,
        itemBuilder: (_, _) => const ChatListItemShimmer(),
      ),
    );
  }
  return child;
}
