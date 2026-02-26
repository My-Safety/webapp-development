// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'predefined_message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PredefinedMessageModelImpl _$$PredefinedMessageModelImplFromJson(
  Map<String, dynamic> json,
) => _$PredefinedMessageModelImpl(
  id: json['_id'] as String?,
  moduleType: json['moduleType'] as String?,
  title: json['title'] as String?,
  message: json['message'] as String?,
  isDefault: json['isDefault'] as bool?,
  audioId: json['audioId'] as String?,
  createdAt: json['createdAt'] as String?,
);

Map<String, dynamic> _$$PredefinedMessageModelImplToJson(
  _$PredefinedMessageModelImpl instance,
) => <String, dynamic>{
  '_id': instance.id,
  'moduleType': instance.moduleType,
  'title': instance.title,
  'message': instance.message,
  'isDefault': instance.isDefault,
  'audioId': instance.audioId,
  'createdAt': instance.createdAt,
};
