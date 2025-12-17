// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ChatState {
  bool get isError => throw _privateConstructorUsedError;
  Avatar? get uploadedFile => throw _privateConstructorUsedError;
  bool get isPremiumUser => throw _privateConstructorUsedError;
  bool get isFileUploading => throw _privateConstructorUsedError;
  String? get roomId => throw _privateConstructorUsedError;

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatStateCopyWith<ChatState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatStateCopyWith<$Res> {
  factory $ChatStateCopyWith(ChatState value, $Res Function(ChatState) then) =
      _$ChatStateCopyWithImpl<$Res, ChatState>;
  @useResult
  $Res call({
    bool isError,
    Avatar? uploadedFile,
    bool isPremiumUser,
    bool isFileUploading,
    String? roomId,
  });

  $AvatarCopyWith<$Res>? get uploadedFile;
}

/// @nodoc
class _$ChatStateCopyWithImpl<$Res, $Val extends ChatState>
    implements $ChatStateCopyWith<$Res> {
  _$ChatStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isError = null,
    Object? uploadedFile = freezed,
    Object? isPremiumUser = null,
    Object? isFileUploading = null,
    Object? roomId = freezed,
  }) {
    return _then(
      _value.copyWith(
            isError: null == isError
                ? _value.isError
                : isError // ignore: cast_nullable_to_non_nullable
                      as bool,
            uploadedFile: freezed == uploadedFile
                ? _value.uploadedFile
                : uploadedFile // ignore: cast_nullable_to_non_nullable
                      as Avatar?,
            isPremiumUser: null == isPremiumUser
                ? _value.isPremiumUser
                : isPremiumUser // ignore: cast_nullable_to_non_nullable
                      as bool,
            isFileUploading: null == isFileUploading
                ? _value.isFileUploading
                : isFileUploading // ignore: cast_nullable_to_non_nullable
                      as bool,
            roomId: freezed == roomId
                ? _value.roomId
                : roomId // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AvatarCopyWith<$Res>? get uploadedFile {
    if (_value.uploadedFile == null) {
      return null;
    }

    return $AvatarCopyWith<$Res>(_value.uploadedFile!, (value) {
      return _then(_value.copyWith(uploadedFile: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChatStateImplCopyWith<$Res>
    implements $ChatStateCopyWith<$Res> {
  factory _$$ChatStateImplCopyWith(
    _$ChatStateImpl value,
    $Res Function(_$ChatStateImpl) then,
  ) = __$$ChatStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool isError,
    Avatar? uploadedFile,
    bool isPremiumUser,
    bool isFileUploading,
    String? roomId,
  });

  @override
  $AvatarCopyWith<$Res>? get uploadedFile;
}

/// @nodoc
class __$$ChatStateImplCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$ChatStateImpl>
    implements _$$ChatStateImplCopyWith<$Res> {
  __$$ChatStateImplCopyWithImpl(
    _$ChatStateImpl _value,
    $Res Function(_$ChatStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isError = null,
    Object? uploadedFile = freezed,
    Object? isPremiumUser = null,
    Object? isFileUploading = null,
    Object? roomId = freezed,
  }) {
    return _then(
      _$ChatStateImpl(
        isError: null == isError
            ? _value.isError
            : isError // ignore: cast_nullable_to_non_nullable
                  as bool,
        uploadedFile: freezed == uploadedFile
            ? _value.uploadedFile
            : uploadedFile // ignore: cast_nullable_to_non_nullable
                  as Avatar?,
        isPremiumUser: null == isPremiumUser
            ? _value.isPremiumUser
            : isPremiumUser // ignore: cast_nullable_to_non_nullable
                  as bool,
        isFileUploading: null == isFileUploading
            ? _value.isFileUploading
            : isFileUploading // ignore: cast_nullable_to_non_nullable
                  as bool,
        roomId: freezed == roomId
            ? _value.roomId
            : roomId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$ChatStateImpl implements _ChatState {
  const _$ChatStateImpl({
    this.isError = false,
    this.uploadedFile,
    this.isPremiumUser = false,
    this.isFileUploading = false,
    this.roomId = null,
  });

  @override
  @JsonKey()
  final bool isError;
  @override
  final Avatar? uploadedFile;
  @override
  @JsonKey()
  final bool isPremiumUser;
  @override
  @JsonKey()
  final bool isFileUploading;
  @override
  @JsonKey()
  final String? roomId;

  @override
  String toString() {
    return 'ChatState(isError: $isError, uploadedFile: $uploadedFile, isPremiumUser: $isPremiumUser, isFileUploading: $isFileUploading, roomId: $roomId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatStateImpl &&
            (identical(other.isError, isError) || other.isError == isError) &&
            (identical(other.uploadedFile, uploadedFile) ||
                other.uploadedFile == uploadedFile) &&
            (identical(other.isPremiumUser, isPremiumUser) ||
                other.isPremiumUser == isPremiumUser) &&
            (identical(other.isFileUploading, isFileUploading) ||
                other.isFileUploading == isFileUploading) &&
            (identical(other.roomId, roomId) || other.roomId == roomId));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    isError,
    uploadedFile,
    isPremiumUser,
    isFileUploading,
    roomId,
  );

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatStateImplCopyWith<_$ChatStateImpl> get copyWith =>
      __$$ChatStateImplCopyWithImpl<_$ChatStateImpl>(this, _$identity);
}

abstract class _ChatState implements ChatState {
  const factory _ChatState({
    final bool isError,
    final Avatar? uploadedFile,
    final bool isPremiumUser,
    final bool isFileUploading,
    final String? roomId,
  }) = _$ChatStateImpl;

  @override
  bool get isError;
  @override
  Avatar? get uploadedFile;
  @override
  bool get isPremiumUser;
  @override
  bool get isFileUploading;
  @override
  String? get roomId;

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatStateImplCopyWith<_$ChatStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
