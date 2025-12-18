import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:mysafety_design_system/design_system/design_system.dart';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioBubble extends StatefulWidget {
  final String audioUrl;
  final bool isIncoming; // ✅ ADD THIS PARAMETER

  const AudioBubble({
    super.key,
    required this.audioUrl,
    required this.isIncoming,
  });

  @override
  State<AudioBubble> createState() => _AudioBubbleState();
}

class _AudioBubbleState extends State<AudioBubble> {
  late AudioPlayer _audioPlayer;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
  }

  void _togglePlay() async {
    if (isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(UrlSource(widget.audioUrl));
    }
    setState(() => isPlaying = !isPlaying);
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _togglePlay,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: widget.isIncoming ? Colors.grey[300] : Colors.blue[400],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isPlaying ? Icons.pause : Icons.play_arrow,
              color: widget.isIncoming ? Colors.black : Colors.white,
            ),
            const SizedBox(width: 8),
            Text(
              isPlaying ? 'Playing...' : 'Audio',
              style: TextStyle(
                color: widget.isIncoming ? Colors.black : Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
