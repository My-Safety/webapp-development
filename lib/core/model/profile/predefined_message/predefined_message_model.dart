// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'predefined_message_model.freezed.dart';
part 'predefined_message_model.g.dart';

@freezed
class PredefinedMessageModel with _$PredefinedMessageModel {
  const factory PredefinedMessageModel({
    @JsonKey(name: '_id') String? id,
    String? moduleType,
    String? title,
    String? message,
    bool? isDefault,
    String? audioId,
    String? createdAt,
  }) = _PredefinedMessageModel;

  factory PredefinedMessageModel.fromJson(Map<String, dynamic> json) =>
      _$PredefinedMessageModelFromJson(json);
}
