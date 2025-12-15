// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'languages_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

LanguagesResponseModel _$LanguagesResponseModelFromJson(
  Map<String, dynamic> json,
) {
  return _LanguagesResponseModel.fromJson(json);
}

/// @nodoc
mixin _$LanguagesResponseModel {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  bool? get isActive => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;

  /// Serializes this LanguagesResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LanguagesResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LanguagesResponseModelCopyWith<LanguagesResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LanguagesResponseModelCopyWith<$Res> {
  factory $LanguagesResponseModelCopyWith(
    LanguagesResponseModel value,
    $Res Function(LanguagesResponseModel) then,
  ) = _$LanguagesResponseModelCopyWithImpl<$Res, LanguagesResponseModel>;
  @useResult
  $Res call({
    @JsonKey(name: '_id') String? id,
    String? name,
    String? code,
    bool? isActive,
    String? type,
  });
}

/// @nodoc
class _$LanguagesResponseModelCopyWithImpl<
  $Res,
  $Val extends LanguagesResponseModel
>
    implements $LanguagesResponseModelCopyWith<$Res> {
  _$LanguagesResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LanguagesResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? code = freezed,
    Object? isActive = freezed,
    Object? type = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
            code: freezed == code
                ? _value.code
                : code // ignore: cast_nullable_to_non_nullable
                      as String?,
            isActive: freezed == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool?,
            type: freezed == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LanguagesResponseModelImplCopyWith<$Res>
    implements $LanguagesResponseModelCopyWith<$Res> {
  factory _$$LanguagesResponseModelImplCopyWith(
    _$LanguagesResponseModelImpl value,
    $Res Function(_$LanguagesResponseModelImpl) then,
  ) = __$$LanguagesResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: '_id') String? id,
    String? name,
    String? code,
    bool? isActive,
    String? type,
  });
}

/// @nodoc
class __$$LanguagesResponseModelImplCopyWithImpl<$Res>
    extends
        _$LanguagesResponseModelCopyWithImpl<$Res, _$LanguagesResponseModelImpl>
    implements _$$LanguagesResponseModelImplCopyWith<$Res> {
  __$$LanguagesResponseModelImplCopyWithImpl(
    _$LanguagesResponseModelImpl _value,
    $Res Function(_$LanguagesResponseModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LanguagesResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? code = freezed,
    Object? isActive = freezed,
    Object? type = freezed,
  }) {
    return _then(
      _$LanguagesResponseModelImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        code: freezed == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String?,
        isActive: freezed == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool?,
        type: freezed == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LanguagesResponseModelImpl implements _LanguagesResponseModel {
  const _$LanguagesResponseModelImpl({
    @JsonKey(name: '_id') this.id,
    this.name,
    this.code,
    this.isActive,
    this.type,
  });

  factory _$LanguagesResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LanguagesResponseModelImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? name;
  @override
  final String? code;
  @override
  final bool? isActive;
  @override
  final String? type;

  @override
  String toString() {
    return 'LanguagesResponseModel(id: $id, name: $name, code: $code, isActive: $isActive, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LanguagesResponseModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, code, isActive, type);

  /// Create a copy of LanguagesResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LanguagesResponseModelImplCopyWith<_$LanguagesResponseModelImpl>
  get copyWith =>
      __$$LanguagesResponseModelImplCopyWithImpl<_$LanguagesResponseModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$LanguagesResponseModelImplToJson(this);
  }
}

abstract class _LanguagesResponseModel implements LanguagesResponseModel {
  const factory _LanguagesResponseModel({
    @JsonKey(name: '_id') final String? id,
    final String? name,
    final String? code,
    final bool? isActive,
    final String? type,
  }) = _$LanguagesResponseModelImpl;

  factory _LanguagesResponseModel.fromJson(Map<String, dynamic> json) =
      _$LanguagesResponseModelImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  String? get name;
  @override
  String? get code;
  @override
  bool? get isActive;
  @override
  String? get type;

  /// Create a copy of LanguagesResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LanguagesResponseModelImplCopyWith<_$LanguagesResponseModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
