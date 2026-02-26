// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Adwaith c, 04/12/2025

import 'package:go_router/go_router.dart';
import 'package:mysafety_web/route/navigation_service.dart';
import 'package:mysafety_web/route/route_name.dart';
import 'package:mysafety_web/src/features/agora/presentation/screen/agora_audio_call_screen.dart';
import 'package:mysafety_web/src/features/agora/presentation/screen/agora_call_screen.dart';
import 'package:mysafety_web/src/features/auth/presentation/screen/login_screen.dart';
import 'package:mysafety_web/src/features/auth/presentation/screen/otp_screen.dart';
import 'package:mysafety_web/src/features/auth/presentation/screen/select_language_screen.dart';
import 'package:mysafety_web/src/features/auth/presentation/screen/select_option_screen.dart';
import 'package:mysafety_web/src/features/chat/presentation/screen/one_to_one_chat_screen.dart';
import 'package:mysafety_web/src/features/profile/presentation/screens/fetch_location.dart';
import 'package:mysafety_web/src/features/splash/presentation/screen/error_screen.dart';
import 'package:mysafety_web/src/features/splash/presentation/screen/splash_screen.dart';
import 'package:mysafety_web/src/features/vehicle/presentation/screens/report_accedent_screen.dart';

final GoRouter routerConfig = GoRouter(
  navigatorKey: NavigationService.navigatorKey,
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashScreen()),

    GoRoute(path: RouteName.error, builder: (context, state) => ErrorScreen()),

    GoRoute(path: RouteName.login, builder: (context, state) => LoginScreen()),

    GoRoute(path: RouteName.otp, builder: (context, state) => OtpScreen()),
    GoRoute(
      path: RouteName.fetchLocation,
      builder: (context, state) => FetchLocation(),
    ),
    GoRoute(
      path: RouteName.oneToOneChatScreen,
      builder: (context, state) {
        final roomId = state.uri.queryParameters['roomId'];
        final qrId = state.uri.queryParameters['qrId'];
        final visitorName = state.uri.queryParameters['visitorName'];
        final profileType = state.uri.queryParameters['profileType'];
        return OneToOneChatScreen(
          roomId: roomId,
          qrId: qrId,
          visitorName: visitorName,
          profileType: profileType,
        );
      },
    ),
    GoRoute(
      path: RouteName.selectLanguageScreen,
      builder: (context, state) => SelectLanguageScreen(),
    ),
    GoRoute(
      path: RouteName.reportAccedent,
      builder: (context, state) {
        final qrId = state.uri.queryParameters['qrId'];
        return ReportAccedentScreen(qrId: qrId);
      },
    ),
    GoRoute(
      path: RouteName.selectOptionScreen,
      builder: (context, state) {
        final roomId = state.uri.queryParameters['roomId'];
        final qrId = state.uri.queryParameters['qrId'];
        final visitorId = state.uri.queryParameters['visitorId'];
        return SelectOptionScreen(
          roomId: roomId,
          qrId: qrId,
          visitorId: visitorId,
        );
      },
    ),
    GoRoute(
      path: RouteName.agoraVideoCall,
      builder: (context, state) {
        final qrId = state.uri.queryParameters['qrId'];
        final role = state.uri.queryParameters['role'] ?? 'visitor';
        final visitorId = state.uri.queryParameters['visitorId'];
        return AgoraCallScreen(
          bookingId: qrId,
          moduleType: 'DoorBell',
          callType: 'video',
          role: role,
          visitorId: visitorId ?? '',
        );
      },
    ),
    GoRoute(
      path: RouteName.agoraAudioCall,
      builder: (context, state) {
        final qrId = state.uri.queryParameters['qrId'];
        final callId = state.uri.queryParameters['callId'];
        final visitorId = state.uri.queryParameters['visitorId'];
        return AgoraAudioCallScreen(
          qrId: qrId,
          callId: callId,
          visitorId: visitorId,
        );
      },
    ),
  ],
);
