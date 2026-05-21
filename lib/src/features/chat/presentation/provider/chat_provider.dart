import 'dart:async';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mysafety_web/core/model/chat/response/chat_history_response_model/chat_history_response_model.dart';
import 'package:mysafety_web/core/network/endpoints/file_upload.dart';
import 'package:mysafety_web/core/network/network.dart';
import 'package:mysafety_web/core/network/socket/web_socket.dart';
import 'package:mysafety_web/util/enum/http_enum.dart';
import 'package:mysafety_web/util/utils.dart';
import 'package:mysafety_web/util/lifecycle/web_lifecycle_manager.dart';
import 'package:mysafety_web/util/audio/audio_recorder_manager.dart';
import 'package:mysafety_web/src/features/chat/presentation/provider/recording_provider.dart';
import 'dart:convert';

final oneToOneChatControllerProvider =
    StateNotifierProvider<
      OneToOneChatController,
      List<ChatHistoryResponseModel>
    >((ref) => OneToOneChatController(ref));

final selectedMessageIndexProvider = StateProvider<int?>((ref) => null);

class OneToOneChatController
    extends StateNotifier<List<ChatHistoryResponseModel>> {
  OneToOneChatController(this.ref) : super([]);

  final Ref ref;

  StreamSubscription? _messageSub;
  StreamSubscription? _typingSub;
  StreamSubscription? _statusSub;

  bool isOtherTyping = false;
  String? roomId;
  DateTime? _lastSendTime;
  bool isUploading = false;
  StreamSubscription? _recordingSubscription;

  final _audioRecorder = AudioRecorderManager.instance;

  Future<String?> uploadFile(PlatformFile file) async {
    try {
      isUploading = true;
      state = [...state]; // Trigger UI update
      debugPrint('📤 Uploading file: ${file.name}');

      final response = await NetworkClient.multiPart(
        httpMethodEnum: HttpMethodEnum.post,
        endPoint: FileUploadEndpoint.fileUpload,
        files: [file],
        documentKey: ['file'],
      );

      if (response != null) {
        debugPrint('📦 Raw response: ${response.body}');
        final data = json.decode(response.body);
        debugPrint('📦 Parsed data: $data');
        
        // Fix: Use 'fileUrl' instead of 'url'
        final fileUrl = data['data']?['fileUrl'];
        debugPrint('✅ File uploaded successfully: $fileUrl');
        isUploading = false;
        state = [...state]; // Trigger UI update
        return fileUrl;
      }
      debugPrint('🔴 Upload failed: response is null');
      isUploading = false;
      state = [...state]; // Trigger UI update
      return null;
    } catch (e) {
      debugPrint('🔴 Upload error: $e');
      isUploading = false;
      state = [...state]; // Trigger UI update
      return null;
    }
  }
  Future<void> connect(String room) async {
    if (roomId == room && _messageSub != null && WebSocketService.isConnected) {
      debugPrint('✅ Already connected to room: $room');
      return;
    }

    // Disconnect existing listeners first
    disconnect();
    
    roomId = room;
    debugPrint('🔵 Connecting to room: $room');

    // Set room for lifecycle management
    WebLifecycleManager.instance.setCurrentRoom(room);

    try {
      await WebSocketService.connect();
      WebSocketService.joinRoom(room);
      
      // Small delay to ensure room join is processed
      await Future.delayed(const Duration(milliseconds: 300));
      
      _listenMessages();
      _listenTyping();
      _listenStatus();
      
      debugPrint('✅ Chat connected and listening');
    } catch (e) {
      debugPrint('🔴 Failed to connect: $e');
      // Don't rethrow auth errors to prevent multiple connection attempts
      if (!e.toString().contains('Authentication')) {
        rethrow;
      }
    }
  }

  Future<void> listenChatSoket() async {
    _listenMessages();
    _listenTyping();
    _listenStatus();

    debugPrint('✅ Chat listeners active');
  }

  void disconnect() {
    _messageSub?.cancel();
    _typingSub?.cancel();
    _statusSub?.cancel();
    _messageSub = null;
    _typingSub = null;
    _statusSub = null;
    roomId = null;
  }

  void _listenMessages() {
    _messageSub?.cancel();
    _messageSub = WebSocketService.newMessageStream.listen((message) {
      debugPrint('📥 New message received: ${message.content}');
      state = [...state, message];

      // Mark incoming messages as delivered and seen immediately
      if (message.senderType != "Visitor" && message.id != null && roomId != null) {
        WebSocketService.messageDelivered([message.id!]);
        debugPrint('👁️ Auto-marking message as seen: ${message.id}');
        WebSocketService.messageSeen(roomId!, [message.id!]);
      }
    }, onError: (error) => debugPrint('🔴 Message stream error: $error'));
    debugPrint('👂 Message listener active');
  }

  void _listenTyping() {
    _typingSub = WebSocketService.typingStream.listen((data) {
      isOtherTyping = data['isTyping'] ?? false;
    });
  }

  void _listenStatus() {
    _statusSub = WebSocketService.statusUpdateStream.listen((data) {
      final ids = data['messageIds'];
      final status = data['status'];

      if (ids == null || status == null) return;

      state = state
          .map(
            (m) => ids.contains(m.id)
                ? m.copyWith(status: status.toString().toLowerCase())
                : m,
          )
          .toList();
    });
  }

  Future<void> sendText(String text, {int? messageIndex}) async {
    if (messageIndex != null) {
      ref.read(selectedMessageIndexProvider.notifier).state = messageIndex;
    }

    if (roomId == null) {
      debugPrint('🔴 Cannot send - roomId is null');
      return;
    }

    final now = DateTime.now();
    if (_lastSendTime != null &&
        now.difference(_lastSendTime!).inMilliseconds < 500) {
      debugPrint('⚠️ Message send debounced');
      return;
    }

    _lastSendTime = now;
    debugPrint('📤 Sending message to room $roomId: $text');

    if (!WebSocketService.isConnected) {
      debugPrint('⚠️ Socket disconnected, attempting to reconnect...');
      try {
        await connect(roomId!);
      } catch (e) {
        debugPrint('🔴 Reconnect failed: $e');
        return;
      }
    }

    final success = await WebSocketService.sendMessage(
      roomId: roomId!,
      messageType: 'Text',
      content: text,
    );

    debugPrint(success ? '✅ Message sent' : '🔴 Send failed');
  }

  Future<void> sendImage(String mediaUrl) async {
    if (roomId == null) {
      debugPrint('🔴 Cannot send image - roomId is null');
      return;
    }

    if (mediaUrl.isEmpty) {
      debugPrint('🔴 Cannot send image - mediaUrl is empty');
      return;
    }

    debugPrint('📤 Sending image to room $roomId');
    debugPrint('🖼️ Media URL: $mediaUrl');

    if (!WebSocketService.isConnected) {
      debugPrint('⚠️ Socket disconnected, attempting to reconnect...');
      try {
        await connect(roomId!);
      } catch (e) {
        debugPrint('🔴 Reconnect failed: $e');
        return;
      }
    }

    debugPrint('🔌 Socket connected: ${WebSocketService.isConnected}');
    
    final success = await WebSocketService.sendMessage(
      roomId: roomId!,
      messageType: 'Image',
      mediaUrl: mediaUrl,
    );

    debugPrint(success ? '✅ Image sent successfully' : '🔴 Image send failed');
  }

  Future<String?> uploadAudioFile(String filePath) async {
    try {
      isUploading = true;
      state = [...state];
      debugPrint('📤 Uploading audio file: $filePath');

      final file = File(filePath);
      if (!await file.exists()) {
        debugPrint('🔴 Audio file does not exist: $filePath');
        isUploading = false;
        state = [...state];
        return null;
      }

      final bytes = await file.readAsBytes();
      debugPrint('📦 Audio file size: ${bytes.length} bytes');
      final fileName = filePath.split('/').last;
      debugPrint('📝 Audio file name: $fileName');

      final platformFile = PlatformFile(
        name: fileName,
        size: bytes.length,
        bytes: bytes,
      );

      final response = await NetworkClient.multiPart(
        httpMethodEnum: HttpMethodEnum.post,
        endPoint: FileUploadEndpoint.fileUpload,
        files: [platformFile],
        documentKey: ['file'],
      );

      if (response != null) {
        debugPrint('📦 Upload response: ${response.body}');
        final data = json.decode(response.body);
        final fileUrl = data['data']?['fileUrl'];
        debugPrint('✅ Audio uploaded: $fileUrl');
        isUploading = false;
        state = [...state];
        return fileUrl;
      }
      debugPrint('🔴 Upload response is null');
      isUploading = false;
      state = [...state];
      return null;
    } catch (e, stackTrace) {
      debugPrint('🔴 Audio upload error: $e');
      debugPrint('🔴 Stack trace: $stackTrace');
      isUploading = false;
      state = [...state];
      return null;
    }
  }

  Future<void> sendAudio(String mediaUrl, int duration) async {
    if (roomId == null) {
      debugPrint('🔴 Cannot send audio - roomId is null');
      return;
    }

    if (mediaUrl.isEmpty) {
      debugPrint('🔴 Cannot send audio - mediaUrl is empty');
      return;
    }

    debugPrint('📤 Sending audio to room $roomId');
    debugPrint('🎵 Media URL: $mediaUrl');
    debugPrint('⏱️ Duration: $duration seconds');

    if (!WebSocketService.isConnected) {
      debugPrint('⚠️ Socket disconnected, attempting to reconnect...');
      try {
        await connect(roomId!);
      } catch (e) {
        debugPrint('🔴 Reconnect failed: $e');
        return;
      }
    }

    final success = await WebSocketService.sendMessage(
      roomId: roomId!,
      messageType: 'Voice',
      mediaUrl: mediaUrl,
      mediaDuration: duration,
    );

    debugPrint(success ? '✅ Audio sent successfully' : '🔴 Audio send failed');
  }

  Future<void> startRecording() async {
    debugPrint('🎵 Start recording called');
    final started = await _audioRecorder.startRecording();
    debugPrint('🎵 Recording started: $started');
    if (started) {
      ref.read(isRecordingProvider.notifier).state = true;
      debugPrint('🔴 Recording state set to true');
      _recordingSubscription = _audioRecorder.durationStream.listen((duration) {
        ref.read(recordingDurationProvider.notifier).state = duration;
        debugPrint('⏱️ Duration updated: $duration');
      });
    } else {
      debugPrint('🔴 Failed to start recording');
    }
  }

  Future<void> stopAndSendRecording() async {
    debugPrint('🛑 Stopping recording...');
    final filePath = await _audioRecorder.stopRecording();
    debugPrint('📁 Recording file path: $filePath');
    
    ref.read(isRecordingProvider.notifier).state = false;
    _recordingSubscription?.cancel();
    
    if (filePath != null && filePath.isNotEmpty) {
      debugPrint('🎤 Recording saved: $filePath');
      final duration = ref.read(recordingDurationProvider);
      debugPrint('⏱️ Recording duration: $duration seconds');
      ref.read(recordingDurationProvider.notifier).state = 0;
      
      debugPrint('📤 Starting audio upload...');
      final audioUrl = await uploadAudioFile(filePath);
      debugPrint('🔗 Audio URL received: $audioUrl');
      
      if (audioUrl != null && audioUrl.isNotEmpty) {
        debugPrint('✅ Audio URL valid, sending via socket...');
        await sendAudio(audioUrl, duration);
        debugPrint('✅ Audio send completed');
      } else {
        debugPrint('🔴 Audio URL is null or empty, cannot send');
      }
    } else {
      debugPrint('🔴 Recording file path is null or empty');
      ref.read(recordingDurationProvider.notifier).state = 0;
    }
  }

  Future<void> cancelRecording() async {
    await _audioRecorder.cancelRecording();
    ref.read(isRecordingProvider.notifier).state = false;
    ref.read(recordingDurationProvider.notifier).state = 0;
    _recordingSubscription?.cancel();
  }

  void sendTyping(bool typing) {
    if (roomId == null) return;
    WebSocketService.sendTyping(roomId!, typing);
  }

  void _markSeen() {
    final unseen = state
        .where(
          (m) =>
              m.senderType != "Visitor" && m.status != 'seen' && m.id != null,
        )
        .map((m) => m.id!)
        .toList();

    if (unseen.isNotEmpty && roomId != null) {
      WebSocketService.messageSeen(roomId!, unseen);
    }
  }

  void markAllAsSeen(String room) {
    final unseen = state
        .where(
          (m) =>
              m.senderType != "Visitor" && m.status != 'seen' && m.id != null,
        )
        .map((m) => m.id!)
        .toList();

    if (unseen.isNotEmpty) {
      debugPrint('✅ Marking ${unseen.length} messages as seen');
      WebSocketService.messageSeen(room, unseen);
    }
  }

  @override
  void dispose() {
    disconnect();
    _recordingSubscription?.cancel();
    super.dispose();
  }
}
