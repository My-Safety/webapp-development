// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.

import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_model.freezed.dart';
part 'address_model.g.dart';

@freezed
class AddressModel with _$AddressModel {
  const factory AddressModel({
    String? address,
    String? city,
    String? country,
    String? mapUrl,
    String? pincode,
    String? state,
    String? street,
  }) = _AddressModel;

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);
}
