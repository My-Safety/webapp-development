// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Adwaith c, 16/12/2025

import 'package:flutter/material.dart';

class CallControls extends StatelessWidget {
  final bool isMuted;
  final bool isVideoEnabled;
  final String callType;
  final VoidCallback onMuteToggle;
  final VoidCallback onVideoToggle;
  final VoidCallback onSwitchCamera;
  final VoidCallback onEndCall;

  const CallControls({
    super.key,
    required this.isMuted,
    required this.isVideoEnabled,
    required this.callType,
    required this.onMuteToggle,
    required this.onVideoToggle,
    required this.onSwitchCamera,
    required this.onEndCall,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Mute/Unmute button
          _buildControlButton(
            icon: isMuted ? Icons.mic_off : Icons.mic,
            backgroundColor: isMuted ? Colors.red : Colors.white24,
            onPressed: onMuteToggle,
          ),

          // Video toggle button (only for video calls)
          if (callType == 'video')
            _buildControlButton(
              icon: isVideoEnabled ? Icons.videocam : Icons.videocam_off,
              backgroundColor: !isVideoEnabled ? Colors.red : Colors.white24,
              onPressed: onVideoToggle,
            ),

          // Switch camera button (only for video calls)
          if (callType == 'video')
            _buildControlButton(
              icon: Icons.switch_camera,
              backgroundColor: Colors.white24,
              onPressed: onSwitchCamera,
            ),

          // End call button
          _buildControlButton(
            icon: Icons.call_end,
            backgroundColor: Colors.red,
            onPressed: onEndCall,
          ),
        ],
      ),
    );
  }

  Widget _buildControlButton({
    required IconData icon,
    required Color backgroundColor,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 28,
        ),
      ),
    );
  }
}