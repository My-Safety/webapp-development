// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Adwaith c, 16/12/2025

// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mysafety_web/core/model/agora/state/agora_state.dart';
import 'package:mysafety_web/core/network/socket/web_socket.dart';
import 'package:mysafety_web/route/route_name.dart';
import 'package:mysafety_web/src/features/agora/presentation/provider/agora_provider.dart';
import 'package:mysafety_web/src/features/agora/presentation/widgets/call_controls.dart';
import 'package:mysafety_web/src/features/agora/presentation/widgets/video_grid_view.dart';
import 'dart:async';

class AgoraCallScreen extends ConsumerStatefulWidget {
  final String? bookingId;
  final String moduleType;
  final String callType;
  final String role;
  final String visitorId;

  const AgoraCallScreen({
    super.key,
    this.bookingId,
    this.visitorId = "",
    this.moduleType = 'DoorBell',
    this.callType = 'video',
    this.role = 'visitor',
  });

  @override
  ConsumerState<AgoraCallScreen> createState() => _AgoraCallScreenState();
}

class _AgoraCallScreenState extends ConsumerState<AgoraCallScreen> {
  StreamSubscription? _callEndedSub;

  @override
  void initState() {
    super.initState();
    debugPrint('🎬 AgoraCallScreen initState - Setting up listeners');

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final success = await ref
          .read(agoraProvider.notifier)
          .startCall(
            visitorId: widget.visitorId,
            qrId: widget.bookingId ?? '',
            callType: widget.callType,
          );

      if (!success && mounted) {
        context.pop();
      }
    });

    // Listen for call ended event from WebSocket
    debugPrint('🎧 Setting up WebSocket call_ended listener');
    _callEndedSub = WebSocketService.callEndedStream.listen((data) {
      debugPrint('📞 ========================================');
      debugPrint('📞 CALL ENDED EVENT RECEIVED FROM WEBSOCKET');
      debugPrint('📞 Data: $data');
      debugPrint('📞 ========================================');

      if (!mounted) {
        debugPrint('⚠️ Widget not mounted, skipping');
        return;
      }

      final notifier = ref.read(agoraProvider.notifier);
      debugPrint('🔴 Calling endCall(skipApiCall: true)...');

      notifier
          .endCall(skipApiCall: true)
          .then((_) {
            debugPrint('✅ endCall completed');
            if (mounted) {
              debugPrint('🔙 Cannot pop, using go() instead');
              context.pop();
            }
          })
          .catchError((error) {
            debugPrint('❌ Error in endCall: $error');
          });
    });
    debugPrint('✅ WebSocket listener setup complete');
  }

  @override
  Widget build(BuildContext context) {
    final agoraState = ref.watch(agoraProvider);
    final notifier = ref.read(agoraProvider.notifier);

    ref.listen<AgoraState>(agoraProvider, (previous, next) {
      if (next.error != null) {
        if (next.error!.contains('Permission') ||
            next.error!.contains('Invalid') ||
            next.error!.contains('Failed')) {
          Future.delayed(const Duration(seconds: 2), () {
            if (mounted) context.pop();
          });
        }
      }

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

    if (agoraState.error != null) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, color: Colors.red, size: 64),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Text(
                  agoraState.error!,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => context.pop(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                ),
                child: const Text('Go Back'),
              ),
            ],
          ),
        ),
      );
    }

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (!didPop) {
          await notifier.endCall();
          if (context.mounted) context.pop();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            VideoGridView(isVideoCall: widget.callType == 'video'),
            Positioned(
              top: 50,
              left: 20,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: agoraState.isRemoteUserJoined
                            ? Colors.green
                            : Colors.orange,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      agoraState.isRemoteUserJoined
                          ? 'Connected'
                          : 'Connecting...',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 50,
              left: 0,
              right: 0,
              child: CallControls(
                isMuted: agoraState.isMuted,
                isVideoEnabled: agoraState.isVideoEnabled,
                callType: widget.callType,
                onMuteToggle: notifier.toggleMute,
                onVideoToggle: notifier.toggleVideo,
                onSwitchCamera: notifier.switchCamera,
                onEndCall: () async {
                  await notifier.endCall();
                  if (mounted && context.canPop()) {
                    context.pop();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _callEndedSub?.cancel();
    super.dispose();
  }
}
