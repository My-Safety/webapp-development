// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'languages_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LanguagesResponseModelImpl _$$LanguagesResponseModelImplFromJson(
  Map<String, dynamic> json,
) => _$LanguagesResponseModelImpl(
  id: json['_id'] as String?,
  name: json['name'] as String?,
  code: json['code'] as String?,
  isActive: json['isActive'] as bool?,
  type: json['type'] as String?,
);

Map<String, dynamic> _$$LanguagesResponseModelImplToJson(
  _$LanguagesResponseModelImpl instance,
) => <String, dynamic>{
  '_id': instance.id,
  'name': instance.name,
  'code': instance.code,
  'isActive': instance.isActive,
  'type': instance.type,
};
