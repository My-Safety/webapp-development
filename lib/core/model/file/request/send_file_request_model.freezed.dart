// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'send_file_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SendFileRequestModel _$SendFileRequestModelFromJson(Map<String, dynamic> json) {
  return _SendFileRequestModel.fromJson(json);
}

/// @nodoc
mixin _$SendFileRequestModel {
  @JsonKey(name: "category")
  String? get category => throw _privateConstructorUsedError;
  @JsonKey(name: "fileUrl")
  String? get fileUrl => throw _privateConstructorUsedError;
  @JsonKey(name: "fileName")
  String? get fileName => throw _privateConstructorUsedError;
  @JsonKey(name: "fileSize")
  int? get fileSize => throw _privateConstructorUsedError;
  @JsonKey(name: "mimeType")
  String? get mimeType => throw _privateConstructorUsedError;
  @JsonKey(name: "uploadMethod")
  String? get uploadMethod => throw _privateConstructorUsedError;

  /// Serializes this SendFileRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SendFileRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SendFileRequestModelCopyWith<SendFileRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendFileRequestModelCopyWith<$Res> {
  factory $SendFileRequestModelCopyWith(
    SendFileRequestModel value,
    $Res Function(SendFileRequestModel) then,
  ) = _$SendFileRequestModelCopyWithImpl<$Res, SendFileRequestModel>;
  @useResult
  $Res call({
    @JsonKey(name: "category") String? category,
    @JsonKey(name: "fileUrl") String? fileUrl,
    @JsonKey(name: "fileName") String? fileName,
    @JsonKey(name: "fileSize") int? fileSize,
    @JsonKey(name: "mimeType") String? mimeType,
    @JsonKey(name: "uploadMethod") String? uploadMethod,
  });
}

/// @nodoc
class _$SendFileRequestModelCopyWithImpl<
  $Res,
  $Val extends SendFileRequestModel
>
    implements $SendFileRequestModelCopyWith<$Res> {
  _$SendFileRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SendFileRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = freezed,
    Object? fileUrl = freezed,
    Object? fileName = freezed,
    Object? fileSize = freezed,
    Object? mimeType = freezed,
    Object? uploadMethod = freezed,
  }) {
    return _then(
      _value.copyWith(
            category: freezed == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as String?,
            fileUrl: freezed == fileUrl
                ? _value.fileUrl
                : fileUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            fileName: freezed == fileName
                ? _value.fileName
                : fileName // ignore: cast_nullable_to_non_nullable
                      as String?,
            fileSize: freezed == fileSize
                ? _value.fileSize
                : fileSize // ignore: cast_nullable_to_non_nullable
                      as int?,
            mimeType: freezed == mimeType
                ? _value.mimeType
                : mimeType // ignore: cast_nullable_to_non_nullable
                      as String?,
            uploadMethod: freezed == uploadMethod
                ? _value.uploadMethod
                : uploadMethod // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SendFileRequestModelImplCopyWith<$Res>
    implements $SendFileRequestModelCopyWith<$Res> {
  factory _$$SendFileRequestModelImplCopyWith(
    _$SendFileRequestModelImpl value,
    $Res Function(_$SendFileRequestModelImpl) then,
  ) = __$$SendFileRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "category") String? category,
    @JsonKey(name: "fileUrl") String? fileUrl,
    @JsonKey(name: "fileName") String? fileName,
    @JsonKey(name: "fileSize") int? fileSize,
    @JsonKey(name: "mimeType") String? mimeType,
    @JsonKey(name: "uploadMethod") String? uploadMethod,
  });
}

/// @nodoc
class __$$SendFileRequestModelImplCopyWithImpl<$Res>
    extends _$SendFileRequestModelCopyWithImpl<$Res, _$SendFileRequestModelImpl>
    implements _$$SendFileRequestModelImplCopyWith<$Res> {
  __$$SendFileRequestModelImplCopyWithImpl(
    _$SendFileRequestModelImpl _value,
    $Res Function(_$SendFileRequestModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SendFileRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = freezed,
    Object? fileUrl = freezed,
    Object? fileName = freezed,
    Object? fileSize = freezed,
    Object? mimeType = freezed,
    Object? uploadMethod = freezed,
  }) {
    return _then(
      _$SendFileRequestModelImpl(
        category: freezed == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as String?,
        fileUrl: freezed == fileUrl
            ? _value.fileUrl
            : fileUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        fileName: freezed == fileName
            ? _value.fileName
            : fileName // ignore: cast_nullable_to_non_nullable
                  as String?,
        fileSize: freezed == fileSize
            ? _value.fileSize
            : fileSize // ignore: cast_nullable_to_non_nullable
                  as int?,
        mimeType: freezed == mimeType
            ? _value.mimeType
            : mimeType // ignore: cast_nullable_to_non_nullable
                  as String?,
        uploadMethod: freezed == uploadMethod
            ? _value.uploadMethod
            : uploadMethod // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SendFileRequestModelImpl implements _SendFileRequestModel {
  const _$SendFileRequestModelImpl({
    @JsonKey(name: "category") this.category,
    @JsonKey(name: "fileUrl") this.fileUrl,
    @JsonKey(name: "fileName") this.fileName,
    @JsonKey(name: "fileSize") this.fileSize,
    @JsonKey(name: "mimeType") this.mimeType,
    @JsonKey(name: "uploadMethod") this.uploadMethod,
  });

  factory _$SendFileRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SendFileRequestModelImplFromJson(json);

  @override
  @JsonKey(name: "category")
  final String? category;
  @override
  @JsonKey(name: "fileUrl")
  final String? fileUrl;
  @override
  @JsonKey(name: "fileName")
  final String? fileName;
  @override
  @JsonKey(name: "fileSize")
  final int? fileSize;
  @override
  @JsonKey(name: "mimeType")
  final String? mimeType;
  @override
  @JsonKey(name: "uploadMethod")
  final String? uploadMethod;

  @override
  String toString() {
    return 'SendFileRequestModel(category: $category, fileUrl: $fileUrl, fileName: $fileName, fileSize: $fileSize, mimeType: $mimeType, uploadMethod: $uploadMethod)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendFileRequestModelImpl &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.fileUrl, fileUrl) || other.fileUrl == fileUrl) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.fileSize, fileSize) ||
                other.fileSize == fileSize) &&
            (identical(other.mimeType, mimeType) ||
                other.mimeType == mimeType) &&
            (identical(other.uploadMethod, uploadMethod) ||
                other.uploadMethod == uploadMethod));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    category,
    fileUrl,
    fileName,
    fileSize,
    mimeType,
    uploadMethod,
  );

  /// Create a copy of SendFileRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendFileRequestModelImplCopyWith<_$SendFileRequestModelImpl>
  get copyWith =>
      __$$SendFileRequestModelImplCopyWithImpl<_$SendFileRequestModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SendFileRequestModelImplToJson(this);
  }
}

abstract class _SendFileRequestModel implements SendFileRequestModel {
  const factory _SendFileRequestModel({
    @JsonKey(name: "category") final String? category,
    @JsonKey(name: "fileUrl") final String? fileUrl,
    @JsonKey(name: "fileName") final String? fileName,
    @JsonKey(name: "fileSize") final int? fileSize,
    @JsonKey(name: "mimeType") final String? mimeType,
    @JsonKey(name: "uploadMethod") final String? uploadMethod,
  }) = _$SendFileRequestModelImpl;

  factory _SendFileRequestModel.fromJson(Map<String, dynamic> json) =
      _$SendFileRequestModelImpl.fromJson;

  @override
  @JsonKey(name: "category")
  String? get category;
  @override
  @JsonKey(name: "fileUrl")
  String? get fileUrl;
  @override
  @JsonKey(name: "fileName")
  String? get fileName;
  @override
  @JsonKey(name: "fileSize")
  int? get fileSize;
  @override
  @JsonKey(name: "mimeType")
  String? get mimeType;
  @override
  @JsonKey(name: "uploadMethod")
  String? get uploadMethod;

  /// Create a copy of SendFileRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendFileRequestModelImplCopyWith<_$SendFileRequestModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
