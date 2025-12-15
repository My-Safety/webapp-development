// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Suresh M, 07/03/2025

import 'dart:developer';

import 'package:mysafety_web/app_config.dart';

void debugPrint(Object? value) {
  if (enableDebugPrint) {
    log(value.toString());
  }
}

String getTravelDuration(DateTime fromTime, DateTime toTime) {
  final duration = toTime.difference(fromTime);

  if (duration.inDays > 0) {
    final days = duration.inDays;
    final hours = duration.inHours % 24;
    final minutes = duration.inMinutes % 60;
    return '${days}d ${hours}h ${minutes}m';
  } else {
    final hours = duration.inHours;
    final minutes = duration.inMinutes % 60;
    return '${hours}h ${minutes}m';
  }
}
