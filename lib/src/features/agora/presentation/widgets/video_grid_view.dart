import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mysafety_web/core/model/agora/state/agora_state.dart';
import 'package:mysafety_web/src/features/agora/presentation/provider/agora_provider.dart';
import 'package:mysafety_web/src/features/agora/presentation/widgets/web_video_player.dart';

class VideoGridView extends ConsumerStatefulWidget {
  final bool isVideoCall;

  const VideoGridView({super.key, required this.isVideoCall});

  @override
  ConsumerState<VideoGridView> createState() => _VideoGridViewState();
}

class _VideoGridViewState extends ConsumerState<VideoGridView> {
  @override
  Widget build(BuildContext context) {
    final agoraState = ref.watch(agoraProvider);
    final notifier = ref.read(agoraProvider.notifier);
    
    if (!widget.isVideoCall) {
      return _buildAudioCallView(agoraState.remoteUsers.length + 1);
    }

    final totalUsers = agoraState.remoteUsers.length + 1;

    if (totalUsers == 1) {
      return _buildLocalOnlyView(notifier);
    } else if (totalUsers == 2) {
      return _buildTwoUserView(agoraState, notifier);
    } else {
      return _buildGridView(agoraState, notifier, totalUsers);
    }
  }

  Widget _buildLocalOnlyView(AgoraNotifierProvider notifier) {
    return Stack(
      children: [
        Container(color: Colors.black),
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 300,
                height: 400,
                child: kIsWeb
                    ? _buildWebLocalVideo(notifier)
                    : _buildMobileLocalVideo(notifier),
              ),
              const SizedBox(height: 20),
              const Text(
                'Waiting for others...',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTwoUserView(AgoraState state, AgoraNotifierProvider notifier) {
    return Stack(
      children: [
        // Remote user (full screen)
        if (state.remoteUsers.isNotEmpty)
          kIsWeb
              ? _buildWebRemoteVideo(state.remoteUsers.first, notifier)
              : _buildMobileRemoteVideo(state.remoteUsers.first, notifier),
        
        // Local user (PiP)
        Positioned(
          top: 50,
          right: 20,
          child: Container(
            width: 120,
            height: 160,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: kIsWeb
                  ? _buildWebLocalVideo(notifier)
                  : _buildMobileLocalVideo(notifier),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGridView(AgoraState state, AgoraNotifierProvider notifier, int totalUsers) {
    final crossAxisCount = totalUsers <= 4 ? 2 : 3;
    
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 0.75,
      ),
      itemCount: totalUsers,
      itemBuilder: (context, index) {
        if (index == 0) {
          return _buildGridItem(
            child: kIsWeb
                ? _buildWebLocalVideo(notifier)
                : _buildMobileLocalVideo(notifier),
            label: 'You',
          );
        } else {
          final remoteUid = state.remoteUsers[index - 1];
          return _buildGridItem(
            child: kIsWeb
                ? _buildWebRemoteVideo(remoteUid, notifier)
                : _buildMobileRemoteVideo(remoteUid, notifier),
            label: 'User $remoteUid',
          );
        }
      },
    );
  }

  Widget _buildGridItem({required Widget child, required String label}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white24, width: 1),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: child,
          ),
          Positioned(
            bottom: 8,
            left: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                label,
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWebLocalVideo(AgoraNotifierProvider notifier) {
    final localTrack = notifier.localVideoTrack;
    if (localTrack == null) {
      return _buildPlaceholder(Icons.videocam_off);
    }

    return WebVideoPlayer(
      localTrack: localTrack,
      viewId: 'local-video-${localTrack.hashCode}',
      isEnabled: notifier.isVideoEnabled,
    );
  }

  Widget _buildWebRemoteVideo(int uid, AgoraNotifierProvider notifier) {
    final remoteTrack = notifier.remoteVideoTracks[uid];
    if (remoteTrack == null) {
      return _buildPlaceholder(Icons.person);
    }

    return WebVideoPlayer(
      remoteTrack: remoteTrack,
      viewId: 'remote-video-$uid',
    );
  }

  Widget _buildMobileLocalVideo(AgoraNotifierProvider notifier) {
    final engine = notifier.engine;
    if (engine == null) {
      return _buildPlaceholder(Icons.videocam_off);
    }

    return AgoraVideoView(
      controller: VideoViewController(
        rtcEngine: engine,
        canvas: const VideoCanvas(uid: 0),
      ),
    );
  }

  Widget _buildMobileRemoteVideo(int uid, AgoraNotifierProvider notifier) {
    final engine = notifier.engine;
    final agoraState = ref.read(agoraProvider);
    
    if (engine == null) {
      return _buildPlaceholder(Icons.person);
    }

    return AgoraVideoView(
      controller: VideoViewController.remote(
        rtcEngine: engine,
        canvas: VideoCanvas(uid: uid),
        connection: RtcConnection(
          channelId: agoraState.tokenData?.channelName,
        ),
      ),
    );
  }

  Widget _buildPlaceholder(IconData icon) {
    return Container(
      color: Colors.grey.shade900,
      child: Center(
        child: Icon(icon, size: 60, color: Colors.white54),
      ),
    );
  }

  Widget _buildAudioCallView(int userCount) {
    final agoraState = ref.watch(agoraProvider);
    final users = ['You', ...agoraState.remoteUsers.map((e) => 'User $e')];
    
    int crossAxisCount = 2;
    if (userCount == 1) crossAxisCount = 1;
    if (userCount >= 5) crossAxisCount = 3;

    return GridView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: users.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemBuilder: (context, index) {
        final isMe = index == 0;
        final isMuted = isMe ? agoraState.isMuted : false;

        return Container(
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(40),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.person, size: 40, color: Colors.white),
                  ),
                  if (isMuted)
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: CircleAvatar(
                        radius: 14,
                        backgroundColor: Colors.red,
                        child: const Icon(
                          Icons.mic_off,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                users[index],
                style: const TextStyle(color: Colors.white, fontSize: 14),
              ),
            ],
          ),
        );
      },
    );
  }
}
