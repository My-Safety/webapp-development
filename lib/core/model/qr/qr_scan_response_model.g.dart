// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_scan_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QrScanResponseModelImpl _$$QrScanResponseModelImplFromJson(
  Map<String, dynamic> json,
) => _$QrScanResponseModelImpl(
  chatRoom: json['chatRoom'] == null
      ? null
      : ChatRoomModel.fromJson(json['chatRoom'] as Map<String, dynamic>),
  visit: json['visit'] == null
      ? null
      : VisitModel.fromJson(json['visit'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$QrScanResponseModelImplToJson(
  _$QrScanResponseModelImpl instance,
) => <String, dynamic>{'chatRoom': instance.chatRoom, 'visit': instance.visit};

_$ChatRoomModelImpl _$$ChatRoomModelImplFromJson(Map<String, dynamic> json) =>
    _$ChatRoomModelImpl(
      qrId: json['qrId'] as String?,
      moduleType: json['moduleType'] as String?,
      moduleProfileId: json['moduleProfileId'] as String?,
      eventId: json['eventId'] as String?,
      scannerId: json['scannerId'] as String?,
      scannerType: json['scannerType'] as String?,
      ownerId: json['ownerId'] as String?,
      activeParticipantId: json['activeParticipantId'] as String?,
      activeParticipantType: json['activeParticipantType'] as String?,
      status: json['status'] as String?,
      id: json['_id'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$ChatRoomModelImplToJson(_$ChatRoomModelImpl instance) =>
    <String, dynamic>{
      'qrId': instance.qrId,
      'moduleType': instance.moduleType,
      'moduleProfileId': instance.moduleProfileId,
      'eventId': instance.eventId,
      'scannerId': instance.scannerId,
      'scannerType': instance.scannerType,
      'ownerId': instance.ownerId,
      'activeParticipantId': instance.activeParticipantId,
      'activeParticipantType': instance.activeParticipantType,
      'status': instance.status,
      '_id': instance.id,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

_$VisitModelImpl _$$VisitModelImplFromJson(Map<String, dynamic> json) =>
    _$VisitModelImpl(
      qrId: json['qrId'] as String?,
      houseId: json['houseId'] as String?,
      ownerId: json['ownerId'] as String?,
      scannerId: json['scannerId'] as String?,
      scannerType: json['scannerType'] as String?,
      purpose: json['purpose'] as String?,
      note: json['note'] as String?,
      status: json['status'] as String?,
      id: json['_id'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$VisitModelImplToJson(_$VisitModelImpl instance) =>
    <String, dynamic>{
      'qrId': instance.qrId,
      'houseId': instance.houseId,
      'ownerId': instance.ownerId,
      'scannerId': instance.scannerId,
      'scannerType': instance.scannerType,
      'purpose': instance.purpose,
      'note': instance.note,
      'status': instance.status,
      '_id': instance.id,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
