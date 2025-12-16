// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Adwaith c, 15/12/2025



import 'package:mysafety_web/core/model/base/base_dynamic_response_model.dart';
import 'package:mysafety_web/core/model/profile/languages/languages_response_model.dart';
import 'package:mysafety_web/core/model/qr/qr_scan_response_model.dart';

abstract class ProfileRepo {
  Future<BaseDynamicResponse<List<LanguagesResponseModel>>> getlanguages();

  /// Doorbell QR Scan
  Future<BaseDynamicResponse<QrScanResponseModel>> handleDoorbellScan({
    required String qrId,
  });
}
