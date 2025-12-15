// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Suresh M, 11/11/2025

enum LanguageEnum {
  english(id: 0, code: 'en', name: 'English', isActive: true, type: 'global');

  const LanguageEnum({
    required this.id,
    required this.name,
    required this.code,
    required this.type,
    required this.isActive,
  });

  final int id;
  final String name;
  final String code;
  final String type;
  final bool isActive;
}

enum LanguageTypeEnum { local, global }
