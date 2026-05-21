import 'package:flutter_riverpod/flutter_riverpod.dart';

final recordingDurationProvider = StateProvider<int>((ref) => 0);
final isRecordingProvider = StateProvider<bool>((ref) => false);
