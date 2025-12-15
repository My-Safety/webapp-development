// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Suresh M, 11/11/2025

import 'package:encrypt/encrypt.dart';
import 'package:mysafety_web/app_config.dart';

abstract class Encrypt {
  static String encrypt({required String value}) {
    final key = Key.fromUtf8(encryptKey);
    final iv = IV.fromUtf8(encryptIV);
    final encrypter = Encrypter(AES(key));
    final encrypted = encrypter.encrypt(value, iv: iv);
    return encrypted.base64;
  }

  static String decrypt({required Encrypted value}) {
    final key = Key.fromUtf8(encryptKey);
    final iv = IV.fromUtf8(encryptIV);
    final encrypter = Encrypter(AES(key));
    return encrypter.decrypt(value, iv: iv);
  }
}
