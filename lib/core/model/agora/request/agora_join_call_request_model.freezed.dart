// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'agora_join_call_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AgoraJoinCallRequestModel _$AgoraJoinCallRequestModelFromJson(
  Map<String, dynamic> json,
) {
  return _AgoraJoinCallRequestModel.fromJson(json);
}

/// @nodoc
mixin _$AgoraJoinCallRequestModel {
  String get role => throw _privateConstructorUsedError;

  /// Serializes this AgoraJoinCallRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AgoraJoinCallRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AgoraJoinCallRequestModelCopyWith<AgoraJoinCallRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AgoraJoinCallRequestModelCopyWith<$Res> {
  factory $AgoraJoinCallRequestModelCopyWith(
    AgoraJoinCallRequestModel value,
    $Res Function(AgoraJoinCallRequestModel) then,
  ) = _$AgoraJoinCallRequestModelCopyWithImpl<$Res, AgoraJoinCallRequestModel>;
  @useResult
  $Res call({String role});
}

/// @nodoc
class _$AgoraJoinCallRequestModelCopyWithImpl<
  $Res,
  $Val extends AgoraJoinCallRequestModel
>
    implements $AgoraJoinCallRequestModelCopyWith<$Res> {
  _$AgoraJoinCallRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AgoraJoinCallRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? role = null}) {
    return _then(
      _value.copyWith(
            role: null == role
                ? _value.role
                : role // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AgoraJoinCallRequestModelImplCopyWith<$Res>
    implements $AgoraJoinCallRequestModelCopyWith<$Res> {
  factory _$$AgoraJoinCallRequestModelImplCopyWith(
    _$AgoraJoinCallRequestModelImpl value,
    $Res Function(_$AgoraJoinCallRequestModelImpl) then,
  ) = __$$AgoraJoinCallRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String role});
}

/// @nodoc
class __$$AgoraJoinCallRequestModelImplCopyWithImpl<$Res>
    extends
        _$AgoraJoinCallRequestModelCopyWithImpl<
          $Res,
          _$AgoraJoinCallRequestModelImpl
        >
    implements _$$AgoraJoinCallRequestModelImplCopyWith<$Res> {
  __$$AgoraJoinCallRequestModelImplCopyWithImpl(
    _$AgoraJoinCallRequestModelImpl _value,
    $Res Function(_$AgoraJoinCallRequestModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AgoraJoinCallRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? role = null}) {
    return _then(
      _$AgoraJoinCallRequestModelImpl(
        role: null == role
            ? _value.role
            : role // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AgoraJoinCallRequestModelImpl implements _AgoraJoinCallRequestModel {
  const _$AgoraJoinCallRequestModelImpl({this.role = 'owner'});

  factory _$AgoraJoinCallRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AgoraJoinCallRequestModelImplFromJson(json);

  @override
  @JsonKey()
  final String role;

  @override
  String toString() {
    return 'AgoraJoinCallRequestModel(role: $role)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AgoraJoinCallRequestModelImpl &&
            (identical(other.role, role) || other.role == role));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, role);

  /// Create a copy of AgoraJoinCallRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AgoraJoinCallRequestModelImplCopyWith<_$AgoraJoinCallRequestModelImpl>
  get copyWith =>
      __$$AgoraJoinCallRequestModelImplCopyWithImpl<
        _$AgoraJoinCallRequestModelImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AgoraJoinCallRequestModelImplToJson(this);
  }
}

abstract class _AgoraJoinCallRequestModel implements AgoraJoinCallRequestModel {
  const factory _AgoraJoinCallRequestModel({final String role}) =
      _$AgoraJoinCallRequestModelImpl;

  factory _AgoraJoinCallRequestModel.fromJson(Map<String, dynamic> json) =
      _$AgoraJoinCallRequestModelImpl.fromJson;

  @override
  String get role;

  /// Create a copy of AgoraJoinCallRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AgoraJoinCallRequestModelImplCopyWith<_$AgoraJoinCallRequestModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
