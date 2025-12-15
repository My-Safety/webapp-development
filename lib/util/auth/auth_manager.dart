// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Adwaith c, 09/12/2025



import 'package:go_router/go_router.dart';
import 'package:mysafety_web/core/network/socket/web_socket.dart';
import 'package:mysafety_web/route/navigation_service.dart';
import 'package:mysafety_web/route/route_name.dart';
import 'package:mysafety_web/util/storage/local_storage.dart';
import 'package:mysafety_web/util/storage/local_storage_key.dart';

class AuthManager {
  static final AuthManager _instance = AuthManager._internal();

  factory AuthManager() => _instance;

  AuthManager._internal();

  String? _token;

  String? get token => _token;

  // String? _refreshToken;

  // String? get refreshToken => _refreshToken;

  Future<void> setToken(String? token) async {
    _token = token;

    /// caching token
    if (token != null) {
      await LocalStorage.setString(key: LocalStorageKey.token, value: token);
    }
  }

  Future<void> fetchToken() async {
    var localToken = await LocalStorage.getString(key: LocalStorageKey.token);

    await setToken(localToken);
  }

  // Future<void> setRefreshToken(String? refreshToken) async {
  //   _refreshToken = refreshToken;

  //   /// caching token
  //   if (refreshToken != null) {
  //     await LocalStorage.setString(
  //       key: LocalStorageKey.refreshToken,
  //       value: refreshToken,
  //     );
  //   }
  // }

  // Future<void> fetchRefreshToken() async {
  //   var localToken = await LocalStorage.getString(
  //     key: LocalStorageKey.refreshToken,
  //   );

  //   await setRefreshToken(localToken);
  // }

  void handleTokenExpiry() {
    // call api and get new token

    LocalStorage.clearKey(LocalStorageKey.token);

    LocalStorage.clearKey(LocalStorageKey.userData);

    WebSocketService.disconnect();

    NavigationService.navigatorKey.currentContext?.go(
      RouteName.login,
      extra: {'from_invalid_token': true},
    );
  }

  void handleNotFound() {
    NavigationService.navigatorKey.currentContext?.push(RouteName.error);
  }

  // Future<bool> loginWithBiometric() async {
  //   final LocalAuthentication auth = LocalAuthentication();

  //   try {
  //     bool authenticated = await auth.authenticate(localizedReason: 'login');
  //     return authenticated;
  //   } on PlatformException {
  //     rethrow;
  //   }
  // }
}
