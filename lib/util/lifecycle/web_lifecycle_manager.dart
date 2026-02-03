// ignore: deprecated_member_use
// ignore_for_file: avoid_web_libraries_in_flutter

// ignore: deprecated_member_use
import 'dart:html' as html;
import 'package:flutter/foundation.dart';
import 'package:mysafety_web/core/network/socket/web_socket.dart';
import 'package:mysafety_web/util/auth/auth_manager.dart';

class WebLifecycleManager {
  static final WebLifecycleManager _instance = WebLifecycleManager._();
  static WebLifecycleManager get instance => _instance;
  WebLifecycleManager._();

  bool _isInitialized = false;
  String? _currentRoomId;
  bool _isReconnecting = false;

  void initialize() {
    if (_isInitialized || !kIsWeb) return;
    _isInitialized = true;

    // Handle page visibility changes
    html.document.addEventListener('visibilitychange', _handleVisibilityChange);
    
    // Handle beforeunload for cleanup
    html.window.addEventListener('beforeunload', _handleBeforeUnload);
    
    // Restore connections on initialization
    _restoreConnections();
  }

  void _handleVisibilityChange(html.Event event) {
    if (html.document.hidden == false && !_isReconnecting) {
      // Page became visible - reconnect if needed
      _reconnectIfNeeded();
    }
  }

  void _handleBeforeUnload(html.Event event) {
    // Clean disconnect before page unload
    WebSocketService.disconnect();
  }

  void setCurrentRoom(String roomId) {
    _currentRoomId = roomId;
    // Store in sessionStorage for reload recovery
    html.window.sessionStorage['currentRoomId'] = roomId;
  }

  void _reconnectIfNeeded() async {
    if (_isReconnecting || WebSocketService.isConnected) return;
    
    final roomId = _currentRoomId ?? html.window.sessionStorage['currentRoomId'];
    if (roomId == null) return;
    
    _isReconnecting = true;
    try {
      debugPrint('🔄 Reconnecting to chat room: $roomId');
      
      // Ensure we have a token before connecting
      await AuthManager().fetchToken();
      var token = AuthManager().token;
      if (token == null) {
        token = 'visitor_${DateTime.now().millisecondsSinceEpoch}';
        await AuthManager().setToken(token);
        debugPrint('📝 Created visitor token for reconnection: $token');
      }
      
      await WebSocketService.connect();
      WebSocketService.joinRoom(roomId);
      _currentRoomId = roomId;
    } catch (e) {
      debugPrint('🔴 Reconnection failed: $e');
      // Don't retry if authentication failed
      if (!e.toString().contains('Authentication')) {
        Future.delayed(const Duration(seconds: 5), () {
          _isReconnecting = false;
          _reconnectIfNeeded();
        });
        return;
      }
    } finally {
      _isReconnecting = false;
    }
  }

  void _restoreConnections() async {
    await Future.delayed(const Duration(milliseconds: 500));
    _reconnectIfNeeded();
  }

  void dispose() {
    if (!kIsWeb) return;
    html.document.removeEventListener('visibilitychange', _handleVisibilityChange);
    html.window.removeEventListener('beforeunload', _handleBeforeUnload);
    _isInitialized = false;
  }
}