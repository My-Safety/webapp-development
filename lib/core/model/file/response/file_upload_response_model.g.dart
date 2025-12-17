// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_upload_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FileUploadResponseModelImpl _$$FileUploadResponseModelImplFromJson(
  Map<String, dynamic> json,
) => _$FileUploadResponseModelImpl(
  fileUrl: json['fileUrl'] as String?,
  fileName: json['fileName'] as String?,
  fileSize: (json['fileSize'] as num?)?.toInt(),
  mimeType: json['mimeType'] as String?,
);

Map<String, dynamic> _$$FileUploadResponseModelImplToJson(
  _$FileUploadResponseModelImpl instance,
) => <String, dynamic>{
  'fileUrl': instance.fileUrl,
  'fileName': instance.fileName,
  'fileSize': instance.fileSize,
  'mimeType': instance.mimeType,
};
