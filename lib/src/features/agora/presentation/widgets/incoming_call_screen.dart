// ignore_for_file: deprecated_member_use, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:mysafety_design_system/design_system/design_system.dart';
import 'dart:ui';

import 'package:mysafety_web/util/assets/assets.dart';

class IncomingCallScreen extends StatelessWidget {
  final String callerName;
  final String callType;
  final VoidCallback onAccept;
  final VoidCallback onDecline;

  const IncomingCallScreen({
    super.key,
    required this.callerName,
    required this.callType,
    required this.onAccept,
    required this.onDecline,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Stack(
        children: [
          Image.asset(
            Assets.logo,
            fit: BoxFit.fitWidth,
            width: double.infinity,
            height: double.infinity,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(color: Colors.black.withOpacity(0.5)),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.teal.withOpacity(0.2),
                  Colors.red.withOpacity(0.2),
                ],
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BrandText.white(
                      data: 'Incoming $callType call',
                      fontSize: 14,
                      fontColor: Colors.grey,
                    ),
                    Row(
                      children: [
                        BrandText.white(data: '9:41', fontSize: 12),
                        const SizedBox(width: 8),
                        const Icon(
                          Icons.signal_cellular_4_bar,
                          color: Colors.white,
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        const Icon(
                          Icons.battery_full,
                          color: Colors.white,
                          size: 16,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(),
              BrandText.white(
                data: callerName,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(height: 32),
              CircleAvatar(
                radius: 60,
                backgroundColor: Colors.grey[800],
                child: const Icon(Icons.person, size: 80, color: Colors.grey),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.grey[700]!,
                              width: 2,
                            ),
                          ),
                          child: const CircleAvatar(
                            radius: 28,
                            backgroundColor: Colors.transparent,
                            child: Icon(
                              Icons.message,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const BrandText.white(data: 'Message', fontSize: 12),
                      ],
                    ),
                  ),
                  const SizedBox(width: 30),

                  GestureDetector(
                    onTap: () {},
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.grey[700]!,
                              width: 2,
                            ),
                          ),
                          child: const CircleAvatar(
                            radius: 28,
                            backgroundColor: Colors.transparent,
                            child: Icon(
                              Icons.block,
                              color: Colors.red,
                              size: 20,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const BrandText.white(data: 'Block', fontSize: 12),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 200),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: onAccept,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.green,
                      child: const Icon(
                        Icons.call,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                  ),
                  const SizedBox(width: 80),
                  GestureDetector(
                    onTap: onDecline,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.red,
                      child: const Icon(
                        Icons.call_end,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        ],
      ),
    );
  }
}
