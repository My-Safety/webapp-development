// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Adwaith c, 12/12/2025

abstract class AuthEndPoints {
  static const sendOtp = 'user/scan/visitor/register';
  static const verifyOtp = 'user/scan/visitor/verify';
}

// In your FileUploadEndpoint class
String getSearchSuggestions({required String query}) {
  return '/search/suggestions?query=${Uri.encodeComponent(query)}'; // Adjust path as per your backend
}
