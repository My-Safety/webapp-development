// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'avatar_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Avatar _$AvatarFromJson(Map<String, dynamic> json) {
  return _Avatar.fromJson(json);
}

/// @nodoc
mixin _$Avatar {
  // String? status,
  @JsonKey(name: "key")
  String? get key => throw _privateConstructorUsedError;
  @JsonKey(name: "url")
  String? get url => throw _privateConstructorUsedError;

  /// Serializes this Avatar to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Avatar
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AvatarCopyWith<Avatar> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AvatarCopyWith<$Res> {
  factory $AvatarCopyWith(Avatar value, $Res Function(Avatar) then) =
      _$AvatarCopyWithImpl<$Res, Avatar>;
  @useResult
  $Res call({
    @JsonKey(name: "key") String? key,
    @JsonKey(name: "url") String? url,
  });
}

/// @nodoc
class _$AvatarCopyWithImpl<$Res, $Val extends Avatar>
    implements $AvatarCopyWith<$Res> {
  _$AvatarCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Avatar
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? key = freezed, Object? url = freezed}) {
    return _then(
      _value.copyWith(
            key: freezed == key
                ? _value.key
                : key // ignore: cast_nullable_to_non_nullable
                      as String?,
            url: freezed == url
                ? _value.url
                : url // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AvatarImplCopyWith<$Res> implements $AvatarCopyWith<$Res> {
  factory _$$AvatarImplCopyWith(
    _$AvatarImpl value,
    $Res Function(_$AvatarImpl) then,
  ) = __$$AvatarImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "key") String? key,
    @JsonKey(name: "url") String? url,
  });
}

/// @nodoc
class __$$AvatarImplCopyWithImpl<$Res>
    extends _$AvatarCopyWithImpl<$Res, _$AvatarImpl>
    implements _$$AvatarImplCopyWith<$Res> {
  __$$AvatarImplCopyWithImpl(
    _$AvatarImpl _value,
    $Res Function(_$AvatarImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Avatar
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? key = freezed, Object? url = freezed}) {
    return _then(
      _$AvatarImpl(
        key: freezed == key
            ? _value.key
            : key // ignore: cast_nullable_to_non_nullable
                  as String?,
        url: freezed == url
            ? _value.url
            : url // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AvatarImpl implements _Avatar {
  const _$AvatarImpl({
    @JsonKey(name: "key") this.key,
    @JsonKey(name: "url") this.url,
  });

  factory _$AvatarImpl.fromJson(Map<String, dynamic> json) =>
      _$$AvatarImplFromJson(json);

  // String? status,
  @override
  @JsonKey(name: "key")
  final String? key;
  @override
  @JsonKey(name: "url")
  final String? url;

  @override
  String toString() {
    return 'Avatar(key: $key, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AvatarImpl &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, key, url);

  /// Create a copy of Avatar
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AvatarImplCopyWith<_$AvatarImpl> get copyWith =>
      __$$AvatarImplCopyWithImpl<_$AvatarImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AvatarImplToJson(this);
  }
}

abstract class _Avatar implements Avatar {
  const factory _Avatar({
    @JsonKey(name: "key") final String? key,
    @JsonKey(name: "url") final String? url,
  }) = _$AvatarImpl;

  factory _Avatar.fromJson(Map<String, dynamic> json) = _$AvatarImpl.fromJson;

  // String? status,
  @override
  @JsonKey(name: "key")
  String? get key;
  @override
  @JsonKey(name: "url")
  String? get url;

  /// Create a copy of Avatar
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AvatarImplCopyWith<_$AvatarImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
