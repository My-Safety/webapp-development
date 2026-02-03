// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'agora_start_call_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AgoraStartCallRequestModel _$AgoraStartCallRequestModelFromJson(
  Map<String, dynamic> json,
) {
  return _AgoraStartCallRequestModel.fromJson(json);
}

/// @nodoc
mixin _$AgoraStartCallRequestModel {
  String? get qrId => throw _privateConstructorUsedError;
  String get callType => throw _privateConstructorUsedError;

  /// Serializes this AgoraStartCallRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AgoraStartCallRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AgoraStartCallRequestModelCopyWith<AgoraStartCallRequestModel>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AgoraStartCallRequestModelCopyWith<$Res> {
  factory $AgoraStartCallRequestModelCopyWith(
    AgoraStartCallRequestModel value,
    $Res Function(AgoraStartCallRequestModel) then,
  ) =
      _$AgoraStartCallRequestModelCopyWithImpl<
        $Res,
        AgoraStartCallRequestModel
      >;
  @useResult
  $Res call({String? qrId, String callType});
}

/// @nodoc
class _$AgoraStartCallRequestModelCopyWithImpl<
  $Res,
  $Val extends AgoraStartCallRequestModel
>
    implements $AgoraStartCallRequestModelCopyWith<$Res> {
  _$AgoraStartCallRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AgoraStartCallRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? qrId = freezed, Object? callType = null}) {
    return _then(
      _value.copyWith(
            qrId: freezed == qrId
                ? _value.qrId
                : qrId // ignore: cast_nullable_to_non_nullable
                      as String?,
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
abstract class _$$AgoraStartCallRequestModelImplCopyWith<$Res>
    implements $AgoraStartCallRequestModelCopyWith<$Res> {
  factory _$$AgoraStartCallRequestModelImplCopyWith(
    _$AgoraStartCallRequestModelImpl value,
    $Res Function(_$AgoraStartCallRequestModelImpl) then,
  ) = __$$AgoraStartCallRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? qrId, String callType});
}

/// @nodoc
class __$$AgoraStartCallRequestModelImplCopyWithImpl<$Res>
    extends
        _$AgoraStartCallRequestModelCopyWithImpl<
          $Res,
          _$AgoraStartCallRequestModelImpl
        >
    implements _$$AgoraStartCallRequestModelImplCopyWith<$Res> {
  __$$AgoraStartCallRequestModelImplCopyWithImpl(
    _$AgoraStartCallRequestModelImpl _value,
    $Res Function(_$AgoraStartCallRequestModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AgoraStartCallRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? qrId = freezed, Object? callType = null}) {
    return _then(
      _$AgoraStartCallRequestModelImpl(
        qrId: freezed == qrId
            ? _value.qrId
            : qrId // ignore: cast_nullable_to_non_nullable
                  as String?,
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
class _$AgoraStartCallRequestModelImpl implements _AgoraStartCallRequestModel {
  const _$AgoraStartCallRequestModelImpl({this.qrId, this.callType = 'video'});

  factory _$AgoraStartCallRequestModelImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$AgoraStartCallRequestModelImplFromJson(json);

  @override
  final String? qrId;
  @override
  @JsonKey()
  final String callType;

  @override
  String toString() {
    return 'AgoraStartCallRequestModel(qrId: $qrId, callType: $callType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AgoraStartCallRequestModelImpl &&
            (identical(other.qrId, qrId) || other.qrId == qrId) &&
            (identical(other.callType, callType) ||
                other.callType == callType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, qrId, callType);

  /// Create a copy of AgoraStartCallRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AgoraStartCallRequestModelImplCopyWith<_$AgoraStartCallRequestModelImpl>
  get copyWith =>
      __$$AgoraStartCallRequestModelImplCopyWithImpl<
        _$AgoraStartCallRequestModelImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AgoraStartCallRequestModelImplToJson(this);
  }
}

abstract class _AgoraStartCallRequestModel
    implements AgoraStartCallRequestModel {
  const factory _AgoraStartCallRequestModel({
    final String? qrId,
    final String callType,
  }) = _$AgoraStartCallRequestModelImpl;

  factory _AgoraStartCallRequestModel.fromJson(Map<String, dynamic> json) =
      _$AgoraStartCallRequestModelImpl.fromJson;

  @override
  String? get qrId;
  @override
  String get callType;

  /// Create a copy of AgoraStartCallRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AgoraStartCallRequestModelImplCopyWith<_$AgoraStartCallRequestModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
