// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Adwaith c, 09/12/2025



import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mysafety_web/app_config.dart';
import 'package:mysafety_web/util/auth/auth_manager.dart';
import 'package:mysafety_web/core/network/network_status.dart';
import 'package:mysafety_web/route/navigation_service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:mysafety_web/util/enum/http_enum.dart';
import 'package:mysafety_web/util/utils.dart';

abstract class NetworkClient {
  static Future<http.Response?> get({
    required String endPoint,
    bool showError = true,
  }) async {
    var response = await http.get(
      Uri.parse('$appDomain$endPoint'),
      headers: {
        "content-type": "application/json",
        "Authorization": "Bearer ${AuthManager().token}",
      },
    );

    debugPrint(
      "Request:  $appDomain$endPoint \nResponse: ${response.body}\n\ntoken:  ${AuthManager().token}",
    );

    if (response.statusCode == NetworkStatus.status200.statusCode) {
      if (json.decode(response.body)['data'] is! List &&
          json.decode(response.body)['data'] != null) {
        try {
          AuthManager().setToken(
            json.decode(response.body)['data']['token'] ?? AuthManager().token,
          );

          // AuthManager().setRefreshToken(
          //   json.decode(response.body)['data']['refreshToken'] ??
          //       AuthManager().refreshToken,
          // );
        } catch (e) {
          return response;
        }
      }

      return response;
    } else if (response.statusCode == NetworkStatus.status400.statusCode) {
      if (showError) {
        try {
          NavigationService.showErrorSnackbar(
            message:
                json.decode(response.body)['message'] ??
                NetworkStatus.status400.message,
          );
        } catch (e) {
          rethrow;
        }
      }
    } else if (response.statusCode == NetworkStatus.status401.statusCode) {
      if (showError) {
        try {
          NavigationService.showErrorSnackbar(
            message:
                json.decode(response.body)['message'] ??
                NetworkStatus.status401.message,
          );
        } catch (e) {
          NavigationService.showSnackbar(NetworkStatus.status401.message);
          rethrow;
        }
      }
      AuthManager().handleTokenExpiry();
    } else if (response.statusCode == NetworkStatus.status403.statusCode) {
      if (showError) {
        try {
          NavigationService.showErrorSnackbar(
            message:
                json.decode(response.body)['message'] ??
                NetworkStatus.status403.message,
          );
        } catch (e) {
          NavigationService.showSnackbar(NetworkStatus.status401.message);
          rethrow;
        }
      }
      AuthManager().handleTokenExpiry();
    } else if (response.statusCode == NetworkStatus.status404.statusCode) {
      if (showError) {
        try {
          NavigationService.showErrorSnackbar(
            message:
                json.decode(response.body)['message'] ??
                NetworkStatus.status404.message,
          );
        } catch (e) {
          NavigationService.showSnackbar(NetworkStatus.status404.message);
          rethrow;
        }
      }
    } else if (response.statusCode == NetworkStatus.status429.statusCode) {
      if (showError) {
        try {
          NavigationService.showSnackbar(NetworkStatus.status429.message);
        } catch (e) {
          rethrow;
        }
      }
    } else if (response.statusCode == NetworkStatus.status500.statusCode) {
      if (showError) {
        try {
          NavigationService.showErrorSnackbar(
            message:
                json.decode(response.body)['message'] ??
                NetworkStatus.status500.message,
          );
        } catch (e) {
          rethrow;
        }
      } else {
        return null;
      }
    } else if (response.statusCode == NetworkStatus.status502.statusCode) {
      if (showError) {
        try {
          NavigationService.showErrorSnackbar(
            message:
                json.decode(response.body)['message'] ??
                NetworkStatus.status502.message,
          );
        } catch (e) {
          rethrow;
        }
      } else {
        return null;
      }
    }

    return null;
  }

  static Future<http.Response?> post({
    required String endPoint,
    dynamic body,
    bool showError = true,
  }) async {
    var response = await http.post(
      Uri.parse('$appDomain$endPoint'),
      body: json.encode(body),
      headers: {
        "content-type": "application/json",
        "Authorization": "Bearer ${AuthManager().token}",
      },
    );

    debugPrint(
      "Request:  $appDomain$endPoint ${json.encode(body)} \n\nResponse: ${response.body}\n\ntoken:  ${AuthManager().token}",
    );

    if (response.statusCode == NetworkStatus.status200.statusCode) {
      if (json.decode(response.body)['data'] is! List &&
          json.decode(response.body)['data'] != null) {
        try {
          AuthManager().setToken(
            json.decode(response.body)['data']['token'] ?? AuthManager().token,
          );

          // AuthManager().setRefreshToken(
          //   json.decode(response.body)['data']['refreshToken'] ??
          //       AuthManager().refreshToken,
          // );
        } catch (e) {
          rethrow;
        }
      }

      return response;
    } else if (response.statusCode == NetworkStatus.status201.statusCode) {
      if (json.decode(response.body)['data'] is! List &&
          json.decode(response.body)['data'] != null) {
        try {
          AuthManager().setToken(
            json.decode(response.body)['data']['token'] ?? AuthManager().token,
          );

          // AuthManager().setRefreshToken(
          //   json.decode(response.body)['data']['refreshToken'] ??
          //       AuthManager().refreshToken,
          // );
        } catch (e) {
          rethrow;
        }
      }

      return response;
    } else if (response.statusCode == NetworkStatus.status400.statusCode) {
      if (showError) {
        try {
          NavigationService.showErrorSnackbar(
            message:
                json.decode(response.body)['message'] ??
                NetworkStatus.status400.message,
          );
        } catch (e) {
          NavigationService.showErrorSnackbar(
            message: NetworkStatus.status400.message,
          );
          rethrow;
        }
      }
      return response;
    } else if (response.statusCode == NetworkStatus.status401.statusCode) {
      if (showError) {
        try {
          NavigationService.showErrorSnackbar(
            message:
                json.decode(response.body)['message'] ??
                NetworkStatus.status401.message,
          );
        } catch (e) {
          NavigationService.showSnackbar(NetworkStatus.status401.message);
          rethrow;
        }
      }
      AuthManager().handleTokenExpiry();
    } else if (response.statusCode == NetworkStatus.status403.statusCode) {
      if (showError) {
        try {
          NavigationService.showErrorSnackbar(
            message:
                json.decode(response.body)['message'] ??
                NetworkStatus.status403.message,
          );
        } catch (e) {
          NavigationService.showSnackbar(NetworkStatus.status403.message);
          rethrow;
        }
      }
      AuthManager().handleTokenExpiry();
    } else if (response.statusCode == NetworkStatus.status404.statusCode) {
      if (showError) {
        try {
          NavigationService.showErrorSnackbar(
            message:
                json.decode(response.body)['message'] ??
                NetworkStatus.status404.message,
          );
        } catch (e) {
          AuthManager().handleNotFound();
          NavigationService.showErrorSnackbar();
          rethrow;
        }
        AuthManager().handleNotFound();
      }
    } else if (response.statusCode == NetworkStatus.status409.statusCode) {
      if (showError) {
        try {
          NavigationService.showErrorSnackbar(
            message:
                json.decode(response.body)['message'] ??
                NetworkStatus.status409.message,
          );
        } catch (e) {
          NavigationService.showErrorSnackbar();
          rethrow;
        }
      }
    } else if (response.statusCode == NetworkStatus.status429.statusCode) {
      if (showError) {
        try {
          NavigationService.showSnackbar(NetworkStatus.status429.message);
        } catch (e) {
          rethrow;
        }
      }
    } else if (response.statusCode == NetworkStatus.status500.statusCode) {
      if (showError) {
        try {
          NavigationService.showErrorSnackbar(
            message:
                json.decode(response.body)['message'] ??
                NetworkStatus.status500.message,
          );
        } catch (e) {
          NavigationService.showSnackbar(NetworkStatus.status500.message);
          rethrow;
        }
      }
    } else if (response.statusCode == NetworkStatus.status503.statusCode) {
      if (showError) {
        try {
          NavigationService.showErrorSnackbar(
            message:
                json.decode(response.body)['message'] ??
                NetworkStatus.status503.message,
          );
        } catch (e) {
          NavigationService.showErrorSnackbar(
            message: NetworkStatus.status503.message,
          );
          rethrow;
        }
      }
    }

    return null;
  }

  static Future<http.Response?> patch({
    required String endPoint,
    dynamic body,
    bool showError = true,
  }) async {
    var response = await http.patch(
      Uri.parse('$appDomain$endPoint'),
      body: json.encode(body),
      headers: {
        "content-type": "application/json",
        "Authorization": "Bearer ${AuthManager().token}",
      },
    );

    debugPrint(
      "Request:  $appDomain$endPoint ${json.encode(body)} \n\nResponse: ${response.body}\n\ntoken:  ${AuthManager().token}",
    );

    if (response.statusCode == NetworkStatus.status200.statusCode) {
      try {
        if (json.decode(response.body)['data'] is! List &&
            json.decode(response.body)['data'] != null) {
          AuthManager().setToken(
            json.decode(response.body)['data']['token'] ?? AuthManager().token,
          );

          // AuthManager().setRefreshToken(
          //   json.decode(response.body)['data']['refreshToken'] ??
          //       AuthManager().refreshToken,
          // );
        }
      } catch (e) {
        rethrow;
      }
      return response;
    } else if (response.statusCode == NetworkStatus.status400.statusCode) {
      if (showError) {
        try {
          NavigationService.showErrorSnackbar(
            message:
                json.decode(response.body)['message'] ??
                NetworkStatus.status400.message,
          );
        } catch (e) {
          NavigationService.showErrorSnackbar(
            message: NetworkStatus.status400.message,
          );
          rethrow;
        }
      }
    } else if (response.statusCode == NetworkStatus.status401.statusCode) {
      if (showError) {
        try {
          NavigationService.showErrorSnackbar(
            message:
                json.decode(response.body)['message'] ??
                NetworkStatus.status401.message,
          );
        } catch (e) {
          NavigationService.showSnackbar(NetworkStatus.status401.message);
          rethrow;
        }
      }
      AuthManager().handleTokenExpiry();
    } else if (response.statusCode == NetworkStatus.status404.statusCode) {
      if (showError) {
        try {
          NavigationService.showErrorSnackbar(
            message:
                json.decode(response.body)['message'] ??
                NetworkStatus.status404.message,
          );
        } catch (e) {
          NavigationService.showErrorSnackbar();
          rethrow;
        }
      }
    } else if (response.statusCode == NetworkStatus.status429.statusCode) {
      if (showError) {
        try {
          NavigationService.showSnackbar(NetworkStatus.status429.message);
        } catch (e) {
          rethrow;
        }
      }
    } else if (response.statusCode == NetworkStatus.status500.statusCode) {
      if (showError) {
        try {
          NavigationService.showErrorSnackbar(
            message:
                json.decode(response.body)['message'] ??
                NetworkStatus.status500.message,
          );
        } catch (e) {
          NavigationService.showSnackbar(NetworkStatus.status500.message);
          rethrow;
        }
      }
    } else if (response.statusCode == NetworkStatus.status503.statusCode) {
      if (showError) {
        try {
          NavigationService.showErrorSnackbar(
            message:
                json.decode(response.body)['message'] ??
                NetworkStatus.status503.message,
          );
        } catch (e) {
          NavigationService.showErrorSnackbar(
            message: NetworkStatus.status503.message,
          );
          rethrow;
        }
      }
    }

    return null;
  }

  static Future<http.Response?> put({
    required String endPoint,
    dynamic body,
    bool showError = true,
  }) async {
    var response = await http.put(
      Uri.parse('$appDomain$endPoint'),
      body: json.encode(body),
      headers: {
        "content-type": "application/json",
        "Authorization": "Bearer ${AuthManager().token}",
      },
    );

    debugPrint(
      "Request:  $appDomain$endPoint ${json.encode(body)} \n\nResponse: ${response.body}\n\ntoken:  ${AuthManager().token}",
    );

    if (response.statusCode == NetworkStatus.status200.statusCode) {
      if (json.decode(response.body)['data'] is! List &&
          json.decode(response.body)['data'] != null) {
        try {
          AuthManager().setToken(
            json.decode(response.body)['data']['token'] ?? AuthManager().token,
          );

          // AuthManager().setRefreshToken(
          //   json.decode(response.body)['data']['refreshToken'] ??
          //       AuthManager().refreshToken,
          // );
        } catch (e) {
          rethrow;
        }
      }

      return response;
    } else if (response.statusCode == NetworkStatus.status201.statusCode) {
      if (json.decode(response.body)['data'] is! List &&
          json.decode(response.body)['data'] != null) {
        try {
          AuthManager().setToken(
            json.decode(response.body)['data']['token'] ?? AuthManager().token,
          );

          // AuthManager().setRefreshToken(
          //   json.decode(response.body)['data']['refreshToken'] ??
          //       AuthManager().refreshToken,
          // );
        } catch (e) {
          rethrow;
        }
      }

      return response;
    } else if (response.statusCode == NetworkStatus.status400.statusCode) {
      if (showError) {
        try {
          NavigationService.showErrorSnackbar(
            message:
                json.decode(response.body)['message'] ??
                NetworkStatus.status400.message,
          );
        } catch (e) {
          NavigationService.showErrorSnackbar(
            message: NetworkStatus.status400.message,
          );
          rethrow;
        }
      }
    } else if (response.statusCode == NetworkStatus.status401.statusCode) {
      if (showError) {
        try {
          NavigationService.showErrorSnackbar(
            message:
                json.decode(response.body)['message'] ??
                NetworkStatus.status401.message,
          );
        } catch (e) {
          NavigationService.showSnackbar(NetworkStatus.status401.message);
          rethrow;
        }
      }
      AuthManager().handleTokenExpiry();
    } else if (response.statusCode == NetworkStatus.status403.statusCode) {
      if (showError) {
        try {
          NavigationService.showErrorSnackbar(
            message:
                json.decode(response.body)['message'] ??
                NetworkStatus.status403.message,
          );
        } catch (e) {
          NavigationService.showSnackbar(NetworkStatus.status401.message);
          rethrow;
        }
      }
      AuthManager().handleTokenExpiry();
    } else if (response.statusCode == NetworkStatus.status404.statusCode) {
      if (showError) {
        try {
          NavigationService.showErrorSnackbar(
            message:
                json.decode(response.body)['message'] ??
                NetworkStatus.status404.message,
          );
        } catch (e) {
          AuthManager().handleNotFound();
          NavigationService.showErrorSnackbar();
          rethrow;
        }
      }
      AuthManager().handleNotFound();
    } else if (response.statusCode == NetworkStatus.status429.statusCode) {
      if (showError) {
        try {
          NavigationService.showSnackbar(NetworkStatus.status429.message);
        } catch (e) {
          rethrow;
        }
      }
    } else if (response.statusCode == NetworkStatus.status500.statusCode) {
      if (showError) {
        try {
          NavigationService.showErrorSnackbar(
            message:
                json.decode(response.body)['message'] ??
                NetworkStatus.status500.message,
          );
        } catch (e) {
          NavigationService.showSnackbar(NetworkStatus.status500.message);
          rethrow;
        }
      }
    } else if (response.statusCode == NetworkStatus.status503.statusCode) {
      if (showError) {
        try {
          NavigationService.showErrorSnackbar(
            message:
                json.decode(response.body)['message'] ??
                NetworkStatus.status503.message,
          );
        } catch (e) {
          NavigationService.showErrorSnackbar(
            message: NetworkStatus.status503.message,
          );
          rethrow;
        }
      }
    }

    return null;
  }

  static Future<http.Response?> multiPart({
    required HttpMethodEnum httpMethodEnum,
    required String endPoint,
    required List<PlatformFile> files,
    required List<String> documentKey,
    bool showError = true,
    Map<String, String>? body,
  }) async {
    assert(
      files.length == documentKey.length,
      'files.length should be equal to documentKey.length',
    );
    var request = http.MultipartRequest(
      httpMethodEnum.methodName,
      Uri.parse('$appDomain$endPoint'),
    );

    request.headers['Authorization'] = "Bearer ${AuthManager().token}";

    final mimeType = 'application/octet-stream';
    // lookupMimeType(files.path ?? '') ?? 'application/octet-stream';

    final typeParts = mimeType.split('/');

    if (body != null) {
      request.fields.addAll(body);
    }

    for (int i = 0; i < files.length; i++) {
      var bytes = await files[i].xFile.readAsBytes();

      request.files.add(
        http.MultipartFile.fromBytes(
          documentKey[i],
          bytes,
          filename: files[i].name,
          contentType: MediaType(typeParts[0], typeParts[1]),
        ),
      );
    }

    var response = await request.send();

    Map<String, dynamic> jsonResponse = json.decode(
      await response.stream.bytesToString(),
    );

    debugPrint(
      "Request:  $appDomain$endPoint $body \n\nResponse: $jsonResponse\n\ntoken:  ${AuthManager().token}",
    );

    if (response.statusCode == NetworkStatus.status200.statusCode) {
      try {
        AuthManager().setToken(
          jsonResponse['data']['token'] ?? AuthManager().token,
        );
        // AuthManager().setRefreshToken(
        //   jsonResponse['data']['refreshToken'] ?? AuthManager().refreshToken,
        // );
      } catch (e) {
        rethrow;
      }
      return http.Response(json.encode(jsonResponse), 200);
    } else if (response.statusCode == NetworkStatus.status400.statusCode) {
      if (showError) {
        try {
          NavigationService.showErrorSnackbar(
            message: jsonResponse['message'] ?? NetworkStatus.status400.message,
          );
        } catch (e) {
          NavigationService.showErrorSnackbar(
            message: NetworkStatus.status400.message,
          );
          rethrow;
        }
      }
    } else if (response.statusCode == NetworkStatus.status401.statusCode) {
      if (showError) {
        try {
          NavigationService.showErrorSnackbar(
            message: jsonResponse['message'] ?? NetworkStatus.status401.message,
          );
        } catch (e) {
          NavigationService.showSnackbar(NetworkStatus.status401.message);
          rethrow;
        }
      }
      AuthManager().handleTokenExpiry();
    } else if (response.statusCode == NetworkStatus.status404.statusCode) {
      if (showError) {
        try {
          NavigationService.showErrorSnackbar(
            message: jsonResponse['message'] ?? NetworkStatus.status404.message,
          );
        } catch (e) {
          NavigationService.showErrorSnackbar();
          rethrow;
        }
      }
    } else if (response.statusCode == NetworkStatus.status409.statusCode) {
      if (showError) {
        try {
          NavigationService.showErrorSnackbar(
            message: jsonResponse['message'] ?? NetworkStatus.status409.message,
          );
        } catch (e) {
          NavigationService.showErrorSnackbar();
          rethrow;
        }
      }
    } else if (response.statusCode == NetworkStatus.status429.statusCode) {
      if (showError) {
        try {
          NavigationService.showSnackbar(NetworkStatus.status429.message);
        } catch (e) {
          rethrow;
        }
      }
    } else if (response.statusCode == NetworkStatus.status500.statusCode) {
      if (showError) {
        try {
          NavigationService.showErrorSnackbar(
            message: jsonResponse['message'] ?? NetworkStatus.status500.message,
          );
        } catch (e) {
          NavigationService.showSnackbar(NetworkStatus.status500.message);
          rethrow;
        }
      }
    } else if (response.statusCode == NetworkStatus.status503.statusCode) {
      if (showError) {
        try {
          NavigationService.showErrorSnackbar(
            message: jsonResponse['message'] ?? NetworkStatus.status503.message,
          );
        } catch (e) {
          NavigationService.showErrorSnackbar(
            message: NetworkStatus.status503.message,
          );
          rethrow;
        }
      }
    }

    return null;
  }

  static Future<http.Response?> delete({
    required String endPoint,
    Map<String, dynamic>? body,
    bool showError = true,
  }) async {
    final uri = Uri.parse('$appDomain$endPoint');

    // Only include body if not null
    final requestBody = body != null ? json.encode(body) : null;

    var response = await http.delete(
      uri,
      body: requestBody,
      headers: {
        "content-type": "application/json",
        "Authorization": "Bearer ${AuthManager().token}",
      },
    );

    debugPrint(
      "Request: $appDomain$endPoint ${requestBody ?? ''}"
      "\n\nResponse: ${response.body}"
      "\n\ntoken: ${AuthManager().token}",
    );

    // ✅ Handle status codes in one place
    final statusCode = response.statusCode;

    if (statusCode == NetworkStatus.status200.statusCode ||
        statusCode == NetworkStatus.status201.statusCode) {
      final data = json.decode(response.body)['data'];

      if (data is Map<String, dynamic>) {
        try {
          AuthManager().setToken(data['token'] ?? AuthManager().token);
          // If refresh token needed:
          // AuthManager().setRefreshToken(data['refreshToken'] ?? AuthManager().refreshToken);
        } catch (e) {
          rethrow;
        }
      }

      return response;
    }

    // Handle errors
    String message;
    try {
      message = json.decode(response.body)['message'] ?? '';
    } catch (_) {
      message = '';
    }

    if (statusCode == NetworkStatus.status400.statusCode) {
      if (showError) {
        NavigationService.showErrorSnackbar(
          message: message.isNotEmpty
              ? message
              : NetworkStatus.status400.message,
        );
      }
    } else if (statusCode == NetworkStatus.status401.statusCode ||
        statusCode == NetworkStatus.status403.statusCode) {
      if (showError) {
        NavigationService.showErrorSnackbar(
          message: message.isNotEmpty
              ? message
              : NetworkStatus.status401.message,
        );
      }
      AuthManager().handleTokenExpiry();
    } else if (statusCode == NetworkStatus.status404.statusCode) {
      if (showError) {
        NavigationService.showErrorSnackbar(
          message: message.isNotEmpty
              ? message
              : NetworkStatus.status404.message,
        );
      }
      AuthManager().handleNotFound();
    } else if (statusCode == NetworkStatus.status429.statusCode) {
      if (showError) {
        NavigationService.showSnackbar(NetworkStatus.status429.message);
      }
    } else if (statusCode == NetworkStatus.status500.statusCode) {
      if (showError) {
        NavigationService.showErrorSnackbar(
          message: message.isNotEmpty
              ? message
              : NetworkStatus.status500.message,
        );
      }
    } else if (statusCode == NetworkStatus.status503.statusCode) {
      if (showError) {
        NavigationService.showErrorSnackbar(
          message: message.isNotEmpty
              ? message
              : NetworkStatus.status503.message,
        );
      }
    }

    return null;
  }
}
