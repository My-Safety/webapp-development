// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
  id: json['_id'] as String?,
  name: json['name'] as String?,
  phone: json['mobile'] as String?,
  lang: json['lang'] as String?,
  token: json['token'] as String?,
  email: json['email'] as String?,
  userId: (json['userId'] as num?)?.toInt(),
  avatarUrl: json['avatarUrl'] as String?,
  isExisting: json['isExisting'] as bool?,
  role: json['role'] as String?,
  address: json['address'] == null
      ? null
      : Address.fromJson(json['address'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'mobile': instance.phone,
      'lang': instance.lang,
      'token': instance.token,
      'email': instance.email,
      'userId': instance.userId,
      'avatarUrl': instance.avatarUrl,
      'isExisting': instance.isExisting,
      'address': instance.address,
    };

_$AddressImpl _$$AddressImplFromJson(Map<String, dynamic> json) =>
    _$AddressImpl(
      fulladdress: json['fulladdress'] as String?,
      pincode: json['pincode'] as String?,
      mapUrl: json['mapUrl'] as String?,
      landmark: json['landmark'] as String?,
    );

Map<String, dynamic> _$$AddressImplToJson(_$AddressImpl instance) =>
    <String, dynamic>{
      'fulladdress': instance.fulladdress,
      'pincode': instance.pincode,
      'mapUrl': instance.mapUrl,
      'landmark': instance.landmark,
    };
