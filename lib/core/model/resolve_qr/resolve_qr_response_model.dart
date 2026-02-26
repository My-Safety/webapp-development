// To parse this JSON data, do
//
//     final resolveQrResponseModel = resolveQrResponseModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';

part 'resolve_qr_response_model.freezed.dart';
part 'resolve_qr_response_model.g.dart';

@freezed
class ResolveQrResponseModel with _$ResolveQrResponseModel {
  const factory ResolveQrResponseModel({
    Qr? qr,
    Doorbell? doorbell,
    Vehicle? vehicle,
    Smartcard? smartcard,
    LostFound? lostfound,
  }) = _ResolveQrResponseModel;

  factory ResolveQrResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ResolveQrResponseModelFromJson(json);
}

@freezed
class LostFound with _$LostFound {
  const factory LostFound({
    @JsonKey(name: '_id') String? id,
    String? userId,
    String? itemName,
    String? itemDescription,
    String? itemPhoto,
    String? category,
    String? contactPreference,
    String? status,
    List<dynamic>? memberIds,
    List<dynamic>? frozenMemberIds,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? qrId,
  }) = _LostFound;

  factory LostFound.fromJson(Map<String, dynamic> json) =>
      _$LostFoundFromJson(json);
}

@freezed
class Smartcard with _$Smartcard {
  const factory Smartcard({
    @JsonKey(name: '_id') String? id,
    String? userId,
    String? displayName,
    List<dynamic>? activeSocialLinks,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? qrId,
  }) = _Smartcard;

  factory Smartcard.fromJson(Map<String, dynamic> json) =>
      _$SmartcardFromJson(json);
}

@freezed
class Doorbell with _$Doorbell {
  const factory Doorbell({
    String? id,
    String? userId,
    String? houseName,
    String? houseNumber,
    String? apartment,
    String? fullAddressUrl,
    double? latitude,
    double? longitude,
    List<dynamic>? memberIds,
    List<dynamic>? frozenMemberIds,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? qrId,
  }) = _Doorbell;

  factory Doorbell.fromJson(Map<String, dynamic> json) =>
      _$DoorbellFromJson(json);
}

@freezed
class Vehicle with _$Vehicle {
  const factory Vehicle({
    @JsonKey(name: '_id') String? id,
    String? userId,
    String? vehicleNumber,
    String? vehicleType,
    String? brand,
    String? model,
    String? color,
    String? vehicleImage,
    String? ownerName,
    String? ownerNumber,
    String? issueDate,
    String? vehicleClass,
    String? fuel,
    String? unldWt,
    String? manufDate,
    String? wheelbase,
    String? seatCap,
    String? regAuthority,
    String? rcStatus,
    String? rcExpiry,
    UnderTheHood? underTheHood,
    Insurance? insurance,
    Puc? puc,
    bool? isManualEntry,
    List<dynamic>? emergencyContacts,
    List<dynamic>? challanDetails,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? qrId,
  }) = _Vehicle;

  factory Vehicle.fromJson(Map<String, dynamic> json) =>
      _$VehicleFromJson(json);
}

@freezed
class UnderTheHood with _$UnderTheHood {
  const factory UnderTheHood({
    String? engineNo,
    String? cylinder,
    String? cc,
    String? chassisNumber,
  }) = _UnderTheHood;

  factory UnderTheHood.fromJson(Map<String, dynamic> json) =>
      _$UnderTheHoodFromJson(json);
}

@freezed
class Insurance with _$Insurance {
  const factory Insurance({
    String? policyNo,
    String? validTill,
    String? companyName,
    String? status,
  }) = _Insurance;

  factory Insurance.fromJson(Map<String, dynamic> json) =>
      _$InsuranceFromJson(json);
}

@freezed
class Puc with _$Puc {
  const factory Puc({
    String? certificateNo,
    String? emmisionNorm,
    String? validTill,
    String? status,
  }) = _Puc;

  factory Puc.fromJson(Map<String, dynamic> json) => _$PucFromJson(json);
}

@freezed
class Qr with _$Qr {
  const factory Qr({
    String? id,
    String? qrId,
    String? qrType,
    String? status,
    OwnerId? ownerId,
    String? moduleType,
    String? moduleDoorbellId,
    DateTime? assignedAt,
    String? planAtActivation,
    bool? isTemporary,
    DateTime? expiresAt,
    bool? isFrozen,
    int? scanCount,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? lastScannedAt,
  }) = _Qr;

  factory Qr.fromJson(Map<String, dynamic> json) => _$QrFromJson(json);
}

@freezed
class OwnerId with _$OwnerId {
  const factory OwnerId({
    String? id,
    int? userId,
    String? name,
    String? phone,
    String? role,
    bool? emailVerified,
    dynamic avatarUrl,
    String? lang,
    bool? isActive,
    bool? isExisting,
    bool? twoFactorEnabled,
    List<dynamic>? twoFactorBackupCodes,
    DateTime? createdAt,
    DateTime? updatedAt,
    Address? address,
    String? email,
  }) = _OwnerId;

  factory OwnerId.fromJson(Map<String, dynamic> json) =>
      _$OwnerIdFromJson(json);
}

@freezed
class Address with _$Address {
  const factory Address({
    String? fulladdress,
    String? pincode,
    String? landmark,
    String? mapUrl,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}
