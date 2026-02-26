import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mysafety_design_system/design_system/design_system.dart';
import 'package:mysafety_web/route/route_name.dart';
import 'package:mysafety_web/src/features/auth/presentation/widgets/action_box.dart';
import 'package:mysafety_web/core/network/socket/web_socket.dart';
import 'package:mysafety_web/src/features/chat/presentation/provider/chat_provider.dart';
import 'package:mysafety_web/src/features/profile/presentation/provider/profile_provider.dart';
import 'package:mysafety_web/util/assets/assets.dart';
import 'package:mysafety_web/util/extension/extension.dart';

class SelectOptionScreen extends ConsumerStatefulWidget {
  final String? roomId;
  final String? qrId;
  final String? visitorId;
  const SelectOptionScreen({super.key, this.roomId, this.qrId, this.visitorId});

  @override
  ConsumerState<SelectOptionScreen> createState() => _SelectOptionScreenState();
}

class _SelectOptionScreenState extends ConsumerState<SelectOptionScreen> {
  late ProfileNotifierProvider profileprovider;
  StreamSubscription? _callStartedSub;
  bool _hasInitialized = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_hasInitialized) {
        _hasInitialized = true;
        _resolveQrData();
        _initializeChatConnection();
      }
    });
  }

  /// Resolve QR data to get profile information
  Future<void> _resolveQrData() async {
    final qrId = widget.qrId ?? profileprovider.qrId;
    if (qrId != null) {
      await profileprovider.resolveQr(
        qrId: qrId,
        latitude: "25.59",
        longitude: "85.13",
      );

      debugPrint(
        '🔍 Active Profile Type: ${profileprovider.activeProfileType}',
      );

      if (profileprovider.activeProfileType == 'vehicle' ||
          profileprovider.activeProfileType == 'lostfound') {
        debugPrint('🚗 Fetching predefined messages for vehicle...');
        await profileprovider.getPredefinedMessages(qrId: qrId);
        debugPrint(
          '📋 Messages fetched: ${profileprovider.predefinedMessages.length}',
        );
      }
    }
  }

  /// Initialize chat connection
  void _initializeChatConnection() async {
    final roomId = widget.roomId;

    if (roomId != null) {
      await ref.read(oneToOneChatControllerProvider.notifier).connect(roomId);
      _listenForCallStarted();
    } else {
      debugPrint('⚠️ No room ID available for connection');
    }
  }

  /// Listen for call started events
  void _listenForCallStarted() {
    _callStartedSub = WebSocketService.callStartedStream.listen((data) {
      debugPrint('🎯 Call started payload: $data');
    });
  }

  /// Navigate to audio call
  void _goToAudioCall() {
    final qrId = widget.qrId;
    final roomId = widget.roomId;
    final visitorId = widget.visitorId ?? profileprovider.visitorId;
    if (roomId != null) {
      context.push(
        '${RouteName.agoraAudioCall}?qrId=$qrId&roomId=$roomId&visitorId=$visitorId',
      );
    } else {
      context.push(
        '${RouteName.agoraAudioCall}?qrId=$qrId&visitorId=$visitorId',
      );
    }
  }

  /// Navigate to video call
  void _goToVideoCall() {
    final qrId = widget.qrId;
    final roomId = widget.roomId;
    final visitorId = widget.visitorId ?? profileprovider.visitorId;
    if (roomId != null) {
      context.push(
        '${RouteName.agoraVideoCall}?qrId=$qrId&roomId=$roomId&visitorId=$visitorId',
      );
    } else {
      context.push(
        '${RouteName.agoraVideoCall}?qrId=$qrId&visitorId=$visitorId',
      );
    }
  }

  void _goToChat() {
    final roomId = widget.roomId;
    final qrId = widget.qrId;
    final visitorId = widget.visitorId ?? profileprovider.visitorId;
    final visitorName =
        profileprovider.resolveQrResponse?.qr?.ownerId?.name ?? 'OWNER';
    final profileType = profileprovider.activeProfileType;

    if (roomId != null && qrId != null) {
      context.push(
        '${RouteName.oneToOneChatScreen}?roomId=$roomId&qrId=$qrId&visitorName=$visitorName&profileType=$profileType&visitorId=$visitorId',
      );
    } else if (roomId != null) {
      context.push(
        '${RouteName.oneToOneChatScreen}?roomId=$roomId&visitorName=$visitorName&profileType=$profileType&visitorId=$visitorId',
      );
    } else {
      context.push(RouteName.oneToOneChatScreen);
    }
  }

  @override
  void dispose() {
    _callStartedSub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    profileprovider = ref.read(profileProvider.notifier);

    return BaseLayout(
      appBar: BrandAppBar(
        title: context.loc.enter_otp,
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.red),
            tooltip: 'Logout',
            onPressed: () async {
              await ref.read(profileProvider.notifier).logout();
              if (context.mounted) {
                context.go(RouteName.login);
              }
            },
          ),
        ],
      ),
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(),
              BrandVSpace.gap12(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ActionBox(
                    title: 'Audio Call',
                    assetPath: Assets.audioCall,
                    onTap: _goToAudioCall,
                  ),
                  ActionBox(
                    title: 'Video Call',
                    assetPath: Assets.videoCall,
                    onTap: _goToVideoCall,
                  ),
                  ActionBox(
                    title: 'Chat',
                    assetPath: Assets.chat,
                    onTap: _goToChat,
                  ),
                ],
              ),
              BrandVSpace.gap100(),
            ],
          ),
        ),
      ),
    );
  }
}
