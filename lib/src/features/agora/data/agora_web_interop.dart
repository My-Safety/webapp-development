// Agora Web SDK JS Interop
import 'dart:js_interop';

@JS('AgoraRTC')
external AgoraRTC get agoraRTC;

@JS()
@staticInterop
class AgoraRTC {}

extension AgoraRTCExtension on AgoraRTC {
  external JSAny createClient(ClientConfig config);
  external JSPromise createMicrophoneAudioTrack();
  external JSPromise createCameraVideoTrack();
}

@JS()
@anonymous
@staticInterop
class ClientConfig {
  external factory ClientConfig({String mode, String codec});
}

@JS()
@staticInterop
class IAgoraRTCClient {}

extension IAgoraRTCClientExtension on IAgoraRTCClient {
  external JSPromise join(String appId, String channel, String token, JSAny uid);
  external JSPromise leave();
  external JSPromise publish(JSAny tracks);
  external JSPromise unpublish(JSAny tracks);
  external JSPromise subscribe(JSAny user, JSAny mediaType);
  external void on(String event, JSFunction callback);
}

@JS()
@staticInterop
class ILocalAudioTrack {}

extension ILocalAudioTrackExtension on ILocalAudioTrack {
  external void setEnabled(bool enabled);
  external JSPromise close();
}

@JS()
@staticInterop
class ILocalVideoTrack {}

extension ILocalVideoTrackExtension on ILocalVideoTrack {
  external void setEnabled(bool enabled);
  external bool get enabled;
  external JSPromise close();
  external JSPromise play(JSAny element);
  external void stop();
}

@JS()
@staticInterop
class IRemoteAudioTrack {}

extension IRemoteAudioTrackExtension on IRemoteAudioTrack {
  external void play();
  external void stop();
}

@JS()
@staticInterop
class IRemoteVideoTrack {}

extension IRemoteVideoTrackExtension on IRemoteVideoTrack {
  external JSPromise play(JSAny element);
  external void stop();
}

@JS()
@staticInterop
class IAgoraRTCRemoteUser {}

extension IAgoraRTCRemoteUserExtension on IAgoraRTCRemoteUser {
  external JSAny get uid;
  external IRemoteVideoTrack? get videoTrack;
  external IRemoteAudioTrack? get audioTrack;
}
