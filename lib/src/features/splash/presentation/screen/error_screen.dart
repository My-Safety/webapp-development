// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Suresh M, 12/11/2025

import 'package:flutter/material.dart';
import 'package:mysafety_web/util/extension/extension.dart';
import 'package:mysafety_design_system/design_system/design_system.dart';

class ErrorScreen extends StatefulWidget {
  const ErrorScreen({super.key});

  @override
  State<ErrorScreen> createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BrandText.primary(
                  data: context.loc.oops_something_went_wrong,
                  fontSize: BrandFontSize.size26,
                  fontWeight: FontWeight.w500,
                ),
                BrandText.grey(data: context.loc.but_dont_worry),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
