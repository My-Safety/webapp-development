// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_history_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatHistoryResponseModelImpl _$$ChatHistoryResponseModelImplFromJson(
  Map<String, dynamic> json,
) => _$ChatHistoryResponseModelImpl(
  id: json['id'] as String?,
  roomId: json['roomId'] as String?,
  senderId: json['senderId'] as String?,
  senderType: json['senderType'] as String?,
  mediaUrl: json['mediaUrl'] as String?,
  mediaDuration: (json['mediaDuration'] as num?)?.toInt(),
  messageType: json['messageType'] as String?,
  content: json['content'] as String?,
  status: json['status'] as String?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  deliveredAt: json['deliveredAt'] == null
      ? null
      : DateTime.parse(json['deliveredAt'] as String),
  senderDetails: json['senderDetails'] == null
      ? null
      : SenderDetails.fromJson(json['senderDetails'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$ChatHistoryResponseModelImplToJson(
  _$ChatHistoryResponseModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'roomId': instance.roomId,
  'senderId': instance.senderId,
  'senderType': instance.senderType,
  'mediaUrl': instance.mediaUrl,
  'mediaDuration': instance.mediaDuration,
  'messageType': instance.messageType,
  'content': instance.content,
  'status': instance.status,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
  'deliveredAt': instance.deliveredAt?.toIso8601String(),
  'senderDetails': instance.senderDetails,
};

_$SenderDetailsImpl _$$SenderDetailsImplFromJson(Map<String, dynamic> json) =>
    _$SenderDetailsImpl(
      name: json['name'] as String?,
      photo: json['photo'] as String?,
    );

Map<String, dynamic> _$$SenderDetailsImplToJson(_$SenderDetailsImpl instance) =>
    <String, dynamic>{'name': instance.name, 'photo': instance.photo};
