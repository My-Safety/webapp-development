import 'package:file_picker/file_picker.dart';
import 'package:mysafety_web/core/model/base/base_dynamic_response_model.dart';
import 'package:mysafety_web/core/model/file/response/file_upload_response_model.dart';

abstract class ChatRepo {
  Future<BaseDynamicResponse<FileUploadResponseModel>> fileUpload({
    required PlatformFile file,
  });
}
