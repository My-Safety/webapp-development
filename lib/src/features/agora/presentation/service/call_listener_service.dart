// ignore_for_file: avoid_print

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mysafety_web/core/network/socket/web_socket.dart';
import 'package:mysafety_web/route/navigation_service.dart';
import 'package:mysafety_web/route/route_name.dart';
import 'package:mysafety_web/src/features/agora/presentation/provider/agora_provider.dart';
import 'package:mysafety_web/src/features/agora/presentation/widgets/incoming_call_notification.dart';

final callListenerProvider = Provider<CallListenerService>((ref) {
  return CallListenerService(ref);
});

class CallListenerService {
  final Ref ref;
  StreamSubscription? _callSubscription;
  OverlayEntry? _overlayEntry;

  CallListenerService(this.ref);

  void startListening() {
    _callSubscription?.cancel();

    _callSubscription = WebSocketService.callStartedStream.listen((data) {
      print(' Call Started Event Received');
      print('Payload: $data');

      final callId = data['callId'] as String?;
      final callType = data['callType'] as String?;
      final channelName = data['channelName'] as String?;

      if (callId != null) {
        print('CallId: $callId');
        print('CallType: $callType');
        print('ChannelName: $channelName');

        _showIncomingCallNotification(
          callId: callId,
          callType: callType ?? 'Audio',
          callerName: channelName ?? 'Unknown',
        );
      } else {
        print(' No callId in payload');
      }
    });
  }

  void _showIncomingCallNotification({
    required String callId,
    required String callType,
    required String callerName,
  }) {
    final navigatorState = NavigationService.navigatorKey.currentState;
    final callProvider = ref.read(agoraProvider);

    if (navigatorState == null || navigatorState.overlay == null) {
      print(' Navigator or Overlay not available yet');
      return;
    }

    if (callProvider.isCallInitiated) {
      print(' Ignoring - call was initiated by me');
      return;
    }

    _overlayEntry?.remove();
    _overlayEntry = OverlayEntry(
      builder: (_) => Positioned(
        top: 80,
        left: 16,
        right: 16,
        child: IncomingCallNotification(
          callerName: callerName,
          callType: callType,
          onAccept: () async {
            _overlayEntry?.remove();
            _overlayEntry = null;
            await _joinCall(callId, callType);
          },
          onDecline: () {
            _overlayEntry?.remove();
            _overlayEntry = null;
            print(' Call Declined');
          },
        ),
      ),
    );

    navigatorState.overlay!.insert(_overlayEntry!);
  }

  Future<void> _joinCall(String callId, String callType) async {
    print(' Accepting call: $callId');

    final context = NavigationService.navigatorKey.currentContext;
    if (context == null) return;

    if (callType.toLowerCase() == 'video') {
      context.push('${RouteName.agoraVideoCall}?callId=$callId');
    } else {
      context.push('${RouteName.agoraAudioCall}?callId=$callId');
    }
  }

  void dispose() {
    _callSubscription?.cancel();
    if (_overlayEntry != null && _overlayEntry!.mounted) {
      _overlayEntry?.remove();
    }
  }
}
