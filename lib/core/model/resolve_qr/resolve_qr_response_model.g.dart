// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resolve_qr_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResolveQrResponseModelImpl _$$ResolveQrResponseModelImplFromJson(
  Map<String, dynamic> json,
) => _$ResolveQrResponseModelImpl(
  qr: json['qr'] == null
      ? null
      : Qr.fromJson(json['qr'] as Map<String, dynamic>),
  profile: json['profile'] == null
      ? null
      : Profile.fromJson(json['profile'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$ResolveQrResponseModelImplToJson(
  _$ResolveQrResponseModelImpl instance,
) => <String, dynamic>{'qr': instance.qr, 'profile': instance.profile};

_$ProfileImpl _$$ProfileImplFromJson(Map<String, dynamic> json) =>
    _$ProfileImpl(
      id: json['id'] as String?,
      userId: json['userId'] as String?,
      houseName: json['houseName'] as String?,
      houseNumber: json['houseNumber'] as String?,
      apartment: json['apartment'] as String?,
      fullAddressUrl: json['fullAddressUrl'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      memberIds: json['memberIds'] as List<dynamic>?,
      frozenMemberIds: json['frozenMemberIds'] as List<dynamic>?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      qrId: json['qrId'] as String?,
    );

Map<String, dynamic> _$$ProfileImplToJson(_$ProfileImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'houseName': instance.houseName,
      'houseNumber': instance.houseNumber,
      'apartment': instance.apartment,
      'fullAddressUrl': instance.fullAddressUrl,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'memberIds': instance.memberIds,
      'frozenMemberIds': instance.frozenMemberIds,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'qrId': instance.qrId,
    };

_$QrImpl _$$QrImplFromJson(Map<String, dynamic> json) => _$QrImpl(
  id: json['id'] as String?,
  qrId: json['qrId'] as String?,
  qrType: json['qrType'] as String?,
  status: json['status'] as String?,
  ownerId: json['ownerId'] == null
      ? null
      : OwnerId.fromJson(json['ownerId'] as Map<String, dynamic>),
  moduleType: json['moduleType'] as String?,
  moduleProfileId: json['moduleProfileId'] as String?,
  assignedAt: json['assignedAt'] == null
      ? null
      : DateTime.parse(json['assignedAt'] as String),
  planAtActivation: json['planAtActivation'] as String?,
  isTemporary: json['isTemporary'] as bool?,
  expiresAt: json['expiresAt'] == null
      ? null
      : DateTime.parse(json['expiresAt'] as String),
  isFrozen: json['isFrozen'] as bool?,
  scanCount: (json['scanCount'] as num?)?.toInt(),
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  lastScannedAt: json['lastScannedAt'] == null
      ? null
      : DateTime.parse(json['lastScannedAt'] as String),
);

Map<String, dynamic> _$$QrImplToJson(_$QrImpl instance) => <String, dynamic>{
  'id': instance.id,
  'qrId': instance.qrId,
  'qrType': instance.qrType,
  'status': instance.status,
  'ownerId': instance.ownerId,
  'moduleType': instance.moduleType,
  'moduleProfileId': instance.moduleProfileId,
  'assignedAt': instance.assignedAt?.toIso8601String(),
  'planAtActivation': instance.planAtActivation,
  'isTemporary': instance.isTemporary,
  'expiresAt': instance.expiresAt?.toIso8601String(),
  'isFrozen': instance.isFrozen,
  'scanCount': instance.scanCount,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
  'lastScannedAt': instance.lastScannedAt?.toIso8601String(),
};

_$OwnerIdImpl _$$OwnerIdImplFromJson(Map<String, dynamic> json) =>
    _$OwnerIdImpl(
      id: json['id'] as String?,
      userId: (json['userId'] as num?)?.toInt(),
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      role: json['role'] as String?,
      emailVerified: json['emailVerified'] as bool?,
      avatarUrl: json['avatarUrl'],
      lang: json['lang'] as String?,
      isActive: json['isActive'] as bool?,
      isExisting: json['isExisting'] as bool?,
      twoFactorEnabled: json['twoFactorEnabled'] as bool?,
      twoFactorBackupCodes: json['twoFactorBackupCodes'] as List<dynamic>?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      email: json['email'] as String?,
    );

Map<String, dynamic> _$$OwnerIdImplToJson(_$OwnerIdImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'name': instance.name,
      'phone': instance.phone,
      'role': instance.role,
      'emailVerified': instance.emailVerified,
      'avatarUrl': instance.avatarUrl,
      'lang': instance.lang,
      'isActive': instance.isActive,
      'isExisting': instance.isExisting,
      'twoFactorEnabled': instance.twoFactorEnabled,
      'twoFactorBackupCodes': instance.twoFactorBackupCodes,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'address': instance.address,
      'email': instance.email,
    };

_$AddressImpl _$$AddressImplFromJson(Map<String, dynamic> json) =>
    _$AddressImpl(
      fulladdress: json['fulladdress'] as String?,
      pincode: json['pincode'] as String?,
      landmark: json['landmark'] as String?,
      mapUrl: json['mapUrl'] as String?,
    );

Map<String, dynamic> _$$AddressImplToJson(_$AddressImpl instance) =>
    <String, dynamic>{
      'fulladdress': instance.fulladdress,
      'pincode': instance.pincode,
      'landmark': instance.landmark,
      'mapUrl': instance.mapUrl,
    };
