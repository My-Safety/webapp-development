// ignore_for_file: deprecated_member_use

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IncomingCallNotification extends ConsumerStatefulWidget {
  final String callerName;
  final String callType;
  final VoidCallback onAccept;
  final VoidCallback onDecline;

  const IncomingCallNotification({
    super.key,
    required this.callerName,
    required this.callType,
    required this.onAccept,
    required this.onDecline,
  });

  @override
  ConsumerState<IncomingCallNotification> createState() =>
      _IncomingCallNotificationState();
}

class _IncomingCallNotificationState
    extends ConsumerState<IncomingCallNotification>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _opacity;
  late final Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );

    _opacity = CurvedAnimation(parent: _controller, curve: Curves.easeOut);

    _slide = Tween<Offset>(
      begin: const Offset(0, -0.15),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FadeTransition(
        opacity: _opacity,
        child: SlideTransition(
          position: _slide,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 20,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.55),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: Colors.white.withOpacity(0.15)),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CircleAvatar(
                        radius: 42,
                        backgroundImage: AssetImage(
                          'assets/images/profile_placeholder.png',
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        widget.callerName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Incoming ${widget.callType} Call',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.75),
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _CallActionButton(
                            icon: Icons.call_end,
                            color: Colors.red,
                            onTap: widget.onDecline,
                          ),
                          _CallActionButton(
                            icon: Icons.call,
                            color: Colors.green,
                            onTap: widget.onAccept,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CallActionButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _CallActionButton({
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 68,
        height: 68,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.45),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Icon(icon, color: Colors.white, size: 32),
      ),
    );
  }
}
