// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Suresh M, 11/11/2025

import 'dart:convert';
import 'dart:io';

import 'package:file_saver/file_saver.dart';
import 'package:flutter/services.dart';
import 'package:mysafety_web/route/navigation_service.dart';

abstract class DownloadManager {
  static Future<void> downloadBase64String({
    String? base64String,
    required String fileName,
    required MimeType mimeType,
  }) async {
    if (base64String == null) {
      NavigationService.showErrorSnackbar(message: 'Something went wrong');
      return;
    } else {
      Uint8List bytes = base64Decode(base64String);
      await FileSaver.instance.saveAs(
        mimeType: mimeType,
        name: fileName,
        bytes: bytes,
        fileExtension: mimeType.name.toLowerCase(),
      );
    }
  }

  static Future<void> downloadFile({
    required File file,
    required MimeType mimeType,
    required String fileName,
  }) async {
    await FileSaver.instance.saveAs(
      mimeType: mimeType,
      name: fileName,
      bytes: file.readAsBytesSync(),
      fileExtension: mimeType.name.toLowerCase(),
    );
  }
}
