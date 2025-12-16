// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ProfileState {
  bool get isAddressLoading => throw _privateConstructorUsedError;
  bool get isLanguageListLoading => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;
  String? get qrId => throw _privateConstructorUsedError;
  bool get isUserResponseLoading => throw _privateConstructorUsedError;
  List<LanguagesResponseModel> get languages =>
      throw _privateConstructorUsedError;
  List<LanguagesResponseModel> get globalLanguages =>
      throw _privateConstructorUsedError;
  List<LanguagesResponseModel> get localLanguages =>
      throw _privateConstructorUsedError;
  LanguagesResponseModel? get selectedLanguages =>
      throw _privateConstructorUsedError;
  QrScanResponseModel? get qrScanResponse => throw _privateConstructorUsedError;
  bool get isUpdateProfileLoading => throw _privateConstructorUsedError;
  bool get isHandleDoorBellLoading => throw _privateConstructorUsedError;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfileStateCopyWith<ProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileStateCopyWith<$Res> {
  factory $ProfileStateCopyWith(
    ProfileState value,
    $Res Function(ProfileState) then,
  ) = _$ProfileStateCopyWithImpl<$Res, ProfileState>;
  @useResult
  $Res call({
    bool isAddressLoading,
    bool isLanguageListLoading,
    User? user,
    String? qrId,
    bool isUserResponseLoading,
    List<LanguagesResponseModel> languages,
    List<LanguagesResponseModel> globalLanguages,
    List<LanguagesResponseModel> localLanguages,
    LanguagesResponseModel? selectedLanguages,
    QrScanResponseModel? qrScanResponse,
    bool isUpdateProfileLoading,
    bool isHandleDoorBellLoading,
  });

  $UserCopyWith<$Res>? get user;
  $LanguagesResponseModelCopyWith<$Res>? get selectedLanguages;
  $QrScanResponseModelCopyWith<$Res>? get qrScanResponse;
}

/// @nodoc
class _$ProfileStateCopyWithImpl<$Res, $Val extends ProfileState>
    implements $ProfileStateCopyWith<$Res> {
  _$ProfileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAddressLoading = null,
    Object? isLanguageListLoading = null,
    Object? user = freezed,
    Object? qrId = freezed,
    Object? isUserResponseLoading = null,
    Object? languages = null,
    Object? globalLanguages = null,
    Object? localLanguages = null,
    Object? selectedLanguages = freezed,
    Object? qrScanResponse = freezed,
    Object? isUpdateProfileLoading = null,
    Object? isHandleDoorBellLoading = null,
  }) {
    return _then(
      _value.copyWith(
            isAddressLoading: null == isAddressLoading
                ? _value.isAddressLoading
                : isAddressLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
            isLanguageListLoading: null == isLanguageListLoading
                ? _value.isLanguageListLoading
                : isLanguageListLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
            user: freezed == user
                ? _value.user
                : user // ignore: cast_nullable_to_non_nullable
                      as User?,
            qrId: freezed == qrId
                ? _value.qrId
                : qrId // ignore: cast_nullable_to_non_nullable
                      as String?,
            isUserResponseLoading: null == isUserResponseLoading
                ? _value.isUserResponseLoading
                : isUserResponseLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
            languages: null == languages
                ? _value.languages
                : languages // ignore: cast_nullable_to_non_nullable
                      as List<LanguagesResponseModel>,
            globalLanguages: null == globalLanguages
                ? _value.globalLanguages
                : globalLanguages // ignore: cast_nullable_to_non_nullable
                      as List<LanguagesResponseModel>,
            localLanguages: null == localLanguages
                ? _value.localLanguages
                : localLanguages // ignore: cast_nullable_to_non_nullable
                      as List<LanguagesResponseModel>,
            selectedLanguages: freezed == selectedLanguages
                ? _value.selectedLanguages
                : selectedLanguages // ignore: cast_nullable_to_non_nullable
                      as LanguagesResponseModel?,
            qrScanResponse: freezed == qrScanResponse
                ? _value.qrScanResponse
                : qrScanResponse // ignore: cast_nullable_to_non_nullable
                      as QrScanResponseModel?,
            isUpdateProfileLoading: null == isUpdateProfileLoading
                ? _value.isUpdateProfileLoading
                : isUpdateProfileLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
            isHandleDoorBellLoading: null == isHandleDoorBellLoading
                ? _value.isHandleDoorBellLoading
                : isHandleDoorBellLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LanguagesResponseModelCopyWith<$Res>? get selectedLanguages {
    if (_value.selectedLanguages == null) {
      return null;
    }

    return $LanguagesResponseModelCopyWith<$Res>(_value.selectedLanguages!, (
      value,
    ) {
      return _then(_value.copyWith(selectedLanguages: value) as $Val);
    });
  }

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $QrScanResponseModelCopyWith<$Res>? get qrScanResponse {
    if (_value.qrScanResponse == null) {
      return null;
    }

    return $QrScanResponseModelCopyWith<$Res>(_value.qrScanResponse!, (value) {
      return _then(_value.copyWith(qrScanResponse: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProfileStateImplCopyWith<$Res>
    implements $ProfileStateCopyWith<$Res> {
  factory _$$ProfileStateImplCopyWith(
    _$ProfileStateImpl value,
    $Res Function(_$ProfileStateImpl) then,
  ) = __$$ProfileStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool isAddressLoading,
    bool isLanguageListLoading,
    User? user,
    String? qrId,
    bool isUserResponseLoading,
    List<LanguagesResponseModel> languages,
    List<LanguagesResponseModel> globalLanguages,
    List<LanguagesResponseModel> localLanguages,
    LanguagesResponseModel? selectedLanguages,
    QrScanResponseModel? qrScanResponse,
    bool isUpdateProfileLoading,
    bool isHandleDoorBellLoading,
  });

  @override
  $UserCopyWith<$Res>? get user;
  @override
  $LanguagesResponseModelCopyWith<$Res>? get selectedLanguages;
  @override
  $QrScanResponseModelCopyWith<$Res>? get qrScanResponse;
}

/// @nodoc
class __$$ProfileStateImplCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$ProfileStateImpl>
    implements _$$ProfileStateImplCopyWith<$Res> {
  __$$ProfileStateImplCopyWithImpl(
    _$ProfileStateImpl _value,
    $Res Function(_$ProfileStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAddressLoading = null,
    Object? isLanguageListLoading = null,
    Object? user = freezed,
    Object? qrId = freezed,
    Object? isUserResponseLoading = null,
    Object? languages = null,
    Object? globalLanguages = null,
    Object? localLanguages = null,
    Object? selectedLanguages = freezed,
    Object? qrScanResponse = freezed,
    Object? isUpdateProfileLoading = null,
    Object? isHandleDoorBellLoading = null,
  }) {
    return _then(
      _$ProfileStateImpl(
        isAddressLoading: null == isAddressLoading
            ? _value.isAddressLoading
            : isAddressLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
        isLanguageListLoading: null == isLanguageListLoading
            ? _value.isLanguageListLoading
            : isLanguageListLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
        user: freezed == user
            ? _value.user
            : user // ignore: cast_nullable_to_non_nullable
                  as User?,
        qrId: freezed == qrId
            ? _value.qrId
            : qrId // ignore: cast_nullable_to_non_nullable
                  as String?,
        isUserResponseLoading: null == isUserResponseLoading
            ? _value.isUserResponseLoading
            : isUserResponseLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
        languages: null == languages
            ? _value._languages
            : languages // ignore: cast_nullable_to_non_nullable
                  as List<LanguagesResponseModel>,
        globalLanguages: null == globalLanguages
            ? _value._globalLanguages
            : globalLanguages // ignore: cast_nullable_to_non_nullable
                  as List<LanguagesResponseModel>,
        localLanguages: null == localLanguages
            ? _value._localLanguages
            : localLanguages // ignore: cast_nullable_to_non_nullable
                  as List<LanguagesResponseModel>,
        selectedLanguages: freezed == selectedLanguages
            ? _value.selectedLanguages
            : selectedLanguages // ignore: cast_nullable_to_non_nullable
                  as LanguagesResponseModel?,
        qrScanResponse: freezed == qrScanResponse
            ? _value.qrScanResponse
            : qrScanResponse // ignore: cast_nullable_to_non_nullable
                  as QrScanResponseModel?,
        isUpdateProfileLoading: null == isUpdateProfileLoading
            ? _value.isUpdateProfileLoading
            : isUpdateProfileLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
        isHandleDoorBellLoading: null == isHandleDoorBellLoading
            ? _value.isHandleDoorBellLoading
            : isHandleDoorBellLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$ProfileStateImpl implements _ProfileState {
  const _$ProfileStateImpl({
    this.isAddressLoading = false,
    this.isLanguageListLoading = false,
    this.user,
    this.qrId,
    this.isUserResponseLoading = false,
    final List<LanguagesResponseModel> languages = const [],
    final List<LanguagesResponseModel> globalLanguages = const [],
    final List<LanguagesResponseModel> localLanguages = const [],
    this.selectedLanguages,
    this.qrScanResponse,
    this.isUpdateProfileLoading = false,
    this.isHandleDoorBellLoading = false,
  }) : _languages = languages,
       _globalLanguages = globalLanguages,
       _localLanguages = localLanguages;

  @override
  @JsonKey()
  final bool isAddressLoading;
  @override
  @JsonKey()
  final bool isLanguageListLoading;
  @override
  final User? user;
  @override
  final String? qrId;
  @override
  @JsonKey()
  final bool isUserResponseLoading;
  final List<LanguagesResponseModel> _languages;
  @override
  @JsonKey()
  List<LanguagesResponseModel> get languages {
    if (_languages is EqualUnmodifiableListView) return _languages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_languages);
  }

  final List<LanguagesResponseModel> _globalLanguages;
  @override
  @JsonKey()
  List<LanguagesResponseModel> get globalLanguages {
    if (_globalLanguages is EqualUnmodifiableListView) return _globalLanguages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_globalLanguages);
  }

  final List<LanguagesResponseModel> _localLanguages;
  @override
  @JsonKey()
  List<LanguagesResponseModel> get localLanguages {
    if (_localLanguages is EqualUnmodifiableListView) return _localLanguages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_localLanguages);
  }

  @override
  final LanguagesResponseModel? selectedLanguages;
  @override
  final QrScanResponseModel? qrScanResponse;
  @override
  @JsonKey()
  final bool isUpdateProfileLoading;
  @override
  @JsonKey()
  final bool isHandleDoorBellLoading;

  @override
  String toString() {
    return 'ProfileState(isAddressLoading: $isAddressLoading, isLanguageListLoading: $isLanguageListLoading, user: $user, qrId: $qrId, isUserResponseLoading: $isUserResponseLoading, languages: $languages, globalLanguages: $globalLanguages, localLanguages: $localLanguages, selectedLanguages: $selectedLanguages, qrScanResponse: $qrScanResponse, isUpdateProfileLoading: $isUpdateProfileLoading, isHandleDoorBellLoading: $isHandleDoorBellLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileStateImpl &&
            (identical(other.isAddressLoading, isAddressLoading) ||
                other.isAddressLoading == isAddressLoading) &&
            (identical(other.isLanguageListLoading, isLanguageListLoading) ||
                other.isLanguageListLoading == isLanguageListLoading) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.qrId, qrId) || other.qrId == qrId) &&
            (identical(other.isUserResponseLoading, isUserResponseLoading) ||
                other.isUserResponseLoading == isUserResponseLoading) &&
            const DeepCollectionEquality().equals(
              other._languages,
              _languages,
            ) &&
            const DeepCollectionEquality().equals(
              other._globalLanguages,
              _globalLanguages,
            ) &&
            const DeepCollectionEquality().equals(
              other._localLanguages,
              _localLanguages,
            ) &&
            (identical(other.selectedLanguages, selectedLanguages) ||
                other.selectedLanguages == selectedLanguages) &&
            (identical(other.qrScanResponse, qrScanResponse) ||
                other.qrScanResponse == qrScanResponse) &&
            (identical(other.isUpdateProfileLoading, isUpdateProfileLoading) ||
                other.isUpdateProfileLoading == isUpdateProfileLoading) &&
            (identical(
                  other.isHandleDoorBellLoading,
                  isHandleDoorBellLoading,
                ) ||
                other.isHandleDoorBellLoading == isHandleDoorBellLoading));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    isAddressLoading,
    isLanguageListLoading,
    user,
    qrId,
    isUserResponseLoading,
    const DeepCollectionEquality().hash(_languages),
    const DeepCollectionEquality().hash(_globalLanguages),
    const DeepCollectionEquality().hash(_localLanguages),
    selectedLanguages,
    qrScanResponse,
    isUpdateProfileLoading,
    isHandleDoorBellLoading,
  );

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileStateImplCopyWith<_$ProfileStateImpl> get copyWith =>
      __$$ProfileStateImplCopyWithImpl<_$ProfileStateImpl>(this, _$identity);
}

abstract class _ProfileState implements ProfileState {
  const factory _ProfileState({
    final bool isAddressLoading,
    final bool isLanguageListLoading,
    final User? user,
    final String? qrId,
    final bool isUserResponseLoading,
    final List<LanguagesResponseModel> languages,
    final List<LanguagesResponseModel> globalLanguages,
    final List<LanguagesResponseModel> localLanguages,
    final LanguagesResponseModel? selectedLanguages,
    final QrScanResponseModel? qrScanResponse,
    final bool isUpdateProfileLoading,
    final bool isHandleDoorBellLoading,
  }) = _$ProfileStateImpl;

  @override
  bool get isAddressLoading;
  @override
  bool get isLanguageListLoading;
  @override
  User? get user;
  @override
  String? get qrId;
  @override
  bool get isUserResponseLoading;
  @override
  List<LanguagesResponseModel> get languages;
  @override
  List<LanguagesResponseModel> get globalLanguages;
  @override
  List<LanguagesResponseModel> get localLanguages;
  @override
  LanguagesResponseModel? get selectedLanguages;
  @override
  QrScanResponseModel? get qrScanResponse;
  @override
  bool get isUpdateProfileLoading;
  @override
  bool get isHandleDoorBellLoading;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileStateImplCopyWith<_$ProfileStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
