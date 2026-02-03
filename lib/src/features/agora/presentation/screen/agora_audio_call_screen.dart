// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Adwaith c, 16/12/2025

// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mysafety_web/src/features/agora/presentation/provider/agora_provider.dart';

class AgoraAudioCallScreen extends ConsumerStatefulWidget {
  final String? qrId;
  final String? callId;

  const AgoraAudioCallScreen({super.key, this.qrId, this.callId});

  @override
  ConsumerState<AgoraAudioCallScreen> createState() =>
      _AgoraAudioCallScreenState();
}

class _AgoraAudioCallScreenState extends ConsumerState<AgoraAudioCallScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final notifier = ref.read(agoraProvider.notifier);

      if (widget.callId != null) {
        // Incoming call - join directly
        await notifier.joinCall(role: 'visitor', callId: widget.callId!);
      } else if (widget.qrId != null && !notifier.isCallInitiated) {
        // Outgoing call - only start if not already initiated
        final success = await notifier.startCall(
          qrId: widget.qrId!,
          callType: 'audio',
        );
        if (!success && mounted) {
          context.pop();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final agoraState = ref.watch(agoraProvider);
    final notifier = ref.read(agoraProvider.notifier);

    if (agoraState.isLoading) {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(child: CircularProgressIndicator(color: Colors.white)),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF1A1A2E), Color(0xFF16213E), Color(0xFF0F3460)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Status bar
              Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '9:41',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.signal_cellular_4_bar,
                          color: Colors.white,
                          size: 16,
                        ),
                        SizedBox(width: 4),
                        Icon(Icons.wifi, color: Colors.white, size: 16),
                        SizedBox(width: 4),
                        Icon(Icons.battery_full, color: Colors.white, size: 16),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Title
              const Text(
                'Incoming voice call',
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),

              const SizedBox(height: 40),

              // Caller name
              const Text(
                'Visitor',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 40),

              // Profile image
              const CircleAvatar(
                radius: 60,
                backgroundColor: Colors.grey,
                child: Icon(Icons.person, size: 60, color: Colors.white),
              ),

              const SizedBox(height: 60),

              // Call status
              const Text(
                'In call with',
                style: TextStyle(color: Colors.green, fontSize: 14),
              ),

              const SizedBox(height: 8),

              // Call duration
              const Text(
                '02:07',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w300,
                ),
              ),

              const Spacer(),

              // Message button
              Column(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.message,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Message',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),

              const SizedBox(height: 60),

              // Control buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Add user
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.person_add,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),

                  // Mute
                  GestureDetector(
                    onTap: notifier.toggleMute,
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        agoraState.isMuted ? Icons.mic_off : Icons.mic,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ),

                  // Speaker
                  GestureDetector(
                    onTap: notifier.toggleSpeaker,
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        agoraState.isSpeakerOn
                            ? Icons.volume_up
                            : Icons.volume_off,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ),

                  // Video off
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.videocam_off,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),

                  // End call
                  GestureDetector(
                    onTap: () async {
                      await notifier.endCall();
                      notifier.setCallInitiated(false);
                      if (mounted && context.canPop()) {
                        context.pop();
                      }
                    },
                    child: Container(
                      width: 60,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Icon(
                        Icons.call_end,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),

              // Bottom indicator
              Container(
                width: 134,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(2.5),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
