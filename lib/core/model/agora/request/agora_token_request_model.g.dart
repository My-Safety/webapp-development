// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agora_token_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AgoraTokenRequestModelImpl _$$AgoraTokenRequestModelImplFromJson(
  Map<String, dynamic> json,
) => _$AgoraTokenRequestModelImpl(
  uid: (json['uid'] as num).toInt(),
  role: json['role'] as String? ?? 'publisher',
);

Map<String, dynamic> _$$AgoraTokenRequestModelImplToJson(
  _$AgoraTokenRequestModelImpl instance,
) => <String, dynamic>{'uid': instance.uid, 'role': instance.role};
