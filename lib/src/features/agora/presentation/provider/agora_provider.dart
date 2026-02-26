// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Adwaith c, 16/12/2025

import 'dart:async';
import 'dart:js_interop';
import 'package:flutter/foundation.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mysafety_web/core/model/agora/request/agora_join_call_request_model.dart';
import 'package:mysafety_web/core/model/agora/response/agora_start_call_response_model.dart';
import 'package:mysafety_web/core/model/agora/response/agora_token_response_model.dart';
import 'package:mysafety_web/core/model/agora/request/agora_start_call_request_model.dart';
import 'package:mysafety_web/core/model/agora/request/agora_token_request_model.dart';
import 'package:mysafety_web/core/model/agora/state/agora_state.dart';
import 'package:mysafety_web/core/network/network_status.dart';
import 'package:mysafety_web/src/features/agora/data/agora_remote_repo.dart';
import 'package:mysafety_web/src/features/agora/data/agora_web_interop.dart';

// Mobile only imports
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:permission_handler/permission_handler.dart';

// ignore: depend_on_referenced_packages
import 'package:web/web.dart' as web;

final agoraProvider = StateNotifierProvider<AgoraNotifierProvider, AgoraState>(
  (ref) => AgoraNotifierProvider(ref),
);

class AgoraNotifierProvider extends StateNotifier<AgoraState> {
  AgoraNotifierProvider(this.ref) : super(const AgoraState());

  final Ref ref;
  RtcEngine? _engine; // Mobile only
  IAgoraRTCClient? _webClient; // Web only
  ILocalAudioTrack? _localAudioTrack; // Web audio track
  ILocalVideoTrack? _localVideoTrack; // Web video track
  final Map<int, IRemoteVideoTrack> _remoteVideoTracks = {};
  Timer? _tokenRefreshTimer;
  Timer? _callDurationTimer;
  bool _isDisposed = false;
  bool get isCallInitiated => state.isCallInitiated;
  AgoraStartCallResponseModel? get startCallData => state.startCallData;
  AgoraTokenResponseModel? get joinCallData => state.joinCallData;

  RtcEngine? get engine => _engine;
  ILocalVideoTrack? get localVideoTrack => _localVideoTrack;
  Map<int, IRemoteVideoTrack> get remoteVideoTracks => _remoteVideoTracks;
  bool get isCallActive => state.isCallActive;
  bool get isMuted => state.isMuted;
  bool get isVideoEnabled => state.isVideoEnabled;
  List<int> get remoteUsers => state.remoteUsers;

  bool get _isWeb => kIsWeb;
  void setCallInitiated(bool value) {
    state = state.copyWith(isCallInitiated: value);
  }

  Future<bool> requestPermissions() async {
    if (_isWeb) {
      debugPrint(' Web permissions granted automatically');
      return true;
    }

    Map<Permission, PermissionStatus> permissions = await [
      Permission.camera,
      Permission.microphone,
    ].request();

    return permissions[Permission.camera] == PermissionStatus.granted &&
        permissions[Permission.microphone] == PermissionStatus.granted;
  }

  Future<bool> startCall({
    required String qrId,
    required String callType,
    required String visitorId,
  }) async {
    state = state.copyWith(isLoading: true, isCallInitiated: true);
    // Request permissions
    if (!await requestPermissions()) {
      debugPrint(' Permissions denied');
      state = state.copyWith(
        isLoading: false,
        isCallInitiated: false,
        error: 'Camera and microphone permissions required',
      );
      return false;
    }
    var response = await ref
        .read(agoraRemoteRepoProvider)
        .startCall(
          request: AgoraStartCallRequestModel(callType: callType, qrId: qrId),
        );
    if (response.success == ActionStatus.success.code) {
      state = state.copyWith(isLoading: false, startCallData: response.data);
      debugPrint(' Call started: ${state.startCallData!.callId}');
      await joinCall(
        role: "visitor",
        callId: state.startCallData!.callId,
        visitorId: visitorId,
      );
      return true;
    } else {
      state = state.copyWith(isLoading: false, startCallData: null, isCallInitiated: false);
      return false;
    }
  }

  Future<bool> joinCall({
    required String role,
    required String callId,
    required String visitorId,
  }) async {
    try {
      state = state.copyWith(isLoading: true);
      debugPrint(' Joining call: $callId');

      final response = await ref
          .read(agoraRemoteRepoProvider)
          .joinCall(
            callId: callId,
            request: AgoraJoinCallRequestModel(
              role: role,
              visitorId: visitorId,
            ),
          );

      if (response.success == ActionStatus.success.code) {
        state = state.copyWith(
          isLoading: false,
          joinCallData: response.data,
          tokenData: response.data,
        );

        debugPrint(' Token data set: AppId=${state.tokenData?.appId}');

        await _initializeAgoraEngine();
        await _joinChannel();
        _startTokenRefreshTimer();
        _startCallDurationMonitor();
        return true;
      }

      state = state.copyWith(
        isLoading: false,
        joinCallData: null,
        error: 'Failed to join call',
      );
      return false;
    } catch (e) {
      debugPrint(' Error in joinCall: $e');
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to initialize call: $e',
      );
      return false;
    }
  }

  Future<void> _initializeAgoraEngine() async {
    if (state.tokenData?.appId == null || state.tokenData!.appId.isEmpty) {
      final error = 'Invalid Agora App ID - tokenData is null or empty';
      debugPrint(' $error');
      state = state.copyWith(error: error);
      throw Exception(error);
    }

    if (_isWeb) {
      await _initializeWebEngine();
    } else {
      await _initializeMobileEngine();
    }
  }

  Future<void> _initializeWebEngine() async {
    try {
      debugPrint('Initializing Agora Web SDK...');

      await _loadAgoraWebSdk();

      debugPrint(' Agora Web SDK loaded');
      debugPrint('Initializing with AppId: ${state.tokenData!.appId}');

      state = state.copyWith(isWebSdkLoaded: true);
    } catch (e) {
      debugPrint(' Web SDK initialization error: $e');
      rethrow;
    }
  }

  Future<void> _loadAgoraWebSdk() {
    final completer = Completer<void>();

    final script =
        (web.document.createElement('script') as web.HTMLScriptElement);
    script.src = 'https://download.agora.io/sdk/release/AgoraRTC_N.js';
    script.async = true;

    script.onload = ((JSAny event) {
      debugPrint(' Agora Web SDK script loaded');
      completer.complete();
    }).toJS;

    script.onerror = ((JSAny event) {
      debugPrint(' Failed to load Agora Web SDK');
      completer.completeError('Failed to load Agora Web SDK');
    }).toJS;

    web.document.head?.appendChild(script);
    return completer.future;
  }

  Future<void> _initializeMobileEngine() async {
    _engine = createAgoraRtcEngine();
    debugPrint('Initializing with AppId: ${state.tokenData!.appId}');
    await _engine!.initialize(
      RtcEngineContext(
        appId: state.tokenData!.appId,
        channelProfile: ChannelProfileType.channelProfileCommunication,
        audioScenario: AudioScenarioType.audioScenarioDefault,
      ),
    );

    _engine!.registerEventHandler(
      RtcEngineEventHandler(
        onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
          debugPrint(' Local user joined: ${connection.localUid}');
          state = state.copyWith(isCallActive: true);
        },
        onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
          debugPrint(' Remote user joined: $remoteUid');
          state = state.copyWith(
            remoteUsers: [...state.remoteUsers, remoteUid],
            isRemoteUserJoined: true,
          );
        },
        onUserOffline:
            (
              RtcConnection connection,
              int remoteUid,
              UserOfflineReasonType reason,
            ) {
              debugPrint(' Remote user left: $remoteUid');
              final updatedUsers = state.remoteUsers
                  .where((uid) => uid != remoteUid)
                  .toList();
              state = state.copyWith(
                remoteUsers: updatedUsers,
                isRemoteUserJoined: updatedUsers.isNotEmpty,
              );
            },
        onTokenPrivilegeWillExpire: (RtcConnection connection, String token) {
          debugPrint(' Token expiring, refreshing...');
          _refreshToken();
        },
        onError: (ErrorCodeType err, String msg) {
          debugPrint(' Agora Error: $err - $msg');
          state = state.copyWith(error: 'Connection error: $msg');
        },
      ),
    );

    await _engine!.enableAudio();

    // Only enable video for video calls
    if (state.startCallData?.callType == 'video') {
      await _engine!.enableVideo();
    } else {
      await _engine!.disableVideo();
    }

    await _engine!.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
  }

  Future<void> _joinChannel() async {
    try {
      final appId = state.tokenData?.appId.trim();
      final token = state.tokenData?.agoraToken.trim();
      final channel = state.tokenData?.channelName.trim();
      final uid = state.tokenData?.uid;

      if (appId == null || appId.isEmpty) {
        throw Exception('Invalid AppId: null or empty');
      }
      if (token == null || token.isEmpty) {
        throw Exception('Invalid token: null or empty');
      }
      if (channel == null || channel.isEmpty) {
        throw Exception('Invalid channel: null or empty');
      }
      if (uid == null) {
        throw Exception('Invalid UID: null');
      }

      if (_isWeb) {
        await _joinChannelWeb(appId, token, channel, uid);
      } else {
        await _joinChannelMobile(appId, token, channel, uid);
      }
    } catch (e) {
      debugPrint('🔴 Join channel error: $e');
      rethrow;
    }
  }

  Future<void> _joinChannelWeb(
    String appId,
    String token,
    String channel,
    int uid,
  ) async {
    try {
      debugPrint('═══════════════════════════════════════');
      debugPrint('🌐 WEB CALL - REAL CONNECTION');
      debugPrint('═══════════════════════════════════════');
      debugPrint('Channel: $channel');
      debugPrint('My UID: $uid');
      debugPrint('AppId: $appId');
      debugPrint('🎵 INCOMING VOICE CHECK: Starting audio connection...');
      debugPrint('═══════════════════════════════════════');

      // Reset disposed flag
      _isDisposed = false;
      debugPrint('🎵 INCOMING VOICE CHECK: Reset disposed flag to false');

      // Create Agora client
      _webClient =
          agoraRTC.createClient(ClientConfig(mode: 'rtc', codec: 'vp8'))
              as IAgoraRTCClient;

      debugPrint('✅ Web client created');
      debugPrint('🎵 INCOMING VOICE CHECK: Client ready for audio');

      // Set up event listeners
      debugPrint('🎵 INCOMING VOICE CHECK: Setting up event listeners...');

      _webClient!.on(
        'user-published',
        ((JSAny user, JSAny mediaType) {
          debugPrint(
            '🎵 INCOMING VOICE CHECK: user-published event triggered!',
          );
          if (_isDisposed || _webClient == null) {
            debugPrint(
              '🔴 INCOMING VOICE CHECK: Disposed or no client, ignoring event',
            );
            return;
          }
          try {
            final type = (mediaType as JSString).toDart;
            final remoteUser = user as IAgoraRTCRemoteUser;
            final uid = (remoteUser.uid as JSNumber).toDartInt;

            debugPrint('✅ Remote user $uid published: $type');
            debugPrint('🎵 INCOMING VOICE CHECK: Remote user audio published!');

            // Automatically subscribe to audio
            Future(() async {
              if (_isDisposed || _webClient == null) return;
              try {
                debugPrint(
                  '🎵 INCOMING VOICE CHECK: Auto-subscribing to $type from UID $uid',
                );
                await _webClient!.subscribe(user, mediaType).toDart;
                debugPrint('✅ Subscribed to $type from UID $uid');
                debugPrint(
                  '🎵 INCOMING VOICE CHECK: Successfully subscribed to remote audio!',
                );

                // Play remote audio track
                if (type == 'audio') {
                  final audioTrack = remoteUser.audioTrack;
                  if (audioTrack != null) {
                    audioTrack.play();
                    debugPrint('🔊 Remote audio track playing from UID $uid');
                  }
                }

                debugPrint(
                  '🎵 INCOMING VOICE CHECK: You should now hear incoming voice!',
                );

                if (_isDisposed) return;

                if (type == 'video') {
                  await Future.delayed(const Duration(milliseconds: 100));
                  if (_isDisposed) return;

                  final videoTrack = remoteUser.videoTrack;
                  if (videoTrack != null) {
                    _remoteVideoTracks[uid] = videoTrack;
                    debugPrint('✅ Video track stored for uid: $uid');
                    // Force UI rebuild
                    if (!_isDisposed) {
                      state = state.copyWith(remoteUsers: [...state.remoteUsers]);
                    }
                  }
                }

                if (!_isDisposed && !state.remoteUsers.contains(uid)) {
                  state = state.copyWith(
                    isRemoteUserJoined: true,
                    remoteUsers: [...state.remoteUsers, uid],
                  );
                  debugPrint(
                    '🎵 INCOMING VOICE CHECK: Remote user $uid added to state',
                  );
                }
              } catch (e) {
                debugPrint('⚠️ Error in subscribe: $e');
                debugPrint(
                  '🔴 INCOMING VOICE CHECK: Failed to subscribe to audio!',
                );
              }
            });
          } catch (e) {
            debugPrint('⚠️ Error handling user-published: $e');
            debugPrint(
              '🔴 INCOMING VOICE CHECK: Error handling audio publish!',
            );
          }
        }).toJS,
      );

      debugPrint('🎵 INCOMING VOICE CHECK: Event listeners set up complete');

      _webClient!.on(
        'user-unpublished',
        ((JSAny user, JSAny mediaType) {
          if (_isDisposed || _webClient == null) return;
          try {
            final remoteUser = user as IAgoraRTCRemoteUser;
            final uid = (remoteUser.uid as JSNumber).toDartInt;
            final type = (mediaType as JSString).toDart;

            debugPrint('👋 Remote user $uid unpublished: $type');

            if (type == 'video') {
              _remoteVideoTracks.remove(uid);
              if (!_isDisposed) {
                // Force UI rebuild by creating new list
                state = state.copyWith(remoteUsers: [...state.remoteUsers]);
              }
            }
          } catch (e) {
            debugPrint('⚠️ Error handling user-unpublished: $e');
          }
        }).toJS,
      );

      _webClient!.on(
        'user-left',
        ((JSAny user) {
          if (_isDisposed || _webClient == null) return;
          try {
            final remoteUser = user as IAgoraRTCRemoteUser;
            final uid = (remoteUser.uid as JSNumber).toDartInt;

            debugPrint('👋 Remote user $uid left');

            _remoteVideoTracks.remove(uid);
            if (!_isDisposed) {
              final updatedUsers = state.remoteUsers
                  .where((u) => u != uid)
                  .toList();
              state = state.copyWith(
                remoteUsers: updatedUsers,
                isRemoteUserJoined: updatedUsers.isNotEmpty,
              );
            }
          } catch (e) {
            debugPrint('⚠️ Error handling user-left: $e');
          }
        }).toJS,
      );

      final isVideoCall = state.startCallData?.callType == 'video';

      // Create tracks BEFORE joining channel
      debugPrint('🎥 Creating media tracks...');
      
      // Create audio track
      final audioTrack = await agoraRTC.createMicrophoneAudioTrack().toDart;
      _localAudioTrack = audioTrack as ILocalAudioTrack?;

      if (_localAudioTrack == null) {
        debugPrint('🔴 Failed to create local audio track!');
        throw Exception('Failed to create audio track');
      }
      debugPrint('✅ Audio track created');

      // Create video track for video calls
      if (isVideoCall) {
        final videoTrack = await agoraRTC.createCameraVideoTrack().toDart;
        _localVideoTrack = videoTrack as ILocalVideoTrack?;

        if (_localVideoTrack == null) {
          debugPrint('🔴 Failed to create local video track!');
          throw Exception('Failed to create video track');
        }
        debugPrint('✅ Video track created');
        state = state.copyWith(isVideoEnabled: true);
      }

      // Join channel
      await _webClient!.join(appId, channel, token, uid.toJS).toDart;
      debugPrint('✅ Joined web channel');

      state = state.copyWith(isCallActive: true);

      // Publish audio track
      final audioJS = (_localAudioTrack as JSAny);
      await _webClient!.publish(audioJS).toDart;
      debugPrint('✅ Audio track published');
      debugPrint('🎵 Local microphone is now active!');

      // Publish video track for video calls
      if (isVideoCall && _localVideoTrack != null) {
        final videoJS = (_localVideoTrack as JSAny);
        await _webClient!.publish(videoJS).toDart;
        debugPrint('✅ Video track published');
        debugPrint('🎥 Local camera is now active!');
      }

      debugPrint(
        '🎵 REAL ${isVideoCall ? "video" : "audio"} connection established!',
      );
      debugPrint('🎵 INCOMING VOICE CHECK: Audio connection is LIVE!');
      debugPrint(
        '🎵 INCOMING VOICE CHECK: If you can\'t hear audio, check browser permissions!',
      );
    } catch (e) {
      debugPrint('🔴 Web join error: $e');
      debugPrint('🔴 INCOMING VOICE CHECK: Audio connection FAILED!');
      state = state.copyWith(error: 'Failed to join web call: $e');
      rethrow;
    }
  }

  Future<void> _joinChannelMobile(
    String appId,
    String token,
    String channel,
    int uid,
  ) async {
    final isAudioCall = state.startCallData?.callType == 'audio';

    debugPrint('═══════════════════════════════════════');
    debugPrint('📱 MOBILE CALL - REAL CONNECTION');
    debugPrint('═══════════════════════════════════════');
    debugPrint('Channel: $channel');
    debugPrint('My UID: $uid');
    debugPrint('Call Type: ${isAudioCall ? "Audio" : "Video"}');
    debugPrint('✅ This will establish REAL audio connection');
    debugPrint('═══════════════════════════════════════');

    await _engine!.joinChannel(
      token: token,
      channelId: channel,
      uid: uid,
      options: ChannelMediaOptions(
        clientRoleType: ClientRoleType.clientRoleBroadcaster,
        publishMicrophoneTrack: true,
        publishCameraTrack: !isAudioCall,
        autoSubscribeAudio: true,
        autoSubscribeVideo: !isAudioCall,
      ),
    );

    debugPrint('✅ Mobile joined channel successfully');
    debugPrint('🎵 Audio should now be working!');
  }

  void _startTokenRefreshTimer() {
    _tokenRefreshTimer?.cancel();
    _tokenRefreshTimer = Timer.periodic(const Duration(minutes: 14), (timer) {
      _refreshToken();
    });
  }

  void _startCallDurationMonitor() {
    if (state.startCallData?.endsAt == null) return;

    final endsAt = DateTime.parse(state.startCallData!.endsAt);
    final now = DateTime.now();
    final remainingDuration = endsAt.difference(now);

    if (remainingDuration.isNegative) {
      endCall();
      return;
    }

    _callDurationTimer?.cancel();
    _callDurationTimer = Timer(remainingDuration, () {
      endCall();
    });
  }

  Future<void> _refreshToken() async {
    if (state.startCallData == null) return;

    try {
      final tokenResult = await ref
          .read(agoraRemoteRepoProvider)
          .generateToken(
            callId: state.startCallData!.callId,
            request: AgoraTokenRequestModel(uid: state.tokenData!.uid),
          );

      if (tokenResult.success == ActionStatus.success.code) {
        state = state.copyWith(tokenData: tokenResult.data);
        await _engine!.renewToken(tokenResult.data!.agoraToken);
      }
    } catch (e) {
      debugPrint('Token refresh failed: $e');
    }
  }

  Future<void> toggleMute() async {
    try {
      final newMuteState = !state.isMuted;

      if (_isWeb) {
        if (_localAudioTrack != null) {
          _localAudioTrack!.setEnabled(!newMuteState);
          debugPrint('✅ Web mute toggled: $newMuteState');
        }
      } else {
        if (_engine == null) return;
        await _engine!.muteLocalAudioStream(newMuteState);
      }

      state = state.copyWith(isMuted: newMuteState);
    } catch (e) {
      debugPrint('Error toggling mute: $e');
    }
  }

  Future<void> toggleVideo() async {
    try {
      final newVideoState = !state.isVideoEnabled;

      if (_isWeb) {
        if (newVideoState) {
          // Enable video - create and publish track if not exists
          if (_localVideoTrack == null) {
            final videoTrack = await agoraRTC.createCameraVideoTrack().toDart;
            _localVideoTrack = videoTrack as ILocalVideoTrack?;
            
            if (_localVideoTrack != null && _webClient != null) {
              final videoJS = (_localVideoTrack as JSAny);
              await _webClient!.publish(videoJS).toDart;
              debugPrint('✅ Video track created and published');
            }
          } else {
            _localVideoTrack!.setEnabled(true);
            debugPrint('✅ Video track enabled');
          }
        } else {
          // Disable video
          if (_localVideoTrack != null) {
            _localVideoTrack!.setEnabled(false);
            debugPrint('✅ Video track disabled');
          }
        }
        
        // Force UI rebuild by updating state
        state = state.copyWith(
          isVideoEnabled: newVideoState,
          remoteUsers: [...state.remoteUsers],
        );
      } else {
        if (_engine == null) return;
        await _engine!.muteLocalVideoStream(!newVideoState);
        state = state.copyWith(isVideoEnabled: newVideoState);
      }
    } catch (e) {
      debugPrint('Error toggling video: $e');
    }
  }

  Future<void> switchCamera() async {
    try {
      if (_isWeb) {
        debugPrint('Camera switching not available on Web');
        return;
      }

      if (_engine == null) return;
      await _engine!.switchCamera();
      state = state.copyWith(isFrontCamera: !state.isFrontCamera);
    } catch (e) {
      debugPrint('Error switching camera: $e');
    }
  }

  Future<void> toggleSpeaker() async {
    try {
      final newSpeakerState = !state.isSpeakerOn;

      if (_isWeb) {
        debugPrint('Speaker toggle not needed on Web');
      } else {
        if (_engine == null) return;
        await _engine!.setEnableSpeakerphone(newSpeakerState);
      }

      state = state.copyWith(isSpeakerOn: newSpeakerState);
    } catch (e) {
      debugPrint('Error toggling speaker: $e');
    }
  }

  Future<void> endCall({bool skipApiCall = false}) async {
    try {
      debugPrint(' Starting endCall...');
      _isDisposed = true;
      _tokenRefreshTimer?.cancel();
      _callDurationTimer?.cancel();

      if (_isWeb) {
        // Unpublish tracks first
        try {
          if (_webClient != null) {
            if (_localAudioTrack != null) {
              await _webClient!.unpublish(_localAudioTrack as JSAny).toDart;
              debugPrint(' Audio track unpublished');
            }
            if (_localVideoTrack != null) {
              await _webClient!.unpublish(_localVideoTrack as JSAny).toDart;
              debugPrint(' Video track unpublished');
            }
          }
        } catch (e) {
          debugPrint('Error unpublishing tracks: $e');
        }

        // Close tracks
        try {
          if (_localAudioTrack != null) {
            final closePromise = _localAudioTrack!.close();
            await closePromise.toDart;
                      _localAudioTrack = null;
            debugPrint(' Audio track closed');
          }
        } catch (e) {
          _localAudioTrack = null;
          debugPrint(' Error closing audio track: $e');
        }

        try {
          if (_localVideoTrack != null) {
            final closePromise = _localVideoTrack!.close();
            await closePromise.toDart;
                      _localVideoTrack = null;
            debugPrint(' Video track closed');
          }
        } catch (e) {
          _localVideoTrack = null;
          debugPrint(' Error closing video track: $e');
        }

        _remoteVideoTracks.clear();

        // Leave channel
        try {
          if (_webClient != null) {
            await _webClient!.leave().toDart;
            _webClient = null;
            debugPrint('✅ Left web channel');
          }
        } catch (e) {
          debugPrint('⚠️ Error leaving channel: $e');
        }

        debugPrint('✅ Web channel cleanup completed');
      } else {
        if (_engine != null) {
          await _engine!.leaveChannel();
          await _engine!.release();
          _engine = null;
          debugPrint('✅ Mobile engine released');
        }
      }

      // Call API to end call only if not skipped
      if (!skipApiCall && state.startCallData != null) {
        try {
          await ref
              .read(agoraRemoteRepoProvider)
              .endCall(callId: state.startCallData!.callId);
          debugPrint('✅ End call API called');
        } catch (e) {
          debugPrint('⚠️ Error calling endCall API: $e');
        }
      } else if (skipApiCall) {
        debugPrint('⏭️ Skipped end call API (remote user ended)');
      }

      state = const AgoraState();
      debugPrint('✅ Call ended successfully');
    } catch (e) {
      debugPrint('🔴 Error ending call: $e');
      _isDisposed = true;
      state = const AgoraState();
    }
  }

  @override
  void dispose() {
    _isDisposed = true;
    _tokenRefreshTimer?.cancel();
    _callDurationTimer?.cancel();

    if (_isWeb) {
      _localAudioTrack = null;
      _localVideoTrack = null;
      _remoteVideoTracks.clear();
      _webClient = null;
    } else {
      try {
        if (_engine != null) {
          _engine!.leaveChannel();
          _engine!.release();
        }
      } catch (e) {
        debugPrint('⚠️ Error in dispose: $e');
      }
    }
    super.dispose();
  }
}
