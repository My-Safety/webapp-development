import 'package:flutter/material.dart';
import 'package:mysafety_design_system/design_system/design_system.dart';
import 'package:shimmer/shimmer.dart';

class ChatListItemShimmer extends StatelessWidget {
  const ChatListItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
      child: Row(
        children: [
          // Circle avatar shimmer
          Shimmer.fromColors(
            baseColor: AppColors.greyD7,
            highlightColor: AppColors.grey81,
            child: const CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
            ),
          ),
          BrandHSpace.gap12(),

          // Expanded text blocks shimmer
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Shimmer.fromColors(
                  baseColor: AppColors.greyD7,
                  highlightColor: AppColors.grey81,
                  child: Container(
                    width: double.infinity,
                    height: 20,
                    color: Colors.white,
                  ),
                ),
                BrandVSpace.gap4(),
                Shimmer.fromColors(
                  baseColor: AppColors.greyD7,
                  highlightColor: AppColors.grey81,
                  child: Container(
                    width: 150,
                    height: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          BrandHSpace.gap8(),

          // Time and unread count shimmer
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Shimmer.fromColors(
                baseColor: AppColors.greyD7,
                highlightColor: AppColors.grey81,
                child: Container(
                  width: 50,
                  height: 14,
                  color: Colors.white,
                ),
              ),
              BrandVSpace.gap4(),
              Shimmer.fromColors(
                baseColor: AppColors.greyD7,
                highlightColor: AppColors.grey81,
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
