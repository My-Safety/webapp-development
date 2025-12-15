import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider to store the scanned QR ID
final qrIdProvider = StateNotifierProvider<QrIdNotifier, String?>(
  (ref) => QrIdNotifier(),
);

/// StateNotifier to manage QR ID state
class QrIdNotifier extends StateNotifier<String?> {
  QrIdNotifier() : super(null);

  /// Set QR ID
  void setQrId(String qrId) {
    state = qrId;
  }

  /// Clear QR ID
  void clearQrId() {
    state = null;
  }

  /// Check if QR ID exists
  bool get hasQrId => state != null && state!.isNotEmpty;
}
