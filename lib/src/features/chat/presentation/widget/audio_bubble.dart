import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:mysafety_design_system/design_system/design_system.dart';

class AudioBubble extends StatefulWidget {
  final String audioUrl;
  final bool isIncoming;
  final int? duration;

  const AudioBubble({
    super.key,
    required this.audioUrl,
    required this.isIncoming,
    this.duration,
  });

  @override
  State<AudioBubble> createState() => _AudioBubbleState();
}

class _AudioBubbleState extends State<AudioBubble> {
  late AudioPlayer _audioPlayer;
  bool isPlaying = false;
  Duration currentPosition = Duration.zero;
  Duration totalDuration = Duration.zero;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    
    _audioPlayer.onPlayerStateChanged.listen((state) {
      if (mounted) {
        setState(() {
          isPlaying = state == PlayerState.playing;
        });
      }
    });

    _audioPlayer.onPositionChanged.listen((position) {
      if (mounted) {
        setState(() {
          currentPosition = position;
        });
      }
    });

    _audioPlayer.onDurationChanged.listen((duration) {
      if (mounted) {
        setState(() {
          totalDuration = duration;
        });
      }
    });

    _audioPlayer.onPlayerComplete.listen((_) {
      if (mounted) {
        setState(() {
          isPlaying = false;
          currentPosition = Duration.zero;
        });
      }
    });
  }

  void _togglePlay() async {
    if (isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(UrlSource(widget.audioUrl));
    }
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bubbleColor = widget.isIncoming ? AppColors.greyFD : AppColors.grey8B;
    final iconColor = widget.isIncoming ? AppColors.primary : Colors.white;
    final textColor = widget.isIncoming ? AppColors.black : Colors.white;
    
    final displayDuration = totalDuration > Duration.zero 
        ? totalDuration 
        : (widget.duration != null ? Duration(seconds: widget.duration!) : Duration.zero);

    return GestureDetector(
      onTap: _togglePlay,
      child: Container(
        width: 220,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: bubbleColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            // Play/Pause button
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(
                isPlaying ? Icons.pause : Icons.play_arrow,
                color: iconColor,
                size: 20,
              ),
            ),
            const SizedBox(width: 8),
            // Waveform placeholder and duration
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Waveform visualization
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(20, (index) {
                      final heights = [3.0, 8.0, 5.0, 12.0, 7.0, 10.0, 4.0, 9.0, 6.0, 11.0];
                      return Container(
                        width: 2,
                        height: heights[index % heights.length],
                        decoration: BoxDecoration(
                          color: textColor.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(1),
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 4),
                  // Duration
                  Text(
                    isPlaying 
                        ? _formatDuration(currentPosition)
                        : _formatDuration(displayDuration),
                    style: TextStyle(
                      color: textColor,
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}