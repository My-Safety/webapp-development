// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Suresh M, 15/12/2025

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'qr_scan_response_model.freezed.dart';
part 'qr_scan_response_model.g.dart';

@freezed
class QrScanResponseModel with _$QrScanResponseModel {
  const factory QrScanResponseModel({
    ChatRoomModel? chatRoom,
    VisitModel? visit,
  }) = _QrScanResponseModel;

  factory QrScanResponseModel.fromJson(Map<String, dynamic> json) =>
      _$QrScanResponseModelFromJson(json);
}

@freezed
class ChatRoomModel with _$ChatRoomModel {
  const factory ChatRoomModel({
    String? qrId,
    String? moduleType,
    String? moduleProfileId,
    String? eventId,
    String? scannerId,
    String? scannerType,
    String? ownerId,
    String? activeParticipantId,
    String? activeParticipantType,
    String? status,

    @JsonKey(name: '_id') String? id,
    String? createdAt,
    String? updatedAt,
  }) = _ChatRoomModel;

  factory ChatRoomModel.fromJson(Map<String, dynamic> json) =>
      _$ChatRoomModelFromJson(json);
}

@freezed
class VisitModel with _$VisitModel {
  const factory VisitModel({
    String? qrId,
    String? houseId,
    String? ownerId,
    String? scannerId,
    String? scannerType,
    String? purpose,
    String? note,
    String? status,

    @JsonKey(name: '_id') String? id,
    String? createdAt,
    String? updatedAt,
  }) = _VisitModel;

  factory VisitModel.fromJson(Map<String, dynamic> json) =>
      _$VisitModelFromJson(json);
}
