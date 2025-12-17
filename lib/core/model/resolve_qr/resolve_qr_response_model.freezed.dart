// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resolve_qr_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ResolveQrResponseModel _$ResolveQrResponseModelFromJson(
  Map<String, dynamic> json,
) {
  return _ResolveQrResponseModel.fromJson(json);
}

/// @nodoc
mixin _$ResolveQrResponseModel {
  Qr? get qr => throw _privateConstructorUsedError;
  Profile? get profile => throw _privateConstructorUsedError;

  /// Serializes this ResolveQrResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResolveQrResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResolveQrResponseModelCopyWith<ResolveQrResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResolveQrResponseModelCopyWith<$Res> {
  factory $ResolveQrResponseModelCopyWith(
    ResolveQrResponseModel value,
    $Res Function(ResolveQrResponseModel) then,
  ) = _$ResolveQrResponseModelCopyWithImpl<$Res, ResolveQrResponseModel>;
  @useResult
  $Res call({Qr? qr, Profile? profile});

  $QrCopyWith<$Res>? get qr;
  $ProfileCopyWith<$Res>? get profile;
}

/// @nodoc
class _$ResolveQrResponseModelCopyWithImpl<
  $Res,
  $Val extends ResolveQrResponseModel
>
    implements $ResolveQrResponseModelCopyWith<$Res> {
  _$ResolveQrResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResolveQrResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? qr = freezed, Object? profile = freezed}) {
    return _then(
      _value.copyWith(
            qr: freezed == qr
                ? _value.qr
                : qr // ignore: cast_nullable_to_non_nullable
                      as Qr?,
            profile: freezed == profile
                ? _value.profile
                : profile // ignore: cast_nullable_to_non_nullable
                      as Profile?,
          )
          as $Val,
    );
  }

  /// Create a copy of ResolveQrResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $QrCopyWith<$Res>? get qr {
    if (_value.qr == null) {
      return null;
    }

    return $QrCopyWith<$Res>(_value.qr!, (value) {
      return _then(_value.copyWith(qr: value) as $Val);
    });
  }

  /// Create a copy of ResolveQrResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<$Res>? get profile {
    if (_value.profile == null) {
      return null;
    }

    return $ProfileCopyWith<$Res>(_value.profile!, (value) {
      return _then(_value.copyWith(profile: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ResolveQrResponseModelImplCopyWith<$Res>
    implements $ResolveQrResponseModelCopyWith<$Res> {
  factory _$$ResolveQrResponseModelImplCopyWith(
    _$ResolveQrResponseModelImpl value,
    $Res Function(_$ResolveQrResponseModelImpl) then,
  ) = __$$ResolveQrResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Qr? qr, Profile? profile});

  @override
  $QrCopyWith<$Res>? get qr;
  @override
  $ProfileCopyWith<$Res>? get profile;
}

/// @nodoc
class __$$ResolveQrResponseModelImplCopyWithImpl<$Res>
    extends
        _$ResolveQrResponseModelCopyWithImpl<$Res, _$ResolveQrResponseModelImpl>
    implements _$$ResolveQrResponseModelImplCopyWith<$Res> {
  __$$ResolveQrResponseModelImplCopyWithImpl(
    _$ResolveQrResponseModelImpl _value,
    $Res Function(_$ResolveQrResponseModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ResolveQrResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? qr = freezed, Object? profile = freezed}) {
    return _then(
      _$ResolveQrResponseModelImpl(
        qr: freezed == qr
            ? _value.qr
            : qr // ignore: cast_nullable_to_non_nullable
                  as Qr?,
        profile: freezed == profile
            ? _value.profile
            : profile // ignore: cast_nullable_to_non_nullable
                  as Profile?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ResolveQrResponseModelImpl implements _ResolveQrResponseModel {
  const _$ResolveQrResponseModelImpl({this.qr, this.profile});

  factory _$ResolveQrResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResolveQrResponseModelImplFromJson(json);

  @override
  final Qr? qr;
  @override
  final Profile? profile;

  @override
  String toString() {
    return 'ResolveQrResponseModel(qr: $qr, profile: $profile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResolveQrResponseModelImpl &&
            (identical(other.qr, qr) || other.qr == qr) &&
            (identical(other.profile, profile) || other.profile == profile));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, qr, profile);

  /// Create a copy of ResolveQrResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResolveQrResponseModelImplCopyWith<_$ResolveQrResponseModelImpl>
  get copyWith =>
      __$$ResolveQrResponseModelImplCopyWithImpl<_$ResolveQrResponseModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ResolveQrResponseModelImplToJson(this);
  }
}

abstract class _ResolveQrResponseModel implements ResolveQrResponseModel {
  const factory _ResolveQrResponseModel({
    final Qr? qr,
    final Profile? profile,
  }) = _$ResolveQrResponseModelImpl;

  factory _ResolveQrResponseModel.fromJson(Map<String, dynamic> json) =
      _$ResolveQrResponseModelImpl.fromJson;

  @override
  Qr? get qr;
  @override
  Profile? get profile;

  /// Create a copy of ResolveQrResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResolveQrResponseModelImplCopyWith<_$ResolveQrResponseModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}

Profile _$ProfileFromJson(Map<String, dynamic> json) {
  return _Profile.fromJson(json);
}

/// @nodoc
mixin _$Profile {
  String? get id => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  String? get houseName => throw _privateConstructorUsedError;
  String? get houseNumber => throw _privateConstructorUsedError;
  String? get apartment => throw _privateConstructorUsedError;
  String? get fullAddressUrl => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  List<dynamic>? get memberIds => throw _privateConstructorUsedError;
  List<dynamic>? get frozenMemberIds => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  String? get qrId => throw _privateConstructorUsedError;

  /// Serializes this Profile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfileCopyWith<Profile> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileCopyWith<$Res> {
  factory $ProfileCopyWith(Profile value, $Res Function(Profile) then) =
      _$ProfileCopyWithImpl<$Res, Profile>;
  @useResult
  $Res call({
    String? id,
    String? userId,
    String? houseName,
    String? houseNumber,
    String? apartment,
    String? fullAddressUrl,
    double? latitude,
    double? longitude,
    List<dynamic>? memberIds,
    List<dynamic>? frozenMemberIds,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? qrId,
  });
}

/// @nodoc
class _$ProfileCopyWithImpl<$Res, $Val extends Profile>
    implements $ProfileCopyWith<$Res> {
  _$ProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? houseName = freezed,
    Object? houseNumber = freezed,
    Object? apartment = freezed,
    Object? fullAddressUrl = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? memberIds = freezed,
    Object? frozenMemberIds = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? qrId = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            userId: freezed == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String?,
            houseName: freezed == houseName
                ? _value.houseName
                : houseName // ignore: cast_nullable_to_non_nullable
                      as String?,
            houseNumber: freezed == houseNumber
                ? _value.houseNumber
                : houseNumber // ignore: cast_nullable_to_non_nullable
                      as String?,
            apartment: freezed == apartment
                ? _value.apartment
                : apartment // ignore: cast_nullable_to_non_nullable
                      as String?,
            fullAddressUrl: freezed == fullAddressUrl
                ? _value.fullAddressUrl
                : fullAddressUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            latitude: freezed == latitude
                ? _value.latitude
                : latitude // ignore: cast_nullable_to_non_nullable
                      as double?,
            longitude: freezed == longitude
                ? _value.longitude
                : longitude // ignore: cast_nullable_to_non_nullable
                      as double?,
            memberIds: freezed == memberIds
                ? _value.memberIds
                : memberIds // ignore: cast_nullable_to_non_nullable
                      as List<dynamic>?,
            frozenMemberIds: freezed == frozenMemberIds
                ? _value.frozenMemberIds
                : frozenMemberIds // ignore: cast_nullable_to_non_nullable
                      as List<dynamic>?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            qrId: freezed == qrId
                ? _value.qrId
                : qrId // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProfileImplCopyWith<$Res> implements $ProfileCopyWith<$Res> {
  factory _$$ProfileImplCopyWith(
    _$ProfileImpl value,
    $Res Function(_$ProfileImpl) then,
  ) = __$$ProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? id,
    String? userId,
    String? houseName,
    String? houseNumber,
    String? apartment,
    String? fullAddressUrl,
    double? latitude,
    double? longitude,
    List<dynamic>? memberIds,
    List<dynamic>? frozenMemberIds,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? qrId,
  });
}

/// @nodoc
class __$$ProfileImplCopyWithImpl<$Res>
    extends _$ProfileCopyWithImpl<$Res, _$ProfileImpl>
    implements _$$ProfileImplCopyWith<$Res> {
  __$$ProfileImplCopyWithImpl(
    _$ProfileImpl _value,
    $Res Function(_$ProfileImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? houseName = freezed,
    Object? houseNumber = freezed,
    Object? apartment = freezed,
    Object? fullAddressUrl = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? memberIds = freezed,
    Object? frozenMemberIds = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? qrId = freezed,
  }) {
    return _then(
      _$ProfileImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        userId: freezed == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String?,
        houseName: freezed == houseName
            ? _value.houseName
            : houseName // ignore: cast_nullable_to_non_nullable
                  as String?,
        houseNumber: freezed == houseNumber
            ? _value.houseNumber
            : houseNumber // ignore: cast_nullable_to_non_nullable
                  as String?,
        apartment: freezed == apartment
            ? _value.apartment
            : apartment // ignore: cast_nullable_to_non_nullable
                  as String?,
        fullAddressUrl: freezed == fullAddressUrl
            ? _value.fullAddressUrl
            : fullAddressUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        latitude: freezed == latitude
            ? _value.latitude
            : latitude // ignore: cast_nullable_to_non_nullable
                  as double?,
        longitude: freezed == longitude
            ? _value.longitude
            : longitude // ignore: cast_nullable_to_non_nullable
                  as double?,
        memberIds: freezed == memberIds
            ? _value._memberIds
            : memberIds // ignore: cast_nullable_to_non_nullable
                  as List<dynamic>?,
        frozenMemberIds: freezed == frozenMemberIds
            ? _value._frozenMemberIds
            : frozenMemberIds // ignore: cast_nullable_to_non_nullable
                  as List<dynamic>?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        qrId: freezed == qrId
            ? _value.qrId
            : qrId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileImpl implements _Profile {
  const _$ProfileImpl({
    this.id,
    this.userId,
    this.houseName,
    this.houseNumber,
    this.apartment,
    this.fullAddressUrl,
    this.latitude,
    this.longitude,
    final List<dynamic>? memberIds,
    final List<dynamic>? frozenMemberIds,
    this.createdAt,
    this.updatedAt,
    this.qrId,
  }) : _memberIds = memberIds,
       _frozenMemberIds = frozenMemberIds;

  factory _$ProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileImplFromJson(json);

  @override
  final String? id;
  @override
  final String? userId;
  @override
  final String? houseName;
  @override
  final String? houseNumber;
  @override
  final String? apartment;
  @override
  final String? fullAddressUrl;
  @override
  final double? latitude;
  @override
  final double? longitude;
  final List<dynamic>? _memberIds;
  @override
  List<dynamic>? get memberIds {
    final value = _memberIds;
    if (value == null) return null;
    if (_memberIds is EqualUnmodifiableListView) return _memberIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<dynamic>? _frozenMemberIds;
  @override
  List<dynamic>? get frozenMemberIds {
    final value = _frozenMemberIds;
    if (value == null) return null;
    if (_frozenMemberIds is EqualUnmodifiableListView) return _frozenMemberIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final String? qrId;

  @override
  String toString() {
    return 'Profile(id: $id, userId: $userId, houseName: $houseName, houseNumber: $houseNumber, apartment: $apartment, fullAddressUrl: $fullAddressUrl, latitude: $latitude, longitude: $longitude, memberIds: $memberIds, frozenMemberIds: $frozenMemberIds, createdAt: $createdAt, updatedAt: $updatedAt, qrId: $qrId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.houseName, houseName) ||
                other.houseName == houseName) &&
            (identical(other.houseNumber, houseNumber) ||
                other.houseNumber == houseNumber) &&
            (identical(other.apartment, apartment) ||
                other.apartment == apartment) &&
            (identical(other.fullAddressUrl, fullAddressUrl) ||
                other.fullAddressUrl == fullAddressUrl) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            const DeepCollectionEquality().equals(
              other._memberIds,
              _memberIds,
            ) &&
            const DeepCollectionEquality().equals(
              other._frozenMemberIds,
              _frozenMemberIds,
            ) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.qrId, qrId) || other.qrId == qrId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    userId,
    houseName,
    houseNumber,
    apartment,
    fullAddressUrl,
    latitude,
    longitude,
    const DeepCollectionEquality().hash(_memberIds),
    const DeepCollectionEquality().hash(_frozenMemberIds),
    createdAt,
    updatedAt,
    qrId,
  );

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileImplCopyWith<_$ProfileImpl> get copyWith =>
      __$$ProfileImplCopyWithImpl<_$ProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileImplToJson(this);
  }
}

abstract class _Profile implements Profile {
  const factory _Profile({
    final String? id,
    final String? userId,
    final String? houseName,
    final String? houseNumber,
    final String? apartment,
    final String? fullAddressUrl,
    final double? latitude,
    final double? longitude,
    final List<dynamic>? memberIds,
    final List<dynamic>? frozenMemberIds,
    final DateTime? createdAt,
    final DateTime? updatedAt,
    final String? qrId,
  }) = _$ProfileImpl;

  factory _Profile.fromJson(Map<String, dynamic> json) = _$ProfileImpl.fromJson;

  @override
  String? get id;
  @override
  String? get userId;
  @override
  String? get houseName;
  @override
  String? get houseNumber;
  @override
  String? get apartment;
  @override
  String? get fullAddressUrl;
  @override
  double? get latitude;
  @override
  double? get longitude;
  @override
  List<dynamic>? get memberIds;
  @override
  List<dynamic>? get frozenMemberIds;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  String? get qrId;

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileImplCopyWith<_$ProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Qr _$QrFromJson(Map<String, dynamic> json) {
  return _Qr.fromJson(json);
}

/// @nodoc
mixin _$Qr {
  String? get id => throw _privateConstructorUsedError;
  String? get qrId => throw _privateConstructorUsedError;
  String? get qrType => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  OwnerId? get ownerId => throw _privateConstructorUsedError;
  String? get moduleType => throw _privateConstructorUsedError;
  String? get moduleProfileId => throw _privateConstructorUsedError;
  DateTime? get assignedAt => throw _privateConstructorUsedError;
  String? get planAtActivation => throw _privateConstructorUsedError;
  bool? get isTemporary => throw _privateConstructorUsedError;
  DateTime? get expiresAt => throw _privateConstructorUsedError;
  bool? get isFrozen => throw _privateConstructorUsedError;
  int? get scanCount => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  DateTime? get lastScannedAt => throw _privateConstructorUsedError;

  /// Serializes this Qr to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Qr
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QrCopyWith<Qr> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QrCopyWith<$Res> {
  factory $QrCopyWith(Qr value, $Res Function(Qr) then) =
      _$QrCopyWithImpl<$Res, Qr>;
  @useResult
  $Res call({
    String? id,
    String? qrId,
    String? qrType,
    String? status,
    OwnerId? ownerId,
    String? moduleType,
    String? moduleProfileId,
    DateTime? assignedAt,
    String? planAtActivation,
    bool? isTemporary,
    DateTime? expiresAt,
    bool? isFrozen,
    int? scanCount,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? lastScannedAt,
  });

  $OwnerIdCopyWith<$Res>? get ownerId;
}

/// @nodoc
class _$QrCopyWithImpl<$Res, $Val extends Qr> implements $QrCopyWith<$Res> {
  _$QrCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Qr
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? qrId = freezed,
    Object? qrType = freezed,
    Object? status = freezed,
    Object? ownerId = freezed,
    Object? moduleType = freezed,
    Object? moduleProfileId = freezed,
    Object? assignedAt = freezed,
    Object? planAtActivation = freezed,
    Object? isTemporary = freezed,
    Object? expiresAt = freezed,
    Object? isFrozen = freezed,
    Object? scanCount = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? lastScannedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            qrId: freezed == qrId
                ? _value.qrId
                : qrId // ignore: cast_nullable_to_non_nullable
                      as String?,
            qrType: freezed == qrType
                ? _value.qrType
                : qrType // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String?,
            ownerId: freezed == ownerId
                ? _value.ownerId
                : ownerId // ignore: cast_nullable_to_non_nullable
                      as OwnerId?,
            moduleType: freezed == moduleType
                ? _value.moduleType
                : moduleType // ignore: cast_nullable_to_non_nullable
                      as String?,
            moduleProfileId: freezed == moduleProfileId
                ? _value.moduleProfileId
                : moduleProfileId // ignore: cast_nullable_to_non_nullable
                      as String?,
            assignedAt: freezed == assignedAt
                ? _value.assignedAt
                : assignedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            planAtActivation: freezed == planAtActivation
                ? _value.planAtActivation
                : planAtActivation // ignore: cast_nullable_to_non_nullable
                      as String?,
            isTemporary: freezed == isTemporary
                ? _value.isTemporary
                : isTemporary // ignore: cast_nullable_to_non_nullable
                      as bool?,
            expiresAt: freezed == expiresAt
                ? _value.expiresAt
                : expiresAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            isFrozen: freezed == isFrozen
                ? _value.isFrozen
                : isFrozen // ignore: cast_nullable_to_non_nullable
                      as bool?,
            scanCount: freezed == scanCount
                ? _value.scanCount
                : scanCount // ignore: cast_nullable_to_non_nullable
                      as int?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            lastScannedAt: freezed == lastScannedAt
                ? _value.lastScannedAt
                : lastScannedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }

  /// Create a copy of Qr
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OwnerIdCopyWith<$Res>? get ownerId {
    if (_value.ownerId == null) {
      return null;
    }

    return $OwnerIdCopyWith<$Res>(_value.ownerId!, (value) {
      return _then(_value.copyWith(ownerId: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$QrImplCopyWith<$Res> implements $QrCopyWith<$Res> {
  factory _$$QrImplCopyWith(_$QrImpl value, $Res Function(_$QrImpl) then) =
      __$$QrImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? id,
    String? qrId,
    String? qrType,
    String? status,
    OwnerId? ownerId,
    String? moduleType,
    String? moduleProfileId,
    DateTime? assignedAt,
    String? planAtActivation,
    bool? isTemporary,
    DateTime? expiresAt,
    bool? isFrozen,
    int? scanCount,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? lastScannedAt,
  });

  @override
  $OwnerIdCopyWith<$Res>? get ownerId;
}

/// @nodoc
class __$$QrImplCopyWithImpl<$Res> extends _$QrCopyWithImpl<$Res, _$QrImpl>
    implements _$$QrImplCopyWith<$Res> {
  __$$QrImplCopyWithImpl(_$QrImpl _value, $Res Function(_$QrImpl) _then)
    : super(_value, _then);

  /// Create a copy of Qr
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? qrId = freezed,
    Object? qrType = freezed,
    Object? status = freezed,
    Object? ownerId = freezed,
    Object? moduleType = freezed,
    Object? moduleProfileId = freezed,
    Object? assignedAt = freezed,
    Object? planAtActivation = freezed,
    Object? isTemporary = freezed,
    Object? expiresAt = freezed,
    Object? isFrozen = freezed,
    Object? scanCount = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? lastScannedAt = freezed,
  }) {
    return _then(
      _$QrImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        qrId: freezed == qrId
            ? _value.qrId
            : qrId // ignore: cast_nullable_to_non_nullable
                  as String?,
        qrType: freezed == qrType
            ? _value.qrType
            : qrType // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
        ownerId: freezed == ownerId
            ? _value.ownerId
            : ownerId // ignore: cast_nullable_to_non_nullable
                  as OwnerId?,
        moduleType: freezed == moduleType
            ? _value.moduleType
            : moduleType // ignore: cast_nullable_to_non_nullable
                  as String?,
        moduleProfileId: freezed == moduleProfileId
            ? _value.moduleProfileId
            : moduleProfileId // ignore: cast_nullable_to_non_nullable
                  as String?,
        assignedAt: freezed == assignedAt
            ? _value.assignedAt
            : assignedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        planAtActivation: freezed == planAtActivation
            ? _value.planAtActivation
            : planAtActivation // ignore: cast_nullable_to_non_nullable
                  as String?,
        isTemporary: freezed == isTemporary
            ? _value.isTemporary
            : isTemporary // ignore: cast_nullable_to_non_nullable
                  as bool?,
        expiresAt: freezed == expiresAt
            ? _value.expiresAt
            : expiresAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        isFrozen: freezed == isFrozen
            ? _value.isFrozen
            : isFrozen // ignore: cast_nullable_to_non_nullable
                  as bool?,
        scanCount: freezed == scanCount
            ? _value.scanCount
            : scanCount // ignore: cast_nullable_to_non_nullable
                  as int?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        lastScannedAt: freezed == lastScannedAt
            ? _value.lastScannedAt
            : lastScannedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$QrImpl implements _Qr {
  const _$QrImpl({
    this.id,
    this.qrId,
    this.qrType,
    this.status,
    this.ownerId,
    this.moduleType,
    this.moduleProfileId,
    this.assignedAt,
    this.planAtActivation,
    this.isTemporary,
    this.expiresAt,
    this.isFrozen,
    this.scanCount,
    this.createdAt,
    this.updatedAt,
    this.lastScannedAt,
  });

  factory _$QrImpl.fromJson(Map<String, dynamic> json) =>
      _$$QrImplFromJson(json);

  @override
  final String? id;
  @override
  final String? qrId;
  @override
  final String? qrType;
  @override
  final String? status;
  @override
  final OwnerId? ownerId;
  @override
  final String? moduleType;
  @override
  final String? moduleProfileId;
  @override
  final DateTime? assignedAt;
  @override
  final String? planAtActivation;
  @override
  final bool? isTemporary;
  @override
  final DateTime? expiresAt;
  @override
  final bool? isFrozen;
  @override
  final int? scanCount;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final DateTime? lastScannedAt;

  @override
  String toString() {
    return 'Qr(id: $id, qrId: $qrId, qrType: $qrType, status: $status, ownerId: $ownerId, moduleType: $moduleType, moduleProfileId: $moduleProfileId, assignedAt: $assignedAt, planAtActivation: $planAtActivation, isTemporary: $isTemporary, expiresAt: $expiresAt, isFrozen: $isFrozen, scanCount: $scanCount, createdAt: $createdAt, updatedAt: $updatedAt, lastScannedAt: $lastScannedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QrImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.qrId, qrId) || other.qrId == qrId) &&
            (identical(other.qrType, qrType) || other.qrType == qrType) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.moduleType, moduleType) ||
                other.moduleType == moduleType) &&
            (identical(other.moduleProfileId, moduleProfileId) ||
                other.moduleProfileId == moduleProfileId) &&
            (identical(other.assignedAt, assignedAt) ||
                other.assignedAt == assignedAt) &&
            (identical(other.planAtActivation, planAtActivation) ||
                other.planAtActivation == planAtActivation) &&
            (identical(other.isTemporary, isTemporary) ||
                other.isTemporary == isTemporary) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.isFrozen, isFrozen) ||
                other.isFrozen == isFrozen) &&
            (identical(other.scanCount, scanCount) ||
                other.scanCount == scanCount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.lastScannedAt, lastScannedAt) ||
                other.lastScannedAt == lastScannedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    qrId,
    qrType,
    status,
    ownerId,
    moduleType,
    moduleProfileId,
    assignedAt,
    planAtActivation,
    isTemporary,
    expiresAt,
    isFrozen,
    scanCount,
    createdAt,
    updatedAt,
    lastScannedAt,
  );

  /// Create a copy of Qr
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QrImplCopyWith<_$QrImpl> get copyWith =>
      __$$QrImplCopyWithImpl<_$QrImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QrImplToJson(this);
  }
}

abstract class _Qr implements Qr {
  const factory _Qr({
    final String? id,
    final String? qrId,
    final String? qrType,
    final String? status,
    final OwnerId? ownerId,
    final String? moduleType,
    final String? moduleProfileId,
    final DateTime? assignedAt,
    final String? planAtActivation,
    final bool? isTemporary,
    final DateTime? expiresAt,
    final bool? isFrozen,
    final int? scanCount,
    final DateTime? createdAt,
    final DateTime? updatedAt,
    final DateTime? lastScannedAt,
  }) = _$QrImpl;

  factory _Qr.fromJson(Map<String, dynamic> json) = _$QrImpl.fromJson;

  @override
  String? get id;
  @override
  String? get qrId;
  @override
  String? get qrType;
  @override
  String? get status;
  @override
  OwnerId? get ownerId;
  @override
  String? get moduleType;
  @override
  String? get moduleProfileId;
  @override
  DateTime? get assignedAt;
  @override
  String? get planAtActivation;
  @override
  bool? get isTemporary;
  @override
  DateTime? get expiresAt;
  @override
  bool? get isFrozen;
  @override
  int? get scanCount;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  DateTime? get lastScannedAt;

  /// Create a copy of Qr
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QrImplCopyWith<_$QrImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OwnerId _$OwnerIdFromJson(Map<String, dynamic> json) {
  return _OwnerId.fromJson(json);
}

/// @nodoc
mixin _$OwnerId {
  String? get id => throw _privateConstructorUsedError;
  int? get userId => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get role => throw _privateConstructorUsedError;
  bool? get emailVerified => throw _privateConstructorUsedError;
  dynamic get avatarUrl => throw _privateConstructorUsedError;
  String? get lang => throw _privateConstructorUsedError;
  bool? get isActive => throw _privateConstructorUsedError;
  bool? get isExisting => throw _privateConstructorUsedError;
  bool? get twoFactorEnabled => throw _privateConstructorUsedError;
  List<dynamic>? get twoFactorBackupCodes => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  Address? get address => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;

  /// Serializes this OwnerId to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OwnerId
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OwnerIdCopyWith<OwnerId> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OwnerIdCopyWith<$Res> {
  factory $OwnerIdCopyWith(OwnerId value, $Res Function(OwnerId) then) =
      _$OwnerIdCopyWithImpl<$Res, OwnerId>;
  @useResult
  $Res call({
    String? id,
    int? userId,
    String? name,
    String? phone,
    String? role,
    bool? emailVerified,
    dynamic avatarUrl,
    String? lang,
    bool? isActive,
    bool? isExisting,
    bool? twoFactorEnabled,
    List<dynamic>? twoFactorBackupCodes,
    DateTime? createdAt,
    DateTime? updatedAt,
    Address? address,
    String? email,
  });

  $AddressCopyWith<$Res>? get address;
}

/// @nodoc
class _$OwnerIdCopyWithImpl<$Res, $Val extends OwnerId>
    implements $OwnerIdCopyWith<$Res> {
  _$OwnerIdCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OwnerId
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? name = freezed,
    Object? phone = freezed,
    Object? role = freezed,
    Object? emailVerified = freezed,
    Object? avatarUrl = freezed,
    Object? lang = freezed,
    Object? isActive = freezed,
    Object? isExisting = freezed,
    Object? twoFactorEnabled = freezed,
    Object? twoFactorBackupCodes = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? address = freezed,
    Object? email = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            userId: freezed == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as int?,
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
            phone: freezed == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String?,
            role: freezed == role
                ? _value.role
                : role // ignore: cast_nullable_to_non_nullable
                      as String?,
            emailVerified: freezed == emailVerified
                ? _value.emailVerified
                : emailVerified // ignore: cast_nullable_to_non_nullable
                      as bool?,
            avatarUrl: freezed == avatarUrl
                ? _value.avatarUrl
                : avatarUrl // ignore: cast_nullable_to_non_nullable
                      as dynamic,
            lang: freezed == lang
                ? _value.lang
                : lang // ignore: cast_nullable_to_non_nullable
                      as String?,
            isActive: freezed == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool?,
            isExisting: freezed == isExisting
                ? _value.isExisting
                : isExisting // ignore: cast_nullable_to_non_nullable
                      as bool?,
            twoFactorEnabled: freezed == twoFactorEnabled
                ? _value.twoFactorEnabled
                : twoFactorEnabled // ignore: cast_nullable_to_non_nullable
                      as bool?,
            twoFactorBackupCodes: freezed == twoFactorBackupCodes
                ? _value.twoFactorBackupCodes
                : twoFactorBackupCodes // ignore: cast_nullable_to_non_nullable
                      as List<dynamic>?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            address: freezed == address
                ? _value.address
                : address // ignore: cast_nullable_to_non_nullable
                      as Address?,
            email: freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of OwnerId
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res>? get address {
    if (_value.address == null) {
      return null;
    }

    return $AddressCopyWith<$Res>(_value.address!, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OwnerIdImplCopyWith<$Res> implements $OwnerIdCopyWith<$Res> {
  factory _$$OwnerIdImplCopyWith(
    _$OwnerIdImpl value,
    $Res Function(_$OwnerIdImpl) then,
  ) = __$$OwnerIdImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? id,
    int? userId,
    String? name,
    String? phone,
    String? role,
    bool? emailVerified,
    dynamic avatarUrl,
    String? lang,
    bool? isActive,
    bool? isExisting,
    bool? twoFactorEnabled,
    List<dynamic>? twoFactorBackupCodes,
    DateTime? createdAt,
    DateTime? updatedAt,
    Address? address,
    String? email,
  });

  @override
  $AddressCopyWith<$Res>? get address;
}

/// @nodoc
class __$$OwnerIdImplCopyWithImpl<$Res>
    extends _$OwnerIdCopyWithImpl<$Res, _$OwnerIdImpl>
    implements _$$OwnerIdImplCopyWith<$Res> {
  __$$OwnerIdImplCopyWithImpl(
    _$OwnerIdImpl _value,
    $Res Function(_$OwnerIdImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OwnerId
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? name = freezed,
    Object? phone = freezed,
    Object? role = freezed,
    Object? emailVerified = freezed,
    Object? avatarUrl = freezed,
    Object? lang = freezed,
    Object? isActive = freezed,
    Object? isExisting = freezed,
    Object? twoFactorEnabled = freezed,
    Object? twoFactorBackupCodes = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? address = freezed,
    Object? email = freezed,
  }) {
    return _then(
      _$OwnerIdImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        userId: freezed == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as int?,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        phone: freezed == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String?,
        role: freezed == role
            ? _value.role
            : role // ignore: cast_nullable_to_non_nullable
                  as String?,
        emailVerified: freezed == emailVerified
            ? _value.emailVerified
            : emailVerified // ignore: cast_nullable_to_non_nullable
                  as bool?,
        avatarUrl: freezed == avatarUrl
            ? _value.avatarUrl
            : avatarUrl // ignore: cast_nullable_to_non_nullable
                  as dynamic,
        lang: freezed == lang
            ? _value.lang
            : lang // ignore: cast_nullable_to_non_nullable
                  as String?,
        isActive: freezed == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool?,
        isExisting: freezed == isExisting
            ? _value.isExisting
            : isExisting // ignore: cast_nullable_to_non_nullable
                  as bool?,
        twoFactorEnabled: freezed == twoFactorEnabled
            ? _value.twoFactorEnabled
            : twoFactorEnabled // ignore: cast_nullable_to_non_nullable
                  as bool?,
        twoFactorBackupCodes: freezed == twoFactorBackupCodes
            ? _value._twoFactorBackupCodes
            : twoFactorBackupCodes // ignore: cast_nullable_to_non_nullable
                  as List<dynamic>?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        address: freezed == address
            ? _value.address
            : address // ignore: cast_nullable_to_non_nullable
                  as Address?,
        email: freezed == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OwnerIdImpl implements _OwnerId {
  const _$OwnerIdImpl({
    this.id,
    this.userId,
    this.name,
    this.phone,
    this.role,
    this.emailVerified,
    this.avatarUrl,
    this.lang,
    this.isActive,
    this.isExisting,
    this.twoFactorEnabled,
    final List<dynamic>? twoFactorBackupCodes,
    this.createdAt,
    this.updatedAt,
    this.address,
    this.email,
  }) : _twoFactorBackupCodes = twoFactorBackupCodes;

  factory _$OwnerIdImpl.fromJson(Map<String, dynamic> json) =>
      _$$OwnerIdImplFromJson(json);

  @override
  final String? id;
  @override
  final int? userId;
  @override
  final String? name;
  @override
  final String? phone;
  @override
  final String? role;
  @override
  final bool? emailVerified;
  @override
  final dynamic avatarUrl;
  @override
  final String? lang;
  @override
  final bool? isActive;
  @override
  final bool? isExisting;
  @override
  final bool? twoFactorEnabled;
  final List<dynamic>? _twoFactorBackupCodes;
  @override
  List<dynamic>? get twoFactorBackupCodes {
    final value = _twoFactorBackupCodes;
    if (value == null) return null;
    if (_twoFactorBackupCodes is EqualUnmodifiableListView)
      return _twoFactorBackupCodes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final Address? address;
  @override
  final String? email;

  @override
  String toString() {
    return 'OwnerId(id: $id, userId: $userId, name: $name, phone: $phone, role: $role, emailVerified: $emailVerified, avatarUrl: $avatarUrl, lang: $lang, isActive: $isActive, isExisting: $isExisting, twoFactorEnabled: $twoFactorEnabled, twoFactorBackupCodes: $twoFactorBackupCodes, createdAt: $createdAt, updatedAt: $updatedAt, address: $address, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OwnerIdImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.emailVerified, emailVerified) ||
                other.emailVerified == emailVerified) &&
            const DeepCollectionEquality().equals(other.avatarUrl, avatarUrl) &&
            (identical(other.lang, lang) || other.lang == lang) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.isExisting, isExisting) ||
                other.isExisting == isExisting) &&
            (identical(other.twoFactorEnabled, twoFactorEnabled) ||
                other.twoFactorEnabled == twoFactorEnabled) &&
            const DeepCollectionEquality().equals(
              other._twoFactorBackupCodes,
              _twoFactorBackupCodes,
            ) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    userId,
    name,
    phone,
    role,
    emailVerified,
    const DeepCollectionEquality().hash(avatarUrl),
    lang,
    isActive,
    isExisting,
    twoFactorEnabled,
    const DeepCollectionEquality().hash(_twoFactorBackupCodes),
    createdAt,
    updatedAt,
    address,
    email,
  );

  /// Create a copy of OwnerId
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OwnerIdImplCopyWith<_$OwnerIdImpl> get copyWith =>
      __$$OwnerIdImplCopyWithImpl<_$OwnerIdImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OwnerIdImplToJson(this);
  }
}

abstract class _OwnerId implements OwnerId {
  const factory _OwnerId({
    final String? id,
    final int? userId,
    final String? name,
    final String? phone,
    final String? role,
    final bool? emailVerified,
    final dynamic avatarUrl,
    final String? lang,
    final bool? isActive,
    final bool? isExisting,
    final bool? twoFactorEnabled,
    final List<dynamic>? twoFactorBackupCodes,
    final DateTime? createdAt,
    final DateTime? updatedAt,
    final Address? address,
    final String? email,
  }) = _$OwnerIdImpl;

  factory _OwnerId.fromJson(Map<String, dynamic> json) = _$OwnerIdImpl.fromJson;

  @override
  String? get id;
  @override
  int? get userId;
  @override
  String? get name;
  @override
  String? get phone;
  @override
  String? get role;
  @override
  bool? get emailVerified;
  @override
  dynamic get avatarUrl;
  @override
  String? get lang;
  @override
  bool? get isActive;
  @override
  bool? get isExisting;
  @override
  bool? get twoFactorEnabled;
  @override
  List<dynamic>? get twoFactorBackupCodes;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  Address? get address;
  @override
  String? get email;

  /// Create a copy of OwnerId
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OwnerIdImplCopyWith<_$OwnerIdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Address _$AddressFromJson(Map<String, dynamic> json) {
  return _Address.fromJson(json);
}

/// @nodoc
mixin _$Address {
  String? get fulladdress => throw _privateConstructorUsedError;
  String? get pincode => throw _privateConstructorUsedError;
  String? get landmark => throw _privateConstructorUsedError;
  String? get mapUrl => throw _privateConstructorUsedError;

  /// Serializes this Address to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Address
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddressCopyWith<Address> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressCopyWith<$Res> {
  factory $AddressCopyWith(Address value, $Res Function(Address) then) =
      _$AddressCopyWithImpl<$Res, Address>;
  @useResult
  $Res call({
    String? fulladdress,
    String? pincode,
    String? landmark,
    String? mapUrl,
  });
}

/// @nodoc
class _$AddressCopyWithImpl<$Res, $Val extends Address>
    implements $AddressCopyWith<$Res> {
  _$AddressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Address
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fulladdress = freezed,
    Object? pincode = freezed,
    Object? landmark = freezed,
    Object? mapUrl = freezed,
  }) {
    return _then(
      _value.copyWith(
            fulladdress: freezed == fulladdress
                ? _value.fulladdress
                : fulladdress // ignore: cast_nullable_to_non_nullable
                      as String?,
            pincode: freezed == pincode
                ? _value.pincode
                : pincode // ignore: cast_nullable_to_non_nullable
                      as String?,
            landmark: freezed == landmark
                ? _value.landmark
                : landmark // ignore: cast_nullable_to_non_nullable
                      as String?,
            mapUrl: freezed == mapUrl
                ? _value.mapUrl
                : mapUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AddressImplCopyWith<$Res> implements $AddressCopyWith<$Res> {
  factory _$$AddressImplCopyWith(
    _$AddressImpl value,
    $Res Function(_$AddressImpl) then,
  ) = __$$AddressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? fulladdress,
    String? pincode,
    String? landmark,
    String? mapUrl,
  });
}

/// @nodoc
class __$$AddressImplCopyWithImpl<$Res>
    extends _$AddressCopyWithImpl<$Res, _$AddressImpl>
    implements _$$AddressImplCopyWith<$Res> {
  __$$AddressImplCopyWithImpl(
    _$AddressImpl _value,
    $Res Function(_$AddressImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Address
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fulladdress = freezed,
    Object? pincode = freezed,
    Object? landmark = freezed,
    Object? mapUrl = freezed,
  }) {
    return _then(
      _$AddressImpl(
        fulladdress: freezed == fulladdress
            ? _value.fulladdress
            : fulladdress // ignore: cast_nullable_to_non_nullable
                  as String?,
        pincode: freezed == pincode
            ? _value.pincode
            : pincode // ignore: cast_nullable_to_non_nullable
                  as String?,
        landmark: freezed == landmark
            ? _value.landmark
            : landmark // ignore: cast_nullable_to_non_nullable
                  as String?,
        mapUrl: freezed == mapUrl
            ? _value.mapUrl
            : mapUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AddressImpl implements _Address {
  const _$AddressImpl({
    this.fulladdress,
    this.pincode,
    this.landmark,
    this.mapUrl,
  });

  factory _$AddressImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddressImplFromJson(json);

  @override
  final String? fulladdress;
  @override
  final String? pincode;
  @override
  final String? landmark;
  @override
  final String? mapUrl;

  @override
  String toString() {
    return 'Address(fulladdress: $fulladdress, pincode: $pincode, landmark: $landmark, mapUrl: $mapUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressImpl &&
            (identical(other.fulladdress, fulladdress) ||
                other.fulladdress == fulladdress) &&
            (identical(other.pincode, pincode) || other.pincode == pincode) &&
            (identical(other.landmark, landmark) ||
                other.landmark == landmark) &&
            (identical(other.mapUrl, mapUrl) || other.mapUrl == mapUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, fulladdress, pincode, landmark, mapUrl);

  /// Create a copy of Address
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressImplCopyWith<_$AddressImpl> get copyWith =>
      __$$AddressImplCopyWithImpl<_$AddressImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddressImplToJson(this);
  }
}

abstract class _Address implements Address {
  const factory _Address({
    final String? fulladdress,
    final String? pincode,
    final String? landmark,
    final String? mapUrl,
  }) = _$AddressImpl;

  factory _Address.fromJson(Map<String, dynamic> json) = _$AddressImpl.fromJson;

  @override
  String? get fulladdress;
  @override
  String? get pincode;
  @override
  String? get landmark;
  @override
  String? get mapUrl;

  /// Create a copy of Address
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddressImplCopyWith<_$AddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
