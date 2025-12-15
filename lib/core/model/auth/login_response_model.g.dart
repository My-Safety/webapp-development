// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginResponseModelImpl _$$LoginResponseModelImplFromJson(
  Map<String, dynamic> json,
) => _$LoginResponseModelImpl(
  visitor: json['visitor'] == null
      ? null
      : User.fromJson(json['visitor'] as Map<String, dynamic>),
  skipOTP: json['skipOTP'] as bool?,
);

Map<String, dynamic> _$$LoginResponseModelImplToJson(
  _$LoginResponseModelImpl instance,
) => <String, dynamic>{
  'visitor': instance.visitor,
  'skipOTP': instance.skipOTP,
};
