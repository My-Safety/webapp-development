// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Suresh M, 11/11/2025

import 'dart:convert';

import 'package:encrypt/encrypt.dart';
import 'package:mysafety_web/util/encrypt/encrypt.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalStorage {
  static Future<void> setString({
    required String key,
    required String value,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, Encrypt.encrypt(value: value));
  }

  static Future<String?>? getString({required String key}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var encrypt = prefs.getString(key);

    try {
      if (encrypt != null && encrypt.isNotEmpty) {
        final encryptedBytes = base64.decode(encrypt);

        final encrypted = Encrypted(encryptedBytes);

        return Encrypt.decrypt(value: encrypted);
      }
    } on Exception {
      return null;
    }
    return null;
  }

  static Future<void> setBool({
    required String key,
    required bool value,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  static Future<bool?> getBool({required String key}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }

  static Future<void> clearAll() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  static Future<bool> clearKey(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.remove(key);
  }
}
