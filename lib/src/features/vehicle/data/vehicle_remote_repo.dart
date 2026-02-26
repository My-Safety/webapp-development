import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mysafety_web/core/model/base/base_dynamic_response_model.dart';
import 'package:mysafety_web/core/network/endpoints/vehicle_endpoint.dart';
import 'package:mysafety_web/core/network/network.dart';
import 'package:mysafety_web/core/network/network_status.dart';
import 'package:mysafety_web/src/features/vehicle/data/vehicle_repo.dart';

class VehicleRemoteRepo implements VehicleRepo {
  @override
  Future<BaseDynamicResponse<dynamic>> initiateAutoCall({
    required String qrId,
     String? audioCode,
  }) async {
    try {
      final body = audioCode != null
          ? {'qrId': qrId, 'audioCode': audioCode}
          : {'qrId': qrId};
      
      var response = await NetworkClient.post(
        endPoint: VehicleEndpoint.autoCall,
        body: body,
      );

      if (response?.statusCode == NetworkStatus.status200.statusCode) {
        var body = json.decode(response!.body);
        return BaseDynamicResponse(
          data: body['data'],
          message: body['message'],
          statusCode: body['statusCode'],
          success: body['success'],
        );
      }
    } catch (e) {
      return BaseDynamicResponse.error();
    }
    return BaseDynamicResponse.error();
  }
}

final vehicleRemoteRepoProvider = Provider<VehicleRemoteRepo>(
  (ref) => VehicleRemoteRepo(),
);
