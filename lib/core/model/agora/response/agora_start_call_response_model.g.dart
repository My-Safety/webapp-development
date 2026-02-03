// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agora_start_call_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AgoraStartCallResponseModelImpl _$$AgoraStartCallResponseModelImplFromJson(
  Map<String, dynamic> json,
) => _$AgoraStartCallResponseModelImpl(
  callId: json['callId'] as String,
  channelName: json['channelName'] as String,
  endsAt: json['endsAt'] as String,
  maxDurationSeconds: (json['maxDurationSeconds'] as num).toInt(),
  maxParticipants: (json['maxParticipants'] as num).toInt(),
  callType: json['callType'] as String? ?? 'audio',
);

Map<String, dynamic> _$$AgoraStartCallResponseModelImplToJson(
  _$AgoraStartCallResponseModelImpl instance,
) => <String, dynamic>{
  'callId': instance.callId,
  'channelName': instance.channelName,
  'endsAt': instance.endsAt,
  'maxDurationSeconds': instance.maxDurationSeconds,
  'maxParticipants': instance.maxParticipants,
  'callType': instance.callType,
};
