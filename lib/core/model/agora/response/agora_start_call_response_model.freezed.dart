// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'agora_start_call_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AgoraStartCallResponseModel _$AgoraStartCallResponseModelFromJson(
  Map<String, dynamic> json,
) {
  return _AgoraStartCallResponseModel.fromJson(json);
}

/// @nodoc
mixin _$AgoraStartCallResponseModel {
  String get callId => throw _privateConstructorUsedError;
  String get channelName => throw _privateConstructorUsedError;
  String get endsAt => throw _privateConstructorUsedError;
  int get maxDurationSeconds => throw _privateConstructorUsedError;
  int get maxParticipants => throw _privateConstructorUsedError;
  String get callType => throw _privateConstructorUsedError;

  /// Serializes this AgoraStartCallResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AgoraStartCallResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AgoraStartCallResponseModelCopyWith<AgoraStartCallResponseModel>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AgoraStartCallResponseModelCopyWith<$Res> {
  factory $AgoraStartCallResponseModelCopyWith(
    AgoraStartCallResponseModel value,
    $Res Function(AgoraStartCallResponseModel) then,
  ) =
      _$AgoraStartCallResponseModelCopyWithImpl<
        $Res,
        AgoraStartCallResponseModel
      >;
  @useResult
  $Res call({
    String callId,
    String channelName,
    String endsAt,
    int maxDurationSeconds,
    int maxParticipants,
    String callType,
  });
}

/// @nodoc
class _$AgoraStartCallResponseModelCopyWithImpl<
  $Res,
  $Val extends AgoraStartCallResponseModel
>
    implements $AgoraStartCallResponseModelCopyWith<$Res> {
  _$AgoraStartCallResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AgoraStartCallResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? callId = null,
    Object? channelName = null,
    Object? endsAt = null,
    Object? maxDurationSeconds = null,
    Object? maxParticipants = null,
    Object? callType = null,
  }) {
    return _then(
      _value.copyWith(
            callId: null == callId
                ? _value.callId
                : callId // ignore: cast_nullable_to_non_nullable
                      as String,
            channelName: null == channelName
                ? _value.channelName
                : channelName // ignore: cast_nullable_to_non_nullable
                      as String,
            endsAt: null == endsAt
                ? _value.endsAt
                : endsAt // ignore: cast_nullable_to_non_nullable
                      as String,
            maxDurationSeconds: null == maxDurationSeconds
                ? _value.maxDurationSeconds
                : maxDurationSeconds // ignore: cast_nullable_to_non_nullable
                      as int,
            maxParticipants: null == maxParticipants
                ? _value.maxParticipants
                : maxParticipants // ignore: cast_nullable_to_non_nullable
                      as int,
            callType: null == callType
                ? _value.callType
                : callType // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AgoraStartCallResponseModelImplCopyWith<$Res>
    implements $AgoraStartCallResponseModelCopyWith<$Res> {
  factory _$$AgoraStartCallResponseModelImplCopyWith(
    _$AgoraStartCallResponseModelImpl value,
    $Res Function(_$AgoraStartCallResponseModelImpl) then,
  ) = __$$AgoraStartCallResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String callId,
    String channelName,
    String endsAt,
    int maxDurationSeconds,
    int maxParticipants,
    String callType,
  });
}

/// @nodoc
class __$$AgoraStartCallResponseModelImplCopyWithImpl<$Res>
    extends
        _$AgoraStartCallResponseModelCopyWithImpl<
          $Res,
          _$AgoraStartCallResponseModelImpl
        >
    implements _$$AgoraStartCallResponseModelImplCopyWith<$Res> {
  __$$AgoraStartCallResponseModelImplCopyWithImpl(
    _$AgoraStartCallResponseModelImpl _value,
    $Res Function(_$AgoraStartCallResponseModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AgoraStartCallResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? callId = null,
    Object? channelName = null,
    Object? endsAt = null,
    Object? maxDurationSeconds = null,
    Object? maxParticipants = null,
    Object? callType = null,
  }) {
    return _then(
      _$AgoraStartCallResponseModelImpl(
        callId: null == callId
            ? _value.callId
            : callId // ignore: cast_nullable_to_non_nullable
                  as String,
        channelName: null == channelName
            ? _value.channelName
            : channelName // ignore: cast_nullable_to_non_nullable
                  as String,
        endsAt: null == endsAt
            ? _value.endsAt
            : endsAt // ignore: cast_nullable_to_non_nullable
                  as String,
        maxDurationSeconds: null == maxDurationSeconds
            ? _value.maxDurationSeconds
            : maxDurationSeconds // ignore: cast_nullable_to_non_nullable
                  as int,
        maxParticipants: null == maxParticipants
            ? _value.maxParticipants
            : maxParticipants // ignore: cast_nullable_to_non_nullable
                  as int,
        callType: null == callType
            ? _value.callType
            : callType // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AgoraStartCallResponseModelImpl
    implements _AgoraStartCallResponseModel {
  const _$AgoraStartCallResponseModelImpl({
    required this.callId,
    required this.channelName,
    required this.endsAt,
    required this.maxDurationSeconds,
    required this.maxParticipants,
    this.callType = 'audio',
  });

  factory _$AgoraStartCallResponseModelImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$AgoraStartCallResponseModelImplFromJson(json);

  @override
  final String callId;
  @override
  final String channelName;
  @override
  final String endsAt;
  @override
  final int maxDurationSeconds;
  @override
  final int maxParticipants;
  @override
  @JsonKey()
  final String callType;

  @override
  String toString() {
    return 'AgoraStartCallResponseModel(callId: $callId, channelName: $channelName, endsAt: $endsAt, maxDurationSeconds: $maxDurationSeconds, maxParticipants: $maxParticipants, callType: $callType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AgoraStartCallResponseModelImpl &&
            (identical(other.callId, callId) || other.callId == callId) &&
            (identical(other.channelName, channelName) ||
                other.channelName == channelName) &&
            (identical(other.endsAt, endsAt) || other.endsAt == endsAt) &&
            (identical(other.maxDurationSeconds, maxDurationSeconds) ||
                other.maxDurationSeconds == maxDurationSeconds) &&
            (identical(other.maxParticipants, maxParticipants) ||
                other.maxParticipants == maxParticipants) &&
            (identical(other.callType, callType) ||
                other.callType == callType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    callId,
    channelName,
    endsAt,
    maxDurationSeconds,
    maxParticipants,
    callType,
  );

  /// Create a copy of AgoraStartCallResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AgoraStartCallResponseModelImplCopyWith<_$AgoraStartCallResponseModelImpl>
  get copyWith =>
      __$$AgoraStartCallResponseModelImplCopyWithImpl<
        _$AgoraStartCallResponseModelImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AgoraStartCallResponseModelImplToJson(this);
  }
}

abstract class _AgoraStartCallResponseModel
    implements AgoraStartCallResponseModel {
  const factory _AgoraStartCallResponseModel({
    required final String callId,
    required final String channelName,
    required final String endsAt,
    required final int maxDurationSeconds,
    required final int maxParticipants,
    final String callType,
  }) = _$AgoraStartCallResponseModelImpl;

  factory _AgoraStartCallResponseModel.fromJson(Map<String, dynamic> json) =
      _$AgoraStartCallResponseModelImpl.fromJson;

  @override
  String get callId;
  @override
  String get channelName;
  @override
  String get endsAt;
  @override
  int get maxDurationSeconds;
  @override
  int get maxParticipants;
  @override
  String get callType;

  /// Create a copy of AgoraStartCallResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AgoraStartCallResponseModelImplCopyWith<_$AgoraStartCallResponseModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
