// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agora_start_call_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AgoraStartCallRequestModelImpl _$$AgoraStartCallRequestModelImplFromJson(
  Map<String, dynamic> json,
) => _$AgoraStartCallRequestModelImpl(
  qrId: json['qrId'] as String?,
  callType: json['callType'] as String? ?? 'video',
);

Map<String, dynamic> _$$AgoraStartCallRequestModelImplToJson(
  _$AgoraStartCallRequestModelImpl instance,
) => <String, dynamic>{'qrId': instance.qrId, 'callType': instance.callType};
