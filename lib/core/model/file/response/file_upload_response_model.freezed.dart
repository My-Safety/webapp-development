// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'file_upload_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

FileUploadResponseModel _$FileUploadResponseModelFromJson(
  Map<String, dynamic> json,
) {
  return _FileUploadResponseModel.fromJson(json);
}

/// @nodoc
mixin _$FileUploadResponseModel {
  @JsonKey(name: 'fileUrl')
  String? get fileUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'fileName')
  String? get fileName => throw _privateConstructorUsedError;
  @JsonKey(name: 'fileSize')
  int? get fileSize => throw _privateConstructorUsedError;
  @JsonKey(name: 'mimeType')
  String? get mimeType => throw _privateConstructorUsedError;

  /// Serializes this FileUploadResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FileUploadResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FileUploadResponseModelCopyWith<FileUploadResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FileUploadResponseModelCopyWith<$Res> {
  factory $FileUploadResponseModelCopyWith(
    FileUploadResponseModel value,
    $Res Function(FileUploadResponseModel) then,
  ) = _$FileUploadResponseModelCopyWithImpl<$Res, FileUploadResponseModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'fileUrl') String? fileUrl,
    @JsonKey(name: 'fileName') String? fileName,
    @JsonKey(name: 'fileSize') int? fileSize,
    @JsonKey(name: 'mimeType') String? mimeType,
  });
}

/// @nodoc
class _$FileUploadResponseModelCopyWithImpl<
  $Res,
  $Val extends FileUploadResponseModel
>
    implements $FileUploadResponseModelCopyWith<$Res> {
  _$FileUploadResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FileUploadResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileUrl = freezed,
    Object? fileName = freezed,
    Object? fileSize = freezed,
    Object? mimeType = freezed,
  }) {
    return _then(
      _value.copyWith(
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FileUploadResponseModelImplCopyWith<$Res>
    implements $FileUploadResponseModelCopyWith<$Res> {
  factory _$$FileUploadResponseModelImplCopyWith(
    _$FileUploadResponseModelImpl value,
    $Res Function(_$FileUploadResponseModelImpl) then,
  ) = __$$FileUploadResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'fileUrl') String? fileUrl,
    @JsonKey(name: 'fileName') String? fileName,
    @JsonKey(name: 'fileSize') int? fileSize,
    @JsonKey(name: 'mimeType') String? mimeType,
  });
}

/// @nodoc
class __$$FileUploadResponseModelImplCopyWithImpl<$Res>
    extends
        _$FileUploadResponseModelCopyWithImpl<
          $Res,
          _$FileUploadResponseModelImpl
        >
    implements _$$FileUploadResponseModelImplCopyWith<$Res> {
  __$$FileUploadResponseModelImplCopyWithImpl(
    _$FileUploadResponseModelImpl _value,
    $Res Function(_$FileUploadResponseModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FileUploadResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileUrl = freezed,
    Object? fileName = freezed,
    Object? fileSize = freezed,
    Object? mimeType = freezed,
  }) {
    return _then(
      _$FileUploadResponseModelImpl(
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
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FileUploadResponseModelImpl implements _FileUploadResponseModel {
  const _$FileUploadResponseModelImpl({
    @JsonKey(name: 'fileUrl') this.fileUrl,
    @JsonKey(name: 'fileName') this.fileName,
    @JsonKey(name: 'fileSize') this.fileSize,
    @JsonKey(name: 'mimeType') this.mimeType,
  });

  factory _$FileUploadResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FileUploadResponseModelImplFromJson(json);

  @override
  @JsonKey(name: 'fileUrl')
  final String? fileUrl;
  @override
  @JsonKey(name: 'fileName')
  final String? fileName;
  @override
  @JsonKey(name: 'fileSize')
  final int? fileSize;
  @override
  @JsonKey(name: 'mimeType')
  final String? mimeType;

  @override
  String toString() {
    return 'FileUploadResponseModel(fileUrl: $fileUrl, fileName: $fileName, fileSize: $fileSize, mimeType: $mimeType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FileUploadResponseModelImpl &&
            (identical(other.fileUrl, fileUrl) || other.fileUrl == fileUrl) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.fileSize, fileSize) ||
                other.fileSize == fileSize) &&
            (identical(other.mimeType, mimeType) ||
                other.mimeType == mimeType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, fileUrl, fileName, fileSize, mimeType);

  /// Create a copy of FileUploadResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FileUploadResponseModelImplCopyWith<_$FileUploadResponseModelImpl>
  get copyWith =>
      __$$FileUploadResponseModelImplCopyWithImpl<
        _$FileUploadResponseModelImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FileUploadResponseModelImplToJson(this);
  }
}

abstract class _FileUploadResponseModel implements FileUploadResponseModel {
  const factory _FileUploadResponseModel({
    @JsonKey(name: 'fileUrl') final String? fileUrl,
    @JsonKey(name: 'fileName') final String? fileName,
    @JsonKey(name: 'fileSize') final int? fileSize,
    @JsonKey(name: 'mimeType') final String? mimeType,
  }) = _$FileUploadResponseModelImpl;

  factory _FileUploadResponseModel.fromJson(Map<String, dynamic> json) =
      _$FileUploadResponseModelImpl.fromJson;

  @override
  @JsonKey(name: 'fileUrl')
  String? get fileUrl;
  @override
  @JsonKey(name: 'fileName')
  String? get fileName;
  @override
  @JsonKey(name: 'fileSize')
  int? get fileSize;
  @override
  @JsonKey(name: 'mimeType')
  String? get mimeType;

  /// Create a copy of FileUploadResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FileUploadResponseModelImplCopyWith<_$FileUploadResponseModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
