// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Suresh M, 11/11/2025

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:mysafety_web/util/utils.dart';

class FirebaseManager {
  static final FirebaseManager _instance = FirebaseManager._internal();

  factory FirebaseManager() => _instance;

  FirebaseManager._internal();

  String? get token => _token;

  String? _token;

  Future<void> intiNotification() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    await messaging.requestPermission();

    _token = await messaging.getToken();
    debugPrint('FirebaseToken: $_token');

    FirebaseMessaging.instance.getInitialMessage().then((message) {
      debugPrint('MessgeFromFCM initial $message');
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      debugPrint('MessgeFromFCM BG $message ');
    });

    FirebaseMessaging.onMessage.listen((message) {
      debugPrint('MessgeFromFCM FG $message');
    });

    // FirebaseMessaging.onBackgroundMessage(_handle);
  }

  Future<void> handle(RemoteMessage message) async {
    await Firebase.initializeApp();
  }
}
