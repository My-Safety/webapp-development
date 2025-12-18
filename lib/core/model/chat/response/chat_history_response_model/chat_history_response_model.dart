// To parse this JSON data, do
//
//     final chatHistoryResponseModel = chatHistoryResponseModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_history_response_model.freezed.dart';
part 'chat_history_response_model.g.dart';

@freezed
class ChatHistoryResponseModel with _$ChatHistoryResponseModel {
  const factory ChatHistoryResponseModel({
    String? id,
    String? roomId,
    String? senderId,
    String? senderType,
    String? mediaUrl,
      int? mediaDuration,
    String? messageType,
    String? content,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deliveredAt,
    SenderDetails? senderDetails,
  }) = _ChatHistoryResponseModel;

  factory ChatHistoryResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ChatHistoryResponseModelFromJson(json);
}

@freezed
class SenderDetails with _$SenderDetails {
  const factory SenderDetails({String? name, String? photo}) = _SenderDetails;

  factory SenderDetails.fromJson(Map<String, dynamic> json) =>
      _$SenderDetailsFromJson(json);
}
