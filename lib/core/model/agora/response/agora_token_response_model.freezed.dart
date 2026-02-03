// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'agora_token_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AgoraTokenResponseModel _$AgoraTokenResponseModelFromJson(
  Map<String, dynamic> json,
) {
  return _AgoraTokenResponseModel.fromJson(json);
}

/// @nodoc
mixin _$AgoraTokenResponseModel {
  String get agoraToken => throw _privateConstructorUsedError;
  String get appId => throw _privateConstructorUsedError;
  String get channelName => throw _privateConstructorUsedError;
  int get uid => throw _privateConstructorUsedError;
  String get expiresAt => throw _privateConstructorUsedError;

  /// Serializes this AgoraTokenResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AgoraTokenResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AgoraTokenResponseModelCopyWith<AgoraTokenResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AgoraTokenResponseModelCopyWith<$Res> {
  factory $AgoraTokenResponseModelCopyWith(
    AgoraTokenResponseModel value,
    $Res Function(AgoraTokenResponseModel) then,
  ) = _$AgoraTokenResponseModelCopyWithImpl<$Res, AgoraTokenResponseModel>;
  @useResult
  $Res call({
    String agoraToken,
    String appId,
    String channelName,
    int uid,
    String expiresAt,
  });
}

/// @nodoc
class _$AgoraTokenResponseModelCopyWithImpl<
  $Res,
  $Val extends AgoraTokenResponseModel
>
    implements $AgoraTokenResponseModelCopyWith<$Res> {
  _$AgoraTokenResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AgoraTokenResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? agoraToken = null,
    Object? appId = null,
    Object? channelName = null,
    Object? uid = null,
    Object? expiresAt = null,
  }) {
    return _then(
      _value.copyWith(
            agoraToken: null == agoraToken
                ? _value.agoraToken
                : agoraToken // ignore: cast_nullable_to_non_nullable
                      as String,
            appId: null == appId
                ? _value.appId
                : appId // ignore: cast_nullable_to_non_nullable
                      as String,
            channelName: null == channelName
                ? _value.channelName
                : channelName // ignore: cast_nullable_to_non_nullable
                      as String,
            uid: null == uid
                ? _value.uid
                : uid // ignore: cast_nullable_to_non_nullable
                      as int,
            expiresAt: null == expiresAt
                ? _value.expiresAt
                : expiresAt // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AgoraTokenResponseModelImplCopyWith<$Res>
    implements $AgoraTokenResponseModelCopyWith<$Res> {
  factory _$$AgoraTokenResponseModelImplCopyWith(
    _$AgoraTokenResponseModelImpl value,
    $Res Function(_$AgoraTokenResponseModelImpl) then,
  ) = __$$AgoraTokenResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String agoraToken,
    String appId,
    String channelName,
    int uid,
    String expiresAt,
  });
}

/// @nodoc
class __$$AgoraTokenResponseModelImplCopyWithImpl<$Res>
    extends
        _$AgoraTokenResponseModelCopyWithImpl<
          $Res,
          _$AgoraTokenResponseModelImpl
        >
    implements _$$AgoraTokenResponseModelImplCopyWith<$Res> {
  __$$AgoraTokenResponseModelImplCopyWithImpl(
    _$AgoraTokenResponseModelImpl _value,
    $Res Function(_$AgoraTokenResponseModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AgoraTokenResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? agoraToken = null,
    Object? appId = null,
    Object? channelName = null,
    Object? uid = null,
    Object? expiresAt = null,
  }) {
    return _then(
      _$AgoraTokenResponseModelImpl(
        agoraToken: null == agoraToken
            ? _value.agoraToken
            : agoraToken // ignore: cast_nullable_to_non_nullable
                  as String,
        appId: null == appId
            ? _value.appId
            : appId // ignore: cast_nullable_to_non_nullable
                  as String,
        channelName: null == channelName
            ? _value.channelName
            : channelName // ignore: cast_nullable_to_non_nullable
                  as String,
        uid: null == uid
            ? _value.uid
            : uid // ignore: cast_nullable_to_non_nullable
                  as int,
        expiresAt: null == expiresAt
            ? _value.expiresAt
            : expiresAt // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AgoraTokenResponseModelImpl implements _AgoraTokenResponseModel {
  const _$AgoraTokenResponseModelImpl({
    required this.agoraToken,
    required this.appId,
    required this.channelName,
    required this.uid,
    required this.expiresAt,
  });

  factory _$AgoraTokenResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AgoraTokenResponseModelImplFromJson(json);

  @override
  final String agoraToken;
  @override
  final String appId;
  @override
  final String channelName;
  @override
  final int uid;
  @override
  final String expiresAt;

  @override
  String toString() {
    return 'AgoraTokenResponseModel(agoraToken: $agoraToken, appId: $appId, channelName: $channelName, uid: $uid, expiresAt: $expiresAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AgoraTokenResponseModelImpl &&
            (identical(other.agoraToken, agoraToken) ||
                other.agoraToken == agoraToken) &&
            (identical(other.appId, appId) || other.appId == appId) &&
            (identical(other.channelName, channelName) ||
                other.channelName == channelName) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, agoraToken, appId, channelName, uid, expiresAt);

  /// Create a copy of AgoraTokenResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AgoraTokenResponseModelImplCopyWith<_$AgoraTokenResponseModelImpl>
  get copyWith =>
      __$$AgoraTokenResponseModelImplCopyWithImpl<
        _$AgoraTokenResponseModelImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AgoraTokenResponseModelImplToJson(this);
  }
}

abstract class _AgoraTokenResponseModel implements AgoraTokenResponseModel {
  const factory _AgoraTokenResponseModel({
    required final String agoraToken,
    required final String appId,
    required final String channelName,
    required final int uid,
    required final String expiresAt,
  }) = _$AgoraTokenResponseModelImpl;

  factory _AgoraTokenResponseModel.fromJson(Map<String, dynamic> json) =
      _$AgoraTokenResponseModelImpl.fromJson;

  @override
  String get agoraToken;
  @override
  String get appId;
  @override
  String get channelName;
  @override
  int get uid;
  @override
  String get expiresAt;

  /// Create a copy of AgoraTokenResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AgoraTokenResponseModelImplCopyWith<_$AgoraTokenResponseModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
