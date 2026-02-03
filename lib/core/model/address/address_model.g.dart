// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddressModelImpl _$$AddressModelImplFromJson(Map<String, dynamic> json) =>
    _$AddressModelImpl(
      address: json['address'] as String?,
      city: json['city'] as String?,
      country: json['country'] as String?,
      mapUrl: json['mapUrl'] as String?,
      pincode: json['pincode'] as String?,
      state: json['state'] as String?,
      street: json['street'] as String?,
    );

Map<String, dynamic> _$$AddressModelImplToJson(_$AddressModelImpl instance) =>
    <String, dynamic>{
      'address': instance.address,
      'city': instance.city,
      'country': instance.country,
      'mapUrl': instance.mapUrl,
      'pincode': instance.pincode,
      'state': instance.state,
      'street': instance.street,
    };
