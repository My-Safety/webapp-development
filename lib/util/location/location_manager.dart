// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Suresh M, 11/11/2025

import 'package:geolocator/geolocator.dart';
import 'package:mysafety_web/route/navigation_service.dart';

abstract class LocationManager {
  static Future<Position?> getCurrentLocation() async {
    var permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        NavigationService.showErrorSnackbar(
          message: 'Location permissions are denied',
        );
      }
    }

    if (permission == LocationPermission.deniedForever) {
      NavigationService.showErrorSnackbar(
        message:
            'Location permissions are permanently denied, we cannot request permissions.',
      );
    }

    try {
      var currentLocation = await Geolocator.getCurrentPosition(
        locationSettings: LocationSettings(
          distanceFilter: 10,
          accuracy: LocationAccuracy.high,
        ),
      );

      return currentLocation;
    } catch (e) {
      return null;
    }
  }
}
