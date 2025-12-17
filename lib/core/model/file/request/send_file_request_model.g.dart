// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_file_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SendFileRequestModelImpl _$$SendFileRequestModelImplFromJson(
  Map<String, dynamic> json,
) => _$SendFileRequestModelImpl(
  category: json['category'] as String?,
  fileUrl: json['fileUrl'] as String?,
  fileName: json['fileName'] as String?,
  fileSize: (json['fileSize'] as num?)?.toInt(),
  mimeType: json['mimeType'] as String?,
  uploadMethod: json['uploadMethod'] as String?,
);

Map<String, dynamic> _$$SendFileRequestModelImplToJson(
  _$SendFileRequestModelImpl instance,
) => <String, dynamic>{
  'category': instance.category,
  'fileUrl': instance.fileUrl,
  'fileName': instance.fileName,
  'fileSize': instance.fileSize,
  'mimeType': instance.mimeType,
  'uploadMethod': instance.uploadMethod,
};
