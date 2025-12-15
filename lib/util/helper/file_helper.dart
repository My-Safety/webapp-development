import 'package:file_picker/file_picker.dart';

String resolveFileName({
  String? apiUrlOrPath,
  PlatformFile? platformFile,
}) {
  // Priority 1: User picked file
  if (platformFile != null && platformFile.name.isNotEmpty) {
    return platformFile.name;
  }

  // Priority 2: API URL or local path
  if (apiUrlOrPath != null && apiUrlOrPath.isNotEmpty) {
    return apiUrlOrPath.split('/').last;
  }

  return '';
}
