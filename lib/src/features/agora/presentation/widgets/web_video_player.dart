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

  const WebVideoPlayer({
    super.key,
    this.localTrack,
    this.remoteTrack,
    required this.viewId,
  });

  @override
  State<WebVideoPlayer> createState() => _WebVideoPlayerState();
}

class _WebVideoPlayerState extends State<WebVideoPlayer> {
  @override
  void initState() {
    super.initState();
    _registerView();
  }

  void _registerView() {
    try {
      ui_web.platformViewRegistry.registerViewFactory(
        widget.viewId,
        (int viewId) {
          final div = web.document.createElement('div') as web.HTMLDivElement;
          div.id = widget.viewId;
          div.style.width = '100%';
          div.style.height = '100%';
          div.style.objectFit = 'cover';

          Future.microtask(() {
            try {
              if (widget.localTrack != null) {
                widget.localTrack!.play(div as JSAny);
              } else if (widget.remoteTrack != null) {
                widget.remoteTrack!.play(div as JSAny);
              }
            } catch (e) {
              debugPrint('⚠️ Error playing video track: $e');
            }
          });

          return div;
        },
      );
    } catch (e) {
      debugPrint('⚠️ Error registering view factory: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return HtmlElementView(viewType: widget.viewId);
  }
}
