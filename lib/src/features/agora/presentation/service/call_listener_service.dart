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
  StreamSubscription? _callStartedSubscription;
  StreamSubscription? _callEndedSubscription;
  OverlayEntry? _callOverlayEntry;
  Map<String, dynamic>? _pendingCallData;

  CallListenerService(this.ref);

  void startListening() {
    _callStartedSubscription?.cancel();
    _callEndedSubscription?.cancel();

    // Listen for incoming calls
    _callStartedSubscription = WebSocketService.callStartedStream.listen((data) {
      print('📞 Call Started Event Received');
      print('Payload: $data');

      final callId = data['callId'] as String?;
      final callType = data['callType'] as String?;
      final callerName = data['callerName'] as String? ?? 'Unknown';

      if (callId != null && !ref.read(agoraProvider).isCallInitiated) {
        _pendingCallData = data;
        _showCallOverlay(data);
      }
    });

    // Listen for call ended
    _callEndedSubscription = WebSocketService.callEndedStream.listen((data) {
      print('📞 Call Ended Event Received');
      handleCallEnd();
    });
  }

  void _showCallOverlay(Map<String, dynamic> data) {
    final callId = data['callId'] ?? '';
    final callType = data['callType'] ?? 'audio';
    final callerName = data['callerName'] ?? 'Unknown';

    final navigatorState = NavigationService.navigatorKey.currentState;
    if (navigatorState == null || navigatorState.overlay == null) return;

    _callOverlayEntry?.remove();
    _callOverlayEntry = OverlayEntry(
      builder: (_) => Material(
        color: Colors.transparent,
        child: IncomingCallNotification(
          callerName: callerName,
          callType: callType,
          onAccept: () async {
            _callOverlayEntry?.remove();
            _callOverlayEntry = null;
            _pendingCallData = null;
            _joinCall(callId, callType);
          },
          onDecline: () async {
            handleCallEnd();
            await _endCall(callId);
          },
        ),
      ),
    );

    navigatorState.overlay!.insert(_callOverlayEntry!);
  }

  void handleCallEnd() {
    _callOverlayEntry?.remove();
    _callOverlayEntry = null;
    _pendingCallData = null;
    print('✅ Call overlay removed');
  }

  Future<void> _joinCall(String callId, String callType) async {
    print('✅ Accepting call: $callId');

    final context = NavigationService.navigatorKey.currentContext;
    if (context == null) return;

    // Get visitorId from pending call data if available
    final visitorId = _pendingCallData?['visitorId'] as String? ?? '';

    if (callType.toLowerCase() == 'video') {
      context.push('${RouteName.agoraVideoCall}?callId=$callId&visitorId=$visitorId');
    } else {
      context.push('${RouteName.agoraAudioCall}?callId=$callId&visitorId=$visitorId');
    }
  }

  Future<void> _endCall(String callId) async {
    try {
      await ref.read(agoraProvider.notifier).endCall();
      print('✅ Call declined: $callId');
    } catch (e) {
      print('⚠️ Error declining call: $e');
    }
  }

  void dispose() {
    _callStartedSubscription?.cancel();
    _callEndedSubscription?.cancel();
    if (_callOverlayEntry != null && _callOverlayEntry!.mounted) {
      _callOverlayEntry?.remove();
    }
  }
}
