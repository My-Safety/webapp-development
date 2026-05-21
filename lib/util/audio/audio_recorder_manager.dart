import 'dart:async';
import 'package:record/record.dart';
import 'package:mysafety_web/util/utils.dart';

class AudioRecorderManager {
  AudioRecorderManager._();
  static final instance = AudioRecorderManager._();

  final _audioRecorder = AudioRecorder();
  bool _isRecording = false;
  Timer? _recordingTimer;
  int _recordingDuration = 0;

  bool get isRecording => _isRecording;
  int get recordingDuration => _recordingDuration;

  Stream<int> get durationStream => _durationController.stream;
  final _durationController = StreamController<int>.broadcast();

  Future<bool> hasPermission() async {
    try {
      return await _audioRecorder.hasPermission();
    } catch (e) {
      debugPrint('🔴 Permission check error: $e');
      return false;
    }
  }

  Future<bool> startRecording() async {
    try {
      if (_isRecording) {
        debugPrint('⚠️ Already recording');
        return false;
      }

      final hasPermission = await this.hasPermission();
      if (!hasPermission) {
        debugPrint('🔴 No microphone permission');
        return false;
      }

      final path = 'audio_${DateTime.now().millisecondsSinceEpoch}.aac';
      debugPrint('🎤 Starting recording with path: $path');

      await _audioRecorder.start(
        const RecordConfig(
          encoder: AudioEncoder.aacLc,
          bitRate: 128000,
          sampleRate: 44100,
        ),
        path: path,
      );

      _isRecording = true;
      _recordingDuration = 0;
      _startTimer();

      debugPrint('✅ Recording started successfully');
      return true;
    } catch (e, stackTrace) {
      debugPrint('🔴 Start recording error: $e');
      debugPrint('🔴 Stack trace: $stackTrace');
      return false;
    }
  }

  void _startTimer() {
    _recordingTimer?.cancel();
    _recordingTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _recordingDuration++;
      _durationController.add(_recordingDuration);
    });
  }

  Future<String?> stopRecording() async {
    try {
      if (!_isRecording) {
        debugPrint('⚠️ Not recording');
        return null;
      }

      debugPrint('🎤 Stopping audio recorder...');
      _recordingTimer?.cancel();
      _recordingTimer = null;

      final path = await _audioRecorder.stop();
      debugPrint('📁 Recorder returned path: $path');
      
      _isRecording = false;
      _recordingDuration = 0;
      _durationController.add(0);

      if (path == null || path.isEmpty) {
        debugPrint('🔴 Recording path is null or empty');
        return null;
      }

      debugPrint('✅ Recording stopped successfully: $path');
      return path;
    } catch (e, stackTrace) {
      debugPrint('🔴 Stop recording error: $e');
      debugPrint('🔴 Stack trace: $stackTrace');
      _isRecording = false;
      return null;
    }
  }

  Future<void> cancelRecording() async {
    try {
      if (!_isRecording) return;

      _recordingTimer?.cancel();
      _recordingTimer = null;

      await _audioRecorder.stop();
      _isRecording = false;
      _recordingDuration = 0;
      _durationController.add(0);

      debugPrint('❌ Recording cancelled');
    } catch (e) {
      debugPrint('🔴 Cancel recording error: $e');
    }
  }

  void dispose() {
    _recordingTimer?.cancel();
    _durationController.close();
    _audioRecorder.dispose();
  }
}
