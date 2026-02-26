// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Adwaith c, 16/12/2025

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mysafety_web/localization/l10n/l10n.dart';
import 'package:mysafety_web/route/navigation_service.dart';
import 'package:mysafety_web/route/routes.dart';
import 'package:mysafety_design_system/design_system/theme/theme.dart';
import 'package:mysafety_web/src/features/agora/presentation/service/call_listener_service.dart';
import 'package:mysafety_web/util/lifecycle/web_lifecycle_manager.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void main() {
    setUrlStrategy(PathUrlStrategy());

  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(callListenerProvider).startListening();
      WebLifecycleManager.instance.initialize();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'mysafety24x7',
      debugShowCheckedModeBanner: false,
      supportedLocales: S.supportedLocales,
      // locale: provider.locale,
      routerConfig: routerConfig,
      theme: BrandThemes.darkTheme,
      scaffoldMessengerKey: NavigationService.scaffoldMessengerKey,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
