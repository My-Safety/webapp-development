// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Suresh M, 11/11/2025

import 'package:intl/intl.dart';

abstract class DateFormats {
  static final yyyyMMddHHmmss = DateFormat('yyyy-MM-dd HH:mm:ss');
  static final ddMMyyyy = DateFormat('dd/MM/yyyy');
  static final yyyyMMdd = DateFormat('yyyy/MM/dd');
  static final yyyyMMDD = DateFormat('yyyy-MM-dd');
  static final dateTime = DateFormat('EEE, MMM d, h:mm a');
  static final time = DateFormat("HH:mm");
  static final time12A = DateFormat("hh:mm a");
  static final ddMMM = DateFormat("dd MMM");
  static final yyee = DateFormat("yyyy,EEE");

  /// EEE dd MMM -> Sat 23 Nov 2024
  static final eeeDDMMM = DateFormat("EEE dd MMM");

  /// dd MMM yyyy -> 17 Sep 2025
  static final ddMMMyyyy = DateFormat("dd MMM yyyy");

  /// EEE HH:mm:ss -> WED 13:12:06
  static final eeehhmmss = DateFormat("EEE HH:mm:ss");

  /// ✅ Safe time formatter for chat timestamps
  static String formatTime(dynamic createdAt) {
    if (createdAt == null) return '';

    try {
      if (createdAt is DateTime) {
        return time12A.format(createdAt.toLocal());
      }

      if (createdAt is String) {
        final dt = DateTime.parse(createdAt).toLocal();
        return time12A.format(dt);
      }
    } catch (_) {}

    return '';
  }
}
