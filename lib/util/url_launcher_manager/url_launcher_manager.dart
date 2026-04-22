// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Suresh M, 11/11/2025

import 'package:url_launcher/url_launcher.dart';

abstract class UrlLauncherManager {
  static Future<bool> call({String? phone}) async {
    final Uri launchUri = Uri(scheme: 'tel', path: phone);
    return await launchUrl(launchUri);
  }

  static Future<bool> launchWhatsApp(String phone) async {
    final Uri launchUri = Uri.parse('https://wa.me/$phone');
    return await launchUrl(launchUri, mode: LaunchMode.externalApplication);
  }

  static Future<bool> launchURL(String url) async {
    final Uri launchUri = Uri.parse(url);
    return await launchUrl(launchUri, mode: LaunchMode.externalApplication);
  }
}
