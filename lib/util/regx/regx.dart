// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Suresh M, 11/11/2025

abstract class RegularExpression {
  static final email = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
  static final panNumber = RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]$');
  static final emailOrPhone = RegExp(r'(^\d{10}$)|(^[^@]+@[^@]+\.[^@]+$)');
  static final letterDigitsOnly = RegExp(r'[a-zA-Z0-9 ]');
  static RegExp getEmailOrPhone(int length) =>
      RegExp(r'(^\d{' + length.toString() + r'}$)|(^[^@]+@[^@]+\.[^@]+$)');
  static final amountOnly = RegExp(r'^\d+$');
  static final amount = RegExp(r'^\d+(\.\d{1,2})?$');
  static final address = RegExp(r'[a-zA-Z0-9 ,]');
  static final nameOnly = RegExp(r'^[a-zA-Z ]+$');
  static final phone = RegExp(r'^\+?\d+$');
}
