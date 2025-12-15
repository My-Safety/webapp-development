// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Suresh M, 19/11/2025

import 'package:mysafety_web/util/assets/assets.dart';

enum BottomNavBarEnum {
  home(id: 0, iconPath: Assets.homeIcon),
  premium(id: 1, iconPath: Assets.diamondIcon),
  cart(id: 1, iconPath: Assets.cartIcon),
  profile(id: 1, iconPath: Assets.profileIcon);

  const BottomNavBarEnum({required this.id, required this.iconPath});

  final String iconPath;
  final int id;
}
