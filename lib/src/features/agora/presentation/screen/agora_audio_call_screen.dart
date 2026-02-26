// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Adwaith c, 16/12/2025

// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mysafety_web/core/network/socket/web_socket.dart';
import 'package:mysafety_web/route/route_name.dart';
import 'package:mysafety_web/src/features/agora/presentation/provider/agora_provider.dart';

class AgoraAudioCallScreen extends ConsumerStatefulWidget {
  final String? qrId;
  final String? callId;
  final String? visitorId;

  const AgoraAudioCallScreen({
    super.key,
    this.qrId,
    this.callId,
    this.visitorId,
  });

  @override
  ConsumerState<AgoraAudioCallScreen> createState() =>
      _AgoraAudioCallScreenState();
}

class _AgoraAudioCallScreenState extends ConsumerState<AgoraAudioCallScreen> {
  StreamSubscription? _callEndedSub;

  @override
  void initState() {
    super.initState();
    _callEndedSub = WebSocketService.callEndedStream.listen((data) {
      final notifier = ref.read(agoraProvider.notifier);
      notifier.endCall(skipApiCall: true);
    });

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final notifier = ref.read(agoraProvider.notifier);

      if (widget.callId != null) {
        await notifier.joinCall(
          role: 'visitor',
          callId: widget.callId!,
          visitorId: widget.visitorId!,
        );
      } else if (widget.qrId != null && !notifier.isCallInitiated) {
        final success = await notifier.startCall(
          qrId: widget.qrId!,
          callType: 'audio',
          visitorId: widget.visitorId ?? "" ,
        );
        if (!success && mounted) {
          context.pop();
        }
      }
    });
  }

  @override
  void dispose() {
    _callEndedSub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final agoraState = ref.watch(agoraProvider);
    final notifier = ref.read(agoraProvider.notifier);

    ref.listen(agoraProvider, (previous, next) {
      if (previous?.isCallActive == true &&
          next.isCallActive == false &&
          !next.isLoading) {
        Future.microtask(() {
          if (mounted) {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go(RouteName.selectOptionScreen);
            }
          }
        });
      }
    });

    if (agoraState.isLoading) {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(child: CircularProgressIndicator(color: Colors.white)),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Grid view of participants
          _buildAudioGrid(agoraState),

          // Control buttons at bottom
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildControlButton(
                  icon: agoraState.isMuted ? Icons.mic_off : Icons.mic,
                  onTap: notifier.toggleMute,
                ),
                _buildControlButton(
                  icon: agoraState.isSpeakerOn
                      ? Icons.volume_up
                      : Icons.volume_off,
                  onTap: notifier.toggleSpeaker,
                ),
                _buildControlButton(
                  icon: Icons.call_end,
                  color: Colors.red,
                  onTap: () async {
                    await notifier.endCall();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAudioGrid(agoraState) {
    final users = ['You', ...agoraState.remoteUsers.map((e) => 'User $e')];
    final userCount = users.length;

    int crossAxisCount = 2;
    if (userCount == 1) crossAxisCount = 1;
    if (userCount >= 5) crossAxisCount = 3;

    return GridView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: users.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemBuilder: (context, index) {
        final isMe = index == 0;
        final isMuted = isMe ? agoraState.isMuted : false;

        return Container(
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(40),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.person, size: 40, color: Colors.white),
                  ),
                  if (isMuted)
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: CircleAvatar(
                        radius: 14,
                        backgroundColor: Colors.red,
                        child: const Icon(
                          Icons.mic_off,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                users[index],
                style: const TextStyle(color: Colors.white, fontSize: 14),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildControlButton({
    required IconData icon,
    required VoidCallback onTap,
    Color? color,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: color ?? Colors.white.withOpacity(0.2),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white, size: 28),
      ),
    );
  }
}
