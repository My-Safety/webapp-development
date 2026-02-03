// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Adwaith c, 16/12/2025

abstract class AgoraEndPoints {
  static const startCall = 'user/call/agora/start';
  static String joinCall(String callId) => 'user/call/agora/$callId/join';
  static String generateToken(String callId) => 'user/call/agora/$callId/token';
  static String endCall(String callId) => 'user/call/agora/$callId/end';
}