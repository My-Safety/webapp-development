import 'package:freezed_annotation/freezed_annotation.dart';

part 'file_upload_response_model.freezed.dart';
part 'file_upload_response_model.g.dart';
// ignore_for_file: invalid_annotation_target

@freezed
class FileUploadResponseModel with _$FileUploadResponseModel {
  const factory FileUploadResponseModel({
    @JsonKey(name: 'fileUrl') String? fileUrl,
    @JsonKey(name: 'fileName') String? fileName,
    @JsonKey(name: 'fileSize') int? fileSize,
    @JsonKey(name: 'mimeType') String? mimeType,
  }) = _FileUploadResponseModel;

  factory FileUploadResponseModel.fromJson(Map<String, dynamic> json) =>
      _$FileUploadResponseModelFromJson(json);
}
