// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Suresh M, 11/11/2025

import 'package:file_picker/file_picker.dart';

abstract class FileManager {
  static Future<PlatformFile?> uploadSingle({
    List<String> allowedExtensions = const ['png', 'jpg', 'jpeg', 'pdf'],
  }) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowedExtensions: allowedExtensions,
      type: FileType.custom,
    );

    if (result != null) {
      return result.files.first;
    } else {
      return null;
    }
  }
}
