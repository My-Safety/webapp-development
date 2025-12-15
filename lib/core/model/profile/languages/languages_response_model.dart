// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Suresh M, 17/11/2025

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'languages_response_model.freezed.dart';
part 'languages_response_model.g.dart';

@freezed
class LanguagesResponseModel with _$LanguagesResponseModel {
  const factory LanguagesResponseModel({
    @JsonKey(name: '_id') String? id,
    String? name,
    String? code,
    bool? isActive,
    String? type,
  }) = _LanguagesResponseModel;

  factory LanguagesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LanguagesResponseModelFromJson(json);
}
