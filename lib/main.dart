import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mysafety_web/localization/l10n/l10n.dart';
import 'package:mysafety_web/route/navigation_service.dart';
import 'package:mysafety_web/route/routes.dart';
import 'package:mysafety_design_system/design_system/theme/theme.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
