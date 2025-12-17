import 'package:freezed_annotation/freezed_annotation.dart';

part 'send_file_request_model.freezed.dart';
part 'send_file_request_model.g.dart';
// ignore_for_file: invalid_annotation_target

@freezed
class SendFileRequestModel with _$SendFileRequestModel {
  const factory SendFileRequestModel({
    @JsonKey(name: "category") String? category,
    @JsonKey(name: "fileUrl") String? fileUrl,
    @JsonKey(name: "fileName") String? fileName,
    @JsonKey(name: "fileSize") int? fileSize,
    @JsonKey(name: "mimeType") String? mimeType,
    @JsonKey(name: "uploadMethod") String? uploadMethod,
    // // Optional fields (commented in your example)
    // @JsonKey(name: "expiryDate") String? expiryDate,
    // @JsonKey(name: "tags") List<String>? tags,
  }) = _SendFileRequestModel;

  factory SendFileRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SendFileRequestModelFromJson(json);
}
