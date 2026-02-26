// To parse this JSON data, do
//
//     final sosResponseModel = sosResponseModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';

part 'sos_response_model.freezed.dart';
part 'sos_response_model.g.dart';



@freezed
class SosResponseModel with _$SosResponseModel {
    const factory SosResponseModel({
        String? title,
        String? number,
        String? icon,
    }) = _SosResponseModel;

    factory SosResponseModel.fromJson(Map<String, dynamic> json) => _$SosResponseModelFromJson(json);
}
