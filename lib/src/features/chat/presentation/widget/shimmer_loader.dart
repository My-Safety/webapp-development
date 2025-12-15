// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd.
// Created by Adwaith C, 29/10/2025

import 'package:flutter/material.dart';
import 'package:mysafety_design_system/design_system/design_system.dart';
import 'package:shimmer/shimmer.dart';

class ChatShimmerLoader extends StatelessWidget {
  const ChatShimmerLoader({super.key});

  @override
  Widget build(BuildContext context) {
    final baseColor = AppColors.greyFD;
    final highlightColor = AppColors.greyD9;

    return Container(
      color: AppColors.white,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        itemCount: 12,
        itemBuilder: (context, index) {
          final isMe = index.isEven;
          final bubbleWidth =
              MediaQuery.of(context).size.width * (isMe ? 0.55 : 0.65);
          final bubbleAlignment = isMe
              ? Alignment.centerRight
              : Alignment.centerLeft;

          return Align(
            alignment: bubbleAlignment,
            child: Padding(
              padding: EdgeInsets.only(
                top: 10,
                left: isMe ? 50 : 0,
                right: isMe ? 0 : 50,
              ),
              child: Shimmer.fromColors(
                baseColor: baseColor,
                highlightColor: highlightColor,
                child: Container(
                  width: bubbleWidth,
                  decoration: BoxDecoration(
                    color: baseColor,
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(16),
                      topRight: const Radius.circular(16),
                      bottomLeft: isMe
                          ? const Radius.circular(16)
                          : const Radius.circular(0),
                      bottomRight: isMe
                          ? const Radius.circular(0)
                          : const Radius.circular(16),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 12,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Simulate text lines with varying lengths
                      Container(
                        height: 10,
                        width: bubbleWidth * (0.8 + (index % 3) * 0.05),
                        decoration: BoxDecoration(
                          color: baseColor,
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      const SizedBox(height: 6),
                      if (index % 3 != 0)
                        Container(
                          height: 10,
                          width: bubbleWidth * (0.6 + (index % 2) * 0.1),
                          decoration: BoxDecoration(
                            color: baseColor,
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
