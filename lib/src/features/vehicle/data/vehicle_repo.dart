import 'package:mysafety_web/core/model/base/base_dynamic_response_model.dart';

abstract class VehicleRepo {
  Future<BaseDynamicResponse<dynamic>> initiateAutoCall({
    required String qrId,
    required String audioCode,
  });
}
