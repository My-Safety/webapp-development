import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mysafety_web/core/model/vehicle/sos_response_model/sos_response_model.dart';
import 'package:mysafety_web/core/network/network_status.dart';
import 'package:mysafety_web/src/features/vehicle/data/vehicle_remote_repo.dart';
import 'package:mysafety_web/util/assets/assets.dart';
import 'package:url_launcher/url_launcher.dart';

class VehicleState {
  const VehicleState();
}

final vehicleProvider = StateNotifierProvider<VehicleNotifier, VehicleState>(
  (ref) => VehicleNotifier(ref),
);

class VehicleNotifier extends StateNotifier<VehicleState> {
  VehicleNotifier(this.ref) : super(const VehicleState());
  final Ref ref;

  Future<bool> initiateAutoCall({
    required String qrId,
    String? audioCode,
  }) async {
    try {
      var result = await ref
          .read(vehicleRemoteRepoProvider)
          .initiateAutoCall(qrId: qrId, audioCode: audioCode);

      if (result.success == ActionStatus.success.code) {
        debugPrint('Auto call initiated successfully');
        return true;
      } else {
        debugPrint(' Auto call failed: ${result.message}');
        return false;
      }
    } catch (e) {
      debugPrint('Error initiating auto call: $e');
      return false;
    }
  }

  Future<void> makePhoneCall(String phoneNumber) async {
    final Uri uri = Uri(scheme: 'tel', path: phoneNumber);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }

  List<SosResponseModel> sosList = [
    SosResponseModel(
      title: 'Police (100)',
      number: '100',
      icon: Assets.police,
    ),
    SosResponseModel(
      title: 'Fire service(101)',
      number: '101',
      icon: Assets.fireService,
    ),
    SosResponseModel(title: 'Ambulance', number: '102', icon: Assets.ambulance),
  ];
}
