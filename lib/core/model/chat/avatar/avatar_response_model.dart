
import 'package:freezed_annotation/freezed_annotation.dart';

part 'avatar_response_model.freezed.dart';
part 'avatar_response_model.g.dart';
// ignore_for_file: invalid_annotation_target

@freezed
class Avatar with _$Avatar {
  const factory Avatar({
    // String? status,
    @JsonKey(name: "key") String? key,
    @JsonKey(name: "url") String? url,
  }) = _Avatar;

  factory Avatar.fromJson(Map<String, dynamic> json) => _$AvatarFromJson(json);
}
