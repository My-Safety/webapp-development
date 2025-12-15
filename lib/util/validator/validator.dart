// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Suresh M, 11/11/2025

import 'package:flutter/material.dart';
import 'package:mysafety_web/util/extension/extension.dart';
import 'package:mysafety_web/util/formator/date_formator.dart';
import 'package:mysafety_web/util/regx/regx.dart';

abstract class Validator {
  static String? requiredValidator({
    required BuildContext context,
    String? value,
    required String errorMessage,
  }) {
    if (value == null || value.trim().isEmpty) {
      return errorMessage;
    }
    return null;
  }

  static String? dobValidator({
    required BuildContext context,
    required String? value,
  }) {
    if (value?.isEmpty ?? true) {
      return context.loc.please_enter_dob;
    }
    var d = value;
    if (d?.split('/').last.length != 4) {
      return context.loc.invalid_date_format_use_DD_MM_YYYY;
    }

    try {
      DateTime dob = DateFormats.ddMMyyyy.parseStrict(value ?? "");
      DateTime today = DateTime.now();
      int age = today.year - dob.year;
      if (today.month < dob.month ||
          (today.month == dob.month && today.day < dob.day)) {
        age--;
      }

      if (age < 18) {
        return context.loc.age_should_be_18_or_above;
      }
    } catch (e) {
      return context.loc.invalid_date_format_use_DD_MM_YYYY;
    }

    return null;
  }

  static String? nameValidator({
    required BuildContext context,
    required String? value,
    String? errorMessage,
  }) {
    if (value?.isEmpty ?? true) {
      return errorMessage ?? context.loc.please_enter_your_name;
    }

    return null;
  }

  static String? phoneNovalidator({
    required BuildContext context,
    required String? value,
    required int minLength,
  }) {
    if (value?.isEmpty ?? true) {
      return context.loc.please_enter_phone_number;
    }
    if (value!.length < minLength) {
      return context.loc.phone_number_not_valid;
    }
    return null;
  }

  static String? emailValidator({
    required BuildContext context,
    required String? value,
  }) {
    if (value?.isEmpty ?? true) {
      return context.loc.please_enter_email;
    }

    if (!RegularExpression.email.hasMatch(value ?? '')) {
      return context.loc.not_a_valid_email;
    }
    return null;
  }

  static String? empty({
    required BuildContext context,
    required String? value,
    String? errorMessage,
  }) {
    if (value?.isEmpty ?? true) {
      return errorMessage ?? context.loc.please_enter;
    }

    return null;
  }

  static String? password({
    required String pwd,
    required BuildContext context,
  }) {
    final errors = <String>[];

    if (pwd.length < 8) {
      errors.add(context.loc.minimum_eigth_characters);
    }
    if (!RegExp(r'[A-Z]').hasMatch(pwd)) {
      errors.add(context.loc.at_least_one_uppercase_letter);
    }
    if (!RegExp(r'[a-z]').hasMatch(pwd)) {
      errors.add(context.loc.at_least_one_lowercase_letter);
    }
    if (!RegExp(r'\d').hasMatch(pwd)) {
      errors.add(context.loc.at_least_one_digit);
    }
    if (!RegExp(
      r'[!@#\$%\^&\*\(\)\-_\+=\[\]\{\}\|;:\",<\.>\/\?`~]',
    ).hasMatch(pwd)) {
      errors.add(context.loc.at_least_one_special_character);
    }
    if (RegExp(r'\s').hasMatch(pwd)) {
      errors.add(context.loc.no_whitespace_allowed);
    }

    if (errors.isEmpty) return null;
    return errors.join('\n');
  }

  static String? confirmPasword({
    required BuildContext context,
    required String? password,
    required String? confirmPasword,
  }) {
    if (confirmPasword?.isEmpty ?? true) {
      return context.loc.minimum_eigth_characters;
    } else if (password != confirmPasword) {
      return context.loc.passwords_do_not_match;
    }

    return null;
  }
}
