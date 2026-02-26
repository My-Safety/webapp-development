import 'dart:ui_web' as ui_web;
import 'package:flutter/material.dart';
import 'package:mysafety_web/src/features/agora/data/agora_web_interop.dart';
// ignore: depend_on_referenced_packages
import 'package:web/web.dart' as web;
import 'dart:js_interop';

class WebVideoPlayer extends StatefulWidget {
  final ILocalVideoTrack? localTrack;
  final IRemoteVideoTrack? remoteTrack;
  final String viewId;
  final bool? isEnabled; // Add this to track enabled state

  const WebVideoPlayer({
    super.key,
    this.localTrack,
    this.remoteTrack,
    required this.viewId,
    this.isEnabled,
  });

  @override
  State<WebVideoPlayer> createState() => _WebVideoPlayerState();
}

class _WebVideoPlayerState extends State<WebVideoPlayer> {
  static final Set<String> _registeredViews = {};
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _registerAndPlay();
  }

  @override
  void didUpdateWidget(WebVideoPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.localTrack != widget.localTrack ||
        oldWidget.remoteTrack != widget.remoteTrack ||
        oldWidget.isEnabled != widget.isEnabled) {
      _stopVideo();
      _isPlaying = false;
      WidgetsBinding.instance.addPostFrameCallback((_) => _playVideo());
    }
  }

  void _registerAndPlay() {
    if (!_registeredViews.contains(widget.viewId)) {
      try {
        ui_web.platformViewRegistry.registerViewFactory(
          widget.viewId,
          (int viewId) {
            final div = web.document.createElement('div') as web.HTMLDivElement;
            div.id = widget.viewId;
            div.style.width = '100%';
            div.style.height = '100%';
            div.style.objectFit = 'cover';
            div.style.backgroundColor = '#000000';
            return div;
          },
        );
        _registeredViews.add(widget.viewId);
        debugPrint('✅ Registered view: ${widget.viewId}');
      } catch (e) {
        debugPrint('⚠️ Error registering view: $e');
      }
    }
    
    // Wait for multiple frames to ensure DOM is ready
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 200), _playVideo);
    });
  }

  void _playVideo() {
    if (_isPlaying || !mounted) return;

    final div = web.document.getElementById(widget.viewId);
    if (div == null) {
      debugPrint('⚠️ Div not found: ${widget.viewId}');
      return;
    }

    try {
      if (widget.localTrack != null) {
        final isEnabled = widget.isEnabled ?? widget.localTrack!.enabled;
        if (isEnabled) {
          widget.localTrack!.play(div as JSAny);
          debugPrint('✅ Local video playing: ${widget.viewId}');
        } else {
          div.innerHTML = ''.toJS;
          debugPrint('⚫ Local video disabled: ${widget.viewId}');
        }
        _isPlaying = true;
      } else if (widget.remoteTrack != null) {
        widget.remoteTrack!.play(div as JSAny);
        _isPlaying = true;
        debugPrint('✅ Remote video playing: ${widget.viewId}');
      }
    } catch (e) {
      debugPrint('⚠️ Error playing video: $e');
    }
  }

  void _stopVideo() {
    try {
      final div = web.document.getElementById(widget.viewId);
      if (div != null) {
        div.innerHTML = ''.toJS;
        debugPrint('🛑 Stopped video: ${widget.viewId}');
      }
    } catch (e) {
      debugPrint('⚠️ Error stopping video: $e');
    }
  }

  @override
  void dispose() {
    _stopVideo();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return HtmlElementView(viewType: widget.viewId);
  }
}
