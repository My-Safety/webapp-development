// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agora_join_call_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AgoraJoinCallRequestModelImpl _$$AgoraJoinCallRequestModelImplFromJson(
  Map<String, dynamic> json,
) => _$AgoraJoinCallRequestModelImpl(
  role: json['role'] as String? ?? 'owner',
  visitorId: json['visitorId'] as String?,
);

Map<String, dynamic> _$$AgoraJoinCallRequestModelImplToJson(
  _$AgoraJoinCallRequestModelImpl instance,
) => <String, dynamic>{'role': instance.role, 'visitorId': instance.visitorId};
