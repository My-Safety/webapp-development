// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'agora_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AgoraState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isCallActive => throw _privateConstructorUsedError;
  bool get isMuted => throw _privateConstructorUsedError;
  bool get isVideoEnabled => throw _privateConstructorUsedError;
  bool get isFrontCamera => throw _privateConstructorUsedError;
  bool get isRemoteUserJoined => throw _privateConstructorUsedError;
  bool get isWebSdkLoaded => throw _privateConstructorUsedError;
  bool get isSpeakerOn => throw _privateConstructorUsedError;
  bool get isCallInitiated => throw _privateConstructorUsedError;
  AgoraTokenResponseModel? get tokenData => throw _privateConstructorUsedError;
  AgoraStartCallResponseModel? get startCallData =>
      throw _privateConstructorUsedError;
  AgoraTokenResponseModel? get joinCallData =>
      throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  List<int> get remoteUsers => throw _privateConstructorUsedError;

  /// Create a copy of AgoraState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AgoraStateCopyWith<AgoraState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AgoraStateCopyWith<$Res> {
  factory $AgoraStateCopyWith(
    AgoraState value,
    $Res Function(AgoraState) then,
  ) = _$AgoraStateCopyWithImpl<$Res, AgoraState>;
  @useResult
  $Res call({
    bool isLoading,
    bool isCallActive,
    bool isMuted,
    bool isVideoEnabled,
    bool isFrontCamera,
    bool isRemoteUserJoined,
    bool isWebSdkLoaded,
    bool isSpeakerOn,
    bool isCallInitiated,
    AgoraTokenResponseModel? tokenData,
    AgoraStartCallResponseModel? startCallData,
    AgoraTokenResponseModel? joinCallData,
    String? error,
    List<int> remoteUsers,
  });

  $AgoraTokenResponseModelCopyWith<$Res>? get tokenData;
  $AgoraStartCallResponseModelCopyWith<$Res>? get startCallData;
  $AgoraTokenResponseModelCopyWith<$Res>? get joinCallData;
}

/// @nodoc
class _$AgoraStateCopyWithImpl<$Res, $Val extends AgoraState>
    implements $AgoraStateCopyWith<$Res> {
  _$AgoraStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AgoraState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isCallActive = null,
    Object? isMuted = null,
    Object? isVideoEnabled = null,
    Object? isFrontCamera = null,
    Object? isRemoteUserJoined = null,
    Object? isWebSdkLoaded = null,
    Object? isSpeakerOn = null,
    Object? isCallInitiated = null,
    Object? tokenData = freezed,
    Object? startCallData = freezed,
    Object? joinCallData = freezed,
    Object? error = freezed,
    Object? remoteUsers = null,
  }) {
    return _then(
      _value.copyWith(
            isLoading: null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
            isCallActive: null == isCallActive
                ? _value.isCallActive
                : isCallActive // ignore: cast_nullable_to_non_nullable
                      as bool,
            isMuted: null == isMuted
                ? _value.isMuted
                : isMuted // ignore: cast_nullable_to_non_nullable
                      as bool,
            isVideoEnabled: null == isVideoEnabled
                ? _value.isVideoEnabled
                : isVideoEnabled // ignore: cast_nullable_to_non_nullable
                      as bool,
            isFrontCamera: null == isFrontCamera
                ? _value.isFrontCamera
                : isFrontCamera // ignore: cast_nullable_to_non_nullable
                      as bool,
            isRemoteUserJoined: null == isRemoteUserJoined
                ? _value.isRemoteUserJoined
                : isRemoteUserJoined // ignore: cast_nullable_to_non_nullable
                      as bool,
            isWebSdkLoaded: null == isWebSdkLoaded
                ? _value.isWebSdkLoaded
                : isWebSdkLoaded // ignore: cast_nullable_to_non_nullable
                      as bool,
            isSpeakerOn: null == isSpeakerOn
                ? _value.isSpeakerOn
                : isSpeakerOn // ignore: cast_nullable_to_non_nullable
                      as bool,
            isCallInitiated: null == isCallInitiated
                ? _value.isCallInitiated
                : isCallInitiated // ignore: cast_nullable_to_non_nullable
                      as bool,
            tokenData: freezed == tokenData
                ? _value.tokenData
                : tokenData // ignore: cast_nullable_to_non_nullable
                      as AgoraTokenResponseModel?,
            startCallData: freezed == startCallData
                ? _value.startCallData
                : startCallData // ignore: cast_nullable_to_non_nullable
                      as AgoraStartCallResponseModel?,
            joinCallData: freezed == joinCallData
                ? _value.joinCallData
                : joinCallData // ignore: cast_nullable_to_non_nullable
                      as AgoraTokenResponseModel?,
            error: freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                      as String?,
            remoteUsers: null == remoteUsers
                ? _value.remoteUsers
                : remoteUsers // ignore: cast_nullable_to_non_nullable
                      as List<int>,
          )
          as $Val,
    );
  }

  /// Create a copy of AgoraState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AgoraTokenResponseModelCopyWith<$Res>? get tokenData {
    if (_value.tokenData == null) {
      return null;
    }

    return $AgoraTokenResponseModelCopyWith<$Res>(_value.tokenData!, (value) {
      return _then(_value.copyWith(tokenData: value) as $Val);
    });
  }

  /// Create a copy of AgoraState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AgoraStartCallResponseModelCopyWith<$Res>? get startCallData {
    if (_value.startCallData == null) {
      return null;
    }

    return $AgoraStartCallResponseModelCopyWith<$Res>(_value.startCallData!, (
      value,
    ) {
      return _then(_value.copyWith(startCallData: value) as $Val);
    });
  }

  /// Create a copy of AgoraState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AgoraTokenResponseModelCopyWith<$Res>? get joinCallData {
    if (_value.joinCallData == null) {
      return null;
    }

    return $AgoraTokenResponseModelCopyWith<$Res>(_value.joinCallData!, (
      value,
    ) {
      return _then(_value.copyWith(joinCallData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AgoraStateImplCopyWith<$Res>
    implements $AgoraStateCopyWith<$Res> {
  factory _$$AgoraStateImplCopyWith(
    _$AgoraStateImpl value,
    $Res Function(_$AgoraStateImpl) then,
  ) = __$$AgoraStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool isLoading,
    bool isCallActive,
    bool isMuted,
    bool isVideoEnabled,
    bool isFrontCamera,
    bool isRemoteUserJoined,
    bool isWebSdkLoaded,
    bool isSpeakerOn,
    bool isCallInitiated,
    AgoraTokenResponseModel? tokenData,
    AgoraStartCallResponseModel? startCallData,
    AgoraTokenResponseModel? joinCallData,
    String? error,
    List<int> remoteUsers,
  });

  @override
  $AgoraTokenResponseModelCopyWith<$Res>? get tokenData;
  @override
  $AgoraStartCallResponseModelCopyWith<$Res>? get startCallData;
  @override
  $AgoraTokenResponseModelCopyWith<$Res>? get joinCallData;
}

/// @nodoc
class __$$AgoraStateImplCopyWithImpl<$Res>
    extends _$AgoraStateCopyWithImpl<$Res, _$AgoraStateImpl>
    implements _$$AgoraStateImplCopyWith<$Res> {
  __$$AgoraStateImplCopyWithImpl(
    _$AgoraStateImpl _value,
    $Res Function(_$AgoraStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AgoraState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isCallActive = null,
    Object? isMuted = null,
    Object? isVideoEnabled = null,
    Object? isFrontCamera = null,
    Object? isRemoteUserJoined = null,
    Object? isWebSdkLoaded = null,
    Object? isSpeakerOn = null,
    Object? isCallInitiated = null,
    Object? tokenData = freezed,
    Object? startCallData = freezed,
    Object? joinCallData = freezed,
    Object? error = freezed,
    Object? remoteUsers = null,
  }) {
    return _then(
      _$AgoraStateImpl(
        isLoading: null == isLoading
            ? _value.isLoading
            : isLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
        isCallActive: null == isCallActive
            ? _value.isCallActive
            : isCallActive // ignore: cast_nullable_to_non_nullable
                  as bool,
        isMuted: null == isMuted
            ? _value.isMuted
            : isMuted // ignore: cast_nullable_to_non_nullable
                  as bool,
        isVideoEnabled: null == isVideoEnabled
            ? _value.isVideoEnabled
            : isVideoEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        isFrontCamera: null == isFrontCamera
            ? _value.isFrontCamera
            : isFrontCamera // ignore: cast_nullable_to_non_nullable
                  as bool,
        isRemoteUserJoined: null == isRemoteUserJoined
            ? _value.isRemoteUserJoined
            : isRemoteUserJoined // ignore: cast_nullable_to_non_nullable
                  as bool,
        isWebSdkLoaded: null == isWebSdkLoaded
            ? _value.isWebSdkLoaded
            : isWebSdkLoaded // ignore: cast_nullable_to_non_nullable
                  as bool,
        isSpeakerOn: null == isSpeakerOn
            ? _value.isSpeakerOn
            : isSpeakerOn // ignore: cast_nullable_to_non_nullable
                  as bool,
        isCallInitiated: null == isCallInitiated
            ? _value.isCallInitiated
            : isCallInitiated // ignore: cast_nullable_to_non_nullable
                  as bool,
        tokenData: freezed == tokenData
            ? _value.tokenData
            : tokenData // ignore: cast_nullable_to_non_nullable
                  as AgoraTokenResponseModel?,
        startCallData: freezed == startCallData
            ? _value.startCallData
            : startCallData // ignore: cast_nullable_to_non_nullable
                  as AgoraStartCallResponseModel?,
        joinCallData: freezed == joinCallData
            ? _value.joinCallData
            : joinCallData // ignore: cast_nullable_to_non_nullable
                  as AgoraTokenResponseModel?,
        error: freezed == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                  as String?,
        remoteUsers: null == remoteUsers
            ? _value._remoteUsers
            : remoteUsers // ignore: cast_nullable_to_non_nullable
                  as List<int>,
      ),
    );
  }
}

/// @nodoc

class _$AgoraStateImpl implements _AgoraState {
  const _$AgoraStateImpl({
    this.isLoading = false,
    this.isCallActive = false,
    this.isMuted = false,
    this.isVideoEnabled = false,
    this.isFrontCamera = false,
    this.isRemoteUserJoined = false,
    this.isWebSdkLoaded = false,
    this.isSpeakerOn = false,
    this.isCallInitiated = false,
    this.tokenData,
    this.startCallData,
    this.joinCallData,
    this.error,
    final List<int> remoteUsers = const [],
  }) : _remoteUsers = remoteUsers;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isCallActive;
  @override
  @JsonKey()
  final bool isMuted;
  @override
  @JsonKey()
  final bool isVideoEnabled;
  @override
  @JsonKey()
  final bool isFrontCamera;
  @override
  @JsonKey()
  final bool isRemoteUserJoined;
  @override
  @JsonKey()
  final bool isWebSdkLoaded;
  @override
  @JsonKey()
  final bool isSpeakerOn;
  @override
  @JsonKey()
  final bool isCallInitiated;
  @override
  final AgoraTokenResponseModel? tokenData;
  @override
  final AgoraStartCallResponseModel? startCallData;
  @override
  final AgoraTokenResponseModel? joinCallData;
  @override
  final String? error;
  final List<int> _remoteUsers;
  @override
  @JsonKey()
  List<int> get remoteUsers {
    if (_remoteUsers is EqualUnmodifiableListView) return _remoteUsers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_remoteUsers);
  }

  @override
  String toString() {
    return 'AgoraState(isLoading: $isLoading, isCallActive: $isCallActive, isMuted: $isMuted, isVideoEnabled: $isVideoEnabled, isFrontCamera: $isFrontCamera, isRemoteUserJoined: $isRemoteUserJoined, isWebSdkLoaded: $isWebSdkLoaded, isSpeakerOn: $isSpeakerOn, isCallInitiated: $isCallInitiated, tokenData: $tokenData, startCallData: $startCallData, joinCallData: $joinCallData, error: $error, remoteUsers: $remoteUsers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AgoraStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isCallActive, isCallActive) ||
                other.isCallActive == isCallActive) &&
            (identical(other.isMuted, isMuted) || other.isMuted == isMuted) &&
            (identical(other.isVideoEnabled, isVideoEnabled) ||
                other.isVideoEnabled == isVideoEnabled) &&
            (identical(other.isFrontCamera, isFrontCamera) ||
                other.isFrontCamera == isFrontCamera) &&
            (identical(other.isRemoteUserJoined, isRemoteUserJoined) ||
                other.isRemoteUserJoined == isRemoteUserJoined) &&
            (identical(other.isWebSdkLoaded, isWebSdkLoaded) ||
                other.isWebSdkLoaded == isWebSdkLoaded) &&
            (identical(other.isSpeakerOn, isSpeakerOn) ||
                other.isSpeakerOn == isSpeakerOn) &&
            (identical(other.isCallInitiated, isCallInitiated) ||
                other.isCallInitiated == isCallInitiated) &&
            (identical(other.tokenData, tokenData) ||
                other.tokenData == tokenData) &&
            (identical(other.startCallData, startCallData) ||
                other.startCallData == startCallData) &&
            (identical(other.joinCallData, joinCallData) ||
                other.joinCallData == joinCallData) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality().equals(
              other._remoteUsers,
              _remoteUsers,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    isLoading,
    isCallActive,
    isMuted,
    isVideoEnabled,
    isFrontCamera,
    isRemoteUserJoined,
    isWebSdkLoaded,
    isSpeakerOn,
    isCallInitiated,
    tokenData,
    startCallData,
    joinCallData,
    error,
    const DeepCollectionEquality().hash(_remoteUsers),
  );

  /// Create a copy of AgoraState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AgoraStateImplCopyWith<_$AgoraStateImpl> get copyWith =>
      __$$AgoraStateImplCopyWithImpl<_$AgoraStateImpl>(this, _$identity);
}

abstract class _AgoraState implements AgoraState {
  const factory _AgoraState({
    final bool isLoading,
    final bool isCallActive,
    final bool isMuted,
    final bool isVideoEnabled,
    final bool isFrontCamera,
    final bool isRemoteUserJoined,
    final bool isWebSdkLoaded,
    final bool isSpeakerOn,
    final bool isCallInitiated,
    final AgoraTokenResponseModel? tokenData,
    final AgoraStartCallResponseModel? startCallData,
    final AgoraTokenResponseModel? joinCallData,
    final String? error,
    final List<int> remoteUsers,
  }) = _$AgoraStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isCallActive;
  @override
  bool get isMuted;
  @override
  bool get isVideoEnabled;
  @override
  bool get isFrontCamera;
  @override
  bool get isRemoteUserJoined;
  @override
  bool get isWebSdkLoaded;
  @override
  bool get isSpeakerOn;
  @override
  bool get isCallInitiated;
  @override
  AgoraTokenResponseModel? get tokenData;
  @override
  AgoraStartCallResponseModel? get startCallData;
  @override
  AgoraTokenResponseModel? get joinCallData;
  @override
  String? get error;
  @override
  List<int> get remoteUsers;

  /// Create a copy of AgoraState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AgoraStateImplCopyWith<_$AgoraStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
