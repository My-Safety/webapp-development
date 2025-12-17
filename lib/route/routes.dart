// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Adwaith c, 04/12/2025

import 'package:go_router/go_router.dart';
import 'package:mysafety_web/route/navigation_service.dart';
import 'package:mysafety_web/route/route_name.dart';
import 'package:mysafety_web/src/features/auth/presentation/screen/login_screen.dart';
import 'package:mysafety_web/src/features/auth/presentation/screen/otp_screen.dart';
import 'package:mysafety_web/src/features/auth/presentation/screen/select_language_screen.dart';
import 'package:mysafety_web/src/features/chat/presentation/screen/one_to_one_chat_screen.dart';
import 'package:mysafety_web/src/features/profile/presentation/screens/fetch_location.dart';
import 'package:mysafety_web/src/features/splash/presentation/screen/error_screen.dart';
import 'package:mysafety_web/src/features/splash/presentation/screen/splash_screen.dart';

final GoRouter routerConfig = GoRouter(
  navigatorKey: NavigationService.navigatorKey,
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashScreen()),

    GoRoute(path: RouteName.error, builder: (context, state) => ErrorScreen()),

    GoRoute(path: RouteName.login, builder: (context, state) => LoginScreen()),

    GoRoute(path: RouteName.otp, builder: (context, state) => OtpScreen()),
    GoRoute(path: RouteName.fetchLocation, builder: (context, state) => FetchLocation()),
    GoRoute(path: RouteName.oneToOneChatScreen, builder: (context, state) => OneToOneChatScreen()),
    GoRoute(
      path: RouteName.selectLanguageScreen,
      builder: (context, state) => SelectLanguageScreen(),
    ),
  ],
);
