// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sos_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SosResponseModel _$SosResponseModelFromJson(Map<String, dynamic> json) {
  return _SosResponseModel.fromJson(json);
}

/// @nodoc
mixin _$SosResponseModel {
  String? get title => throw _privateConstructorUsedError;
  String? get number => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SosResponseModelCopyWith<SosResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SosResponseModelCopyWith<$Res> {
  factory $SosResponseModelCopyWith(
          SosResponseModel value, $Res Function(SosResponseModel) then) =
      _$SosResponseModelCopyWithImpl<$Res, SosResponseModel>;
  @useResult
  $Res call({String? title, String? number, String? icon});
}

/// @nodoc
class _$SosResponseModelCopyWithImpl<$Res, $Val extends SosResponseModel>
    implements $SosResponseModelCopyWith<$Res> {
  _$SosResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? number = freezed,
    Object? icon = freezed,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SosResponseModelImplCopyWith<$Res>
    implements $SosResponseModelCopyWith<$Res> {
  factory _$$SosResponseModelImplCopyWith(_$SosResponseModelImpl value,
          $Res Function(_$SosResponseModelImpl) then) =
      __$$SosResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? title, String? number, String? icon});
}

/// @nodoc
class __$$SosResponseModelImplCopyWithImpl<$Res>
    extends _$SosResponseModelCopyWithImpl<$Res, _$SosResponseModelImpl>
    implements _$$SosResponseModelImplCopyWith<$Res> {
  __$$SosResponseModelImplCopyWithImpl(_$SosResponseModelImpl _value,
      $Res Function(_$SosResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? number = freezed,
    Object? icon = freezed,
  }) {
    return _then(_$SosResponseModelImpl(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SosResponseModelImpl implements _SosResponseModel {
  const _$SosResponseModelImpl({this.title, this.number, this.icon});

  factory _$SosResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SosResponseModelImplFromJson(json);

  @override
  final String? title;
  @override
  final String? number;
  @override
  final String? icon;

  @override
  String toString() {
    return 'SosResponseModel(title: $title, number: $number, icon: $icon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SosResponseModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, number, icon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SosResponseModelImplCopyWith<_$SosResponseModelImpl> get copyWith =>
      __$$SosResponseModelImplCopyWithImpl<_$SosResponseModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SosResponseModelImplToJson(
      this,
    );
  }
}

abstract class _SosResponseModel implements SosResponseModel {
  const factory _SosResponseModel(
      {final String? title,
      final String? number,
      final String? icon}) = _$SosResponseModelImpl;

  factory _SosResponseModel.fromJson(Map<String, dynamic> json) =
      _$SosResponseModelImpl.fromJson;

  @override
  String? get title;
  @override
  String? get number;
  @override
  String? get icon;
  @override
  @JsonKey(ignore: true)
  _$$SosResponseModelImplCopyWith<_$SosResponseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
