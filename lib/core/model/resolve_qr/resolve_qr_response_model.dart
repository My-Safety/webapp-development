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
        Profile? profile,
    }) = _ResolveQrResponseModel;
 
    factory ResolveQrResponseModel.fromJson(Map<String, dynamic> json) => _$ResolveQrResponseModelFromJson(json);
}
 
@freezed
class Profile with _$Profile {
    const factory Profile({
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
    }) = _Profile;
 
    factory Profile.fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);
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
        String? moduleProfileId,
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
 
    factory OwnerId.fromJson(Map<String, dynamic> json) => _$OwnerIdFromJson(json);
}
 
@freezed
class Address with _$Address {
    const factory Address({
        String? fulladdress,
        String? pincode,
        String? landmark,
        String? mapUrl,
    }) = _Address;
 
    factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);
}