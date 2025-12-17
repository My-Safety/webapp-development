import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:mysafety_web/core/model/base/base_dynamic_response_model.dart';
import 'package:mysafety_web/core/model/file/response/file_upload_response_model.dart';
import 'package:mysafety_web/core/network/endpoints/file_upload.dart';
import 'package:mysafety_web/core/network/network.dart';
import 'package:mysafety_web/core/network/network_status.dart';
import 'package:mysafety_web/src/features/chat/data/chat_repo.dart';
import 'package:mysafety_web/util/enum/http_enum.dart';

class ChatRemoteRepo implements ChatRepo {
  @override
  Future<BaseDynamicResponse<FileUploadResponseModel>> fileUpload({
    required PlatformFile file,
  }) async {
    try {
      var response = await NetworkClient.multiPart(
        httpMethodEnum: HttpMethodEnum.post,
        endPoint: FileUploadEndpoint.fileUpload,
        files: [file],
        documentKey: ['file'],
      );

      if (response?.statusCode == NetworkStatus.status200.statusCode) {
        var body = json.decode(response!.body);
        var result = BaseDynamicResponse<FileUploadResponseModel>.fromJson(
          body,
          (json) =>
              FileUploadResponseModel.fromJson(json as Map<String, dynamic>),
        );
        return result;
      }
    } catch (e) {
      return BaseDynamicResponse.error();
    }
    return BaseDynamicResponse.error();
  }
}
