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
  doorbell: json['doorbell'] == null
      ? null
      : Doorbell.fromJson(json['doorbell'] as Map<String, dynamic>),
  vehicle: json['vehicle'] == null
      ? null
      : Vehicle.fromJson(json['vehicle'] as Map<String, dynamic>),
  smartcard: json['smartcard'] == null
      ? null
      : Smartcard.fromJson(json['smartcard'] as Map<String, dynamic>),
  lostfound: json['lostfound'] == null
      ? null
      : LostFound.fromJson(json['lostfound'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$ResolveQrResponseModelImplToJson(
  _$ResolveQrResponseModelImpl instance,
) => <String, dynamic>{
  'qr': instance.qr,
  'doorbell': instance.doorbell,
  'vehicle': instance.vehicle,
  'smartcard': instance.smartcard,
  'lostfound': instance.lostfound,
};

_$LostFoundImpl _$$LostFoundImplFromJson(Map<String, dynamic> json) =>
    _$LostFoundImpl(
      id: json['_id'] as String?,
      userId: json['userId'] as String?,
      itemName: json['itemName'] as String?,
      itemDescription: json['itemDescription'] as String?,
      itemPhoto: json['itemPhoto'] as String?,
      category: json['category'] as String?,
      contactPreference: json['contactPreference'] as String?,
      status: json['status'] as String?,
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

Map<String, dynamic> _$$LostFoundImplToJson(_$LostFoundImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'userId': instance.userId,
      'itemName': instance.itemName,
      'itemDescription': instance.itemDescription,
      'itemPhoto': instance.itemPhoto,
      'category': instance.category,
      'contactPreference': instance.contactPreference,
      'status': instance.status,
      'memberIds': instance.memberIds,
      'frozenMemberIds': instance.frozenMemberIds,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'qrId': instance.qrId,
    };

_$SmartcardImpl _$$SmartcardImplFromJson(Map<String, dynamic> json) =>
    _$SmartcardImpl(
      id: json['_id'] as String?,
      userId: json['userId'] as String?,
      displayName: json['displayName'] as String?,
      activeSocialLinks: json['activeSocialLinks'] as List<dynamic>?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      qrId: json['qrId'] as String?,
    );

Map<String, dynamic> _$$SmartcardImplToJson(_$SmartcardImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'userId': instance.userId,
      'displayName': instance.displayName,
      'activeSocialLinks': instance.activeSocialLinks,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'qrId': instance.qrId,
    };

_$DoorbellImpl _$$DoorbellImplFromJson(Map<String, dynamic> json) =>
    _$DoorbellImpl(
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

Map<String, dynamic> _$$DoorbellImplToJson(_$DoorbellImpl instance) =>
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

_$VehicleImpl _$$VehicleImplFromJson(Map<String, dynamic> json) =>
    _$VehicleImpl(
      id: json['_id'] as String?,
      userId: json['userId'] as String?,
      vehicleNumber: json['vehicleNumber'] as String?,
      vehicleType: json['vehicleType'] as String?,
      brand: json['brand'] as String?,
      model: json['model'] as String?,
      color: json['color'] as String?,
      vehicleImage: json['vehicleImage'] as String?,
      ownerName: json['ownerName'] as String?,
      ownerNumber: json['ownerNumber'] as String?,
      issueDate: json['issueDate'] as String?,
      vehicleClass: json['vehicleClass'] as String?,
      fuel: json['fuel'] as String?,
      unldWt: json['unldWt'] as String?,
      manufDate: json['manufDate'] as String?,
      wheelbase: json['wheelbase'] as String?,
      seatCap: json['seatCap'] as String?,
      regAuthority: json['regAuthority'] as String?,
      rcStatus: json['rcStatus'] as String?,
      rcExpiry: json['rcExpiry'] as String?,
      underTheHood: json['underTheHood'] == null
          ? null
          : UnderTheHood.fromJson(json['underTheHood'] as Map<String, dynamic>),
      insurance: json['insurance'] == null
          ? null
          : Insurance.fromJson(json['insurance'] as Map<String, dynamic>),
      puc: json['puc'] == null
          ? null
          : Puc.fromJson(json['puc'] as Map<String, dynamic>),
      isManualEntry: json['isManualEntry'] as bool?,
      emergencyContacts: json['emergencyContacts'] as List<dynamic>?,
      challanDetails: json['challanDetails'] as List<dynamic>?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      qrId: json['qrId'] as String?,
    );

Map<String, dynamic> _$$VehicleImplToJson(_$VehicleImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'userId': instance.userId,
      'vehicleNumber': instance.vehicleNumber,
      'vehicleType': instance.vehicleType,
      'brand': instance.brand,
      'model': instance.model,
      'color': instance.color,
      'vehicleImage': instance.vehicleImage,
      'ownerName': instance.ownerName,
      'ownerNumber': instance.ownerNumber,
      'issueDate': instance.issueDate,
      'vehicleClass': instance.vehicleClass,
      'fuel': instance.fuel,
      'unldWt': instance.unldWt,
      'manufDate': instance.manufDate,
      'wheelbase': instance.wheelbase,
      'seatCap': instance.seatCap,
      'regAuthority': instance.regAuthority,
      'rcStatus': instance.rcStatus,
      'rcExpiry': instance.rcExpiry,
      'underTheHood': instance.underTheHood,
      'insurance': instance.insurance,
      'puc': instance.puc,
      'isManualEntry': instance.isManualEntry,
      'emergencyContacts': instance.emergencyContacts,
      'challanDetails': instance.challanDetails,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'qrId': instance.qrId,
    };

_$UnderTheHoodImpl _$$UnderTheHoodImplFromJson(Map<String, dynamic> json) =>
    _$UnderTheHoodImpl(
      engineNo: json['engineNo'] as String?,
      cylinder: json['cylinder'] as String?,
      cc: json['cc'] as String?,
      chassisNumber: json['chassisNumber'] as String?,
    );

Map<String, dynamic> _$$UnderTheHoodImplToJson(_$UnderTheHoodImpl instance) =>
    <String, dynamic>{
      'engineNo': instance.engineNo,
      'cylinder': instance.cylinder,
      'cc': instance.cc,
      'chassisNumber': instance.chassisNumber,
    };

_$InsuranceImpl _$$InsuranceImplFromJson(Map<String, dynamic> json) =>
    _$InsuranceImpl(
      policyNo: json['policyNo'] as String?,
      validTill: json['validTill'] as String?,
      companyName: json['companyName'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$InsuranceImplToJson(_$InsuranceImpl instance) =>
    <String, dynamic>{
      'policyNo': instance.policyNo,
      'validTill': instance.validTill,
      'companyName': instance.companyName,
      'status': instance.status,
    };

_$PucImpl _$$PucImplFromJson(Map<String, dynamic> json) => _$PucImpl(
  certificateNo: json['certificateNo'] as String?,
  emmisionNorm: json['emmisionNorm'] as String?,
  validTill: json['validTill'] as String?,
  status: json['status'] as String?,
);

Map<String, dynamic> _$$PucImplToJson(_$PucImpl instance) => <String, dynamic>{
  'certificateNo': instance.certificateNo,
  'emmisionNorm': instance.emmisionNorm,
  'validTill': instance.validTill,
  'status': instance.status,
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
  moduleDoorbellId: json['moduleDoorbellId'] as String?,
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
  'moduleDoorbellId': instance.moduleDoorbellId,
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
