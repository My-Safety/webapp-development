// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agora_token_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AgoraTokenResponseModelImpl _$$AgoraTokenResponseModelImplFromJson(
  Map<String, dynamic> json,
) => _$AgoraTokenResponseModelImpl(
  agoraToken: json['agoraToken'] as String,
  appId: json['appId'] as String,
  channelName: json['channelName'] as String,
  uid: (json['uid'] as num).toInt(),
  expiresAt: json['expiresAt'] as String,
);

Map<String, dynamic> _$$AgoraTokenResponseModelImplToJson(
  _$AgoraTokenResponseModelImpl instance,
) => <String, dynamic>{
  'agoraToken': instance.agoraToken,
  'appId': instance.appId,
  'channelName': instance.channelName,
  'uid': instance.uid,
  'expiresAt': instance.expiresAt,
};
