// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qr_scan_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

QrScanResponseModel _$QrScanResponseModelFromJson(Map<String, dynamic> json) {
  return _QrScanResponseModel.fromJson(json);
}

/// @nodoc
mixin _$QrScanResponseModel {
  ChatRoomModel? get chatRoom => throw _privateConstructorUsedError;
  VisitModel? get visit => throw _privateConstructorUsedError;

  /// Serializes this QrScanResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QrScanResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QrScanResponseModelCopyWith<QrScanResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QrScanResponseModelCopyWith<$Res> {
  factory $QrScanResponseModelCopyWith(
    QrScanResponseModel value,
    $Res Function(QrScanResponseModel) then,
  ) = _$QrScanResponseModelCopyWithImpl<$Res, QrScanResponseModel>;
  @useResult
  $Res call({ChatRoomModel? chatRoom, VisitModel? visit});

  $ChatRoomModelCopyWith<$Res>? get chatRoom;
  $VisitModelCopyWith<$Res>? get visit;
}

/// @nodoc
class _$QrScanResponseModelCopyWithImpl<$Res, $Val extends QrScanResponseModel>
    implements $QrScanResponseModelCopyWith<$Res> {
  _$QrScanResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QrScanResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? chatRoom = freezed, Object? visit = freezed}) {
    return _then(
      _value.copyWith(
            chatRoom: freezed == chatRoom
                ? _value.chatRoom
                : chatRoom // ignore: cast_nullable_to_non_nullable
                      as ChatRoomModel?,
            visit: freezed == visit
                ? _value.visit
                : visit // ignore: cast_nullable_to_non_nullable
                      as VisitModel?,
          )
          as $Val,
    );
  }

  /// Create a copy of QrScanResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChatRoomModelCopyWith<$Res>? get chatRoom {
    if (_value.chatRoom == null) {
      return null;
    }

    return $ChatRoomModelCopyWith<$Res>(_value.chatRoom!, (value) {
      return _then(_value.copyWith(chatRoom: value) as $Val);
    });
  }

  /// Create a copy of QrScanResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VisitModelCopyWith<$Res>? get visit {
    if (_value.visit == null) {
      return null;
    }

    return $VisitModelCopyWith<$Res>(_value.visit!, (value) {
      return _then(_value.copyWith(visit: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$QrScanResponseModelImplCopyWith<$Res>
    implements $QrScanResponseModelCopyWith<$Res> {
  factory _$$QrScanResponseModelImplCopyWith(
    _$QrScanResponseModelImpl value,
    $Res Function(_$QrScanResponseModelImpl) then,
  ) = __$$QrScanResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ChatRoomModel? chatRoom, VisitModel? visit});

  @override
  $ChatRoomModelCopyWith<$Res>? get chatRoom;
  @override
  $VisitModelCopyWith<$Res>? get visit;
}

/// @nodoc
class __$$QrScanResponseModelImplCopyWithImpl<$Res>
    extends _$QrScanResponseModelCopyWithImpl<$Res, _$QrScanResponseModelImpl>
    implements _$$QrScanResponseModelImplCopyWith<$Res> {
  __$$QrScanResponseModelImplCopyWithImpl(
    _$QrScanResponseModelImpl _value,
    $Res Function(_$QrScanResponseModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of QrScanResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? chatRoom = freezed, Object? visit = freezed}) {
    return _then(
      _$QrScanResponseModelImpl(
        chatRoom: freezed == chatRoom
            ? _value.chatRoom
            : chatRoom // ignore: cast_nullable_to_non_nullable
                  as ChatRoomModel?,
        visit: freezed == visit
            ? _value.visit
            : visit // ignore: cast_nullable_to_non_nullable
                  as VisitModel?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$QrScanResponseModelImpl implements _QrScanResponseModel {
  const _$QrScanResponseModelImpl({this.chatRoom, this.visit});

  factory _$QrScanResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$QrScanResponseModelImplFromJson(json);

  @override
  final ChatRoomModel? chatRoom;
  @override
  final VisitModel? visit;

  @override
  String toString() {
    return 'QrScanResponseModel(chatRoom: $chatRoom, visit: $visit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QrScanResponseModelImpl &&
            (identical(other.chatRoom, chatRoom) ||
                other.chatRoom == chatRoom) &&
            (identical(other.visit, visit) || other.visit == visit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, chatRoom, visit);

  /// Create a copy of QrScanResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QrScanResponseModelImplCopyWith<_$QrScanResponseModelImpl> get copyWith =>
      __$$QrScanResponseModelImplCopyWithImpl<_$QrScanResponseModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$QrScanResponseModelImplToJson(this);
  }
}

abstract class _QrScanResponseModel implements QrScanResponseModel {
  const factory _QrScanResponseModel({
    final ChatRoomModel? chatRoom,
    final VisitModel? visit,
  }) = _$QrScanResponseModelImpl;

  factory _QrScanResponseModel.fromJson(Map<String, dynamic> json) =
      _$QrScanResponseModelImpl.fromJson;

  @override
  ChatRoomModel? get chatRoom;
  @override
  VisitModel? get visit;

  /// Create a copy of QrScanResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QrScanResponseModelImplCopyWith<_$QrScanResponseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChatRoomModel _$ChatRoomModelFromJson(Map<String, dynamic> json) {
  return _ChatRoomModel.fromJson(json);
}

/// @nodoc
mixin _$ChatRoomModel {
  String? get qrId => throw _privateConstructorUsedError;
  String? get moduleType => throw _privateConstructorUsedError;
  String? get moduleProfileId => throw _privateConstructorUsedError;
  String? get eventId => throw _privateConstructorUsedError;
  String? get scannerId => throw _privateConstructorUsedError;
  String? get scannerType => throw _privateConstructorUsedError;
  String? get ownerId => throw _privateConstructorUsedError;
  String? get activeParticipantId => throw _privateConstructorUsedError;
  String? get activeParticipantType => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this ChatRoomModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatRoomModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatRoomModelCopyWith<ChatRoomModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatRoomModelCopyWith<$Res> {
  factory $ChatRoomModelCopyWith(
    ChatRoomModel value,
    $Res Function(ChatRoomModel) then,
  ) = _$ChatRoomModelCopyWithImpl<$Res, ChatRoomModel>;
  @useResult
  $Res call({
    String? qrId,
    String? moduleType,
    String? moduleProfileId,
    String? eventId,
    String? scannerId,
    String? scannerType,
    String? ownerId,
    String? activeParticipantId,
    String? activeParticipantType,
    String? status,
    @JsonKey(name: '_id') String? id,
    String? createdAt,
    String? updatedAt,
  });
}

/// @nodoc
class _$ChatRoomModelCopyWithImpl<$Res, $Val extends ChatRoomModel>
    implements $ChatRoomModelCopyWith<$Res> {
  _$ChatRoomModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatRoomModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? qrId = freezed,
    Object? moduleType = freezed,
    Object? moduleProfileId = freezed,
    Object? eventId = freezed,
    Object? scannerId = freezed,
    Object? scannerType = freezed,
    Object? ownerId = freezed,
    Object? activeParticipantId = freezed,
    Object? activeParticipantType = freezed,
    Object? status = freezed,
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            qrId: freezed == qrId
                ? _value.qrId
                : qrId // ignore: cast_nullable_to_non_nullable
                      as String?,
            moduleType: freezed == moduleType
                ? _value.moduleType
                : moduleType // ignore: cast_nullable_to_non_nullable
                      as String?,
            moduleProfileId: freezed == moduleProfileId
                ? _value.moduleProfileId
                : moduleProfileId // ignore: cast_nullable_to_non_nullable
                      as String?,
            eventId: freezed == eventId
                ? _value.eventId
                : eventId // ignore: cast_nullable_to_non_nullable
                      as String?,
            scannerId: freezed == scannerId
                ? _value.scannerId
                : scannerId // ignore: cast_nullable_to_non_nullable
                      as String?,
            scannerType: freezed == scannerType
                ? _value.scannerType
                : scannerType // ignore: cast_nullable_to_non_nullable
                      as String?,
            ownerId: freezed == ownerId
                ? _value.ownerId
                : ownerId // ignore: cast_nullable_to_non_nullable
                      as String?,
            activeParticipantId: freezed == activeParticipantId
                ? _value.activeParticipantId
                : activeParticipantId // ignore: cast_nullable_to_non_nullable
                      as String?,
            activeParticipantType: freezed == activeParticipantType
                ? _value.activeParticipantType
                : activeParticipantType // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String?,
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ChatRoomModelImplCopyWith<$Res>
    implements $ChatRoomModelCopyWith<$Res> {
  factory _$$ChatRoomModelImplCopyWith(
    _$ChatRoomModelImpl value,
    $Res Function(_$ChatRoomModelImpl) then,
  ) = __$$ChatRoomModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? qrId,
    String? moduleType,
    String? moduleProfileId,
    String? eventId,
    String? scannerId,
    String? scannerType,
    String? ownerId,
    String? activeParticipantId,
    String? activeParticipantType,
    String? status,
    @JsonKey(name: '_id') String? id,
    String? createdAt,
    String? updatedAt,
  });
}

/// @nodoc
class __$$ChatRoomModelImplCopyWithImpl<$Res>
    extends _$ChatRoomModelCopyWithImpl<$Res, _$ChatRoomModelImpl>
    implements _$$ChatRoomModelImplCopyWith<$Res> {
  __$$ChatRoomModelImplCopyWithImpl(
    _$ChatRoomModelImpl _value,
    $Res Function(_$ChatRoomModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatRoomModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? qrId = freezed,
    Object? moduleType = freezed,
    Object? moduleProfileId = freezed,
    Object? eventId = freezed,
    Object? scannerId = freezed,
    Object? scannerType = freezed,
    Object? ownerId = freezed,
    Object? activeParticipantId = freezed,
    Object? activeParticipantType = freezed,
    Object? status = freezed,
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$ChatRoomModelImpl(
        qrId: freezed == qrId
            ? _value.qrId
            : qrId // ignore: cast_nullable_to_non_nullable
                  as String?,
        moduleType: freezed == moduleType
            ? _value.moduleType
            : moduleType // ignore: cast_nullable_to_non_nullable
                  as String?,
        moduleProfileId: freezed == moduleProfileId
            ? _value.moduleProfileId
            : moduleProfileId // ignore: cast_nullable_to_non_nullable
                  as String?,
        eventId: freezed == eventId
            ? _value.eventId
            : eventId // ignore: cast_nullable_to_non_nullable
                  as String?,
        scannerId: freezed == scannerId
            ? _value.scannerId
            : scannerId // ignore: cast_nullable_to_non_nullable
                  as String?,
        scannerType: freezed == scannerType
            ? _value.scannerType
            : scannerType // ignore: cast_nullable_to_non_nullable
                  as String?,
        ownerId: freezed == ownerId
            ? _value.ownerId
            : ownerId // ignore: cast_nullable_to_non_nullable
                  as String?,
        activeParticipantId: freezed == activeParticipantId
            ? _value.activeParticipantId
            : activeParticipantId // ignore: cast_nullable_to_non_nullable
                  as String?,
        activeParticipantType: freezed == activeParticipantType
            ? _value.activeParticipantType
            : activeParticipantType // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatRoomModelImpl implements _ChatRoomModel {
  const _$ChatRoomModelImpl({
    this.qrId,
    this.moduleType,
    this.moduleProfileId,
    this.eventId,
    this.scannerId,
    this.scannerType,
    this.ownerId,
    this.activeParticipantId,
    this.activeParticipantType,
    this.status,
    @JsonKey(name: '_id') this.id,
    this.createdAt,
    this.updatedAt,
  });

  factory _$ChatRoomModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatRoomModelImplFromJson(json);

  @override
  final String? qrId;
  @override
  final String? moduleType;
  @override
  final String? moduleProfileId;
  @override
  final String? eventId;
  @override
  final String? scannerId;
  @override
  final String? scannerType;
  @override
  final String? ownerId;
  @override
  final String? activeParticipantId;
  @override
  final String? activeParticipantType;
  @override
  final String? status;
  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;

  @override
  String toString() {
    return 'ChatRoomModel(qrId: $qrId, moduleType: $moduleType, moduleProfileId: $moduleProfileId, eventId: $eventId, scannerId: $scannerId, scannerType: $scannerType, ownerId: $ownerId, activeParticipantId: $activeParticipantId, activeParticipantType: $activeParticipantType, status: $status, id: $id, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatRoomModelImpl &&
            (identical(other.qrId, qrId) || other.qrId == qrId) &&
            (identical(other.moduleType, moduleType) ||
                other.moduleType == moduleType) &&
            (identical(other.moduleProfileId, moduleProfileId) ||
                other.moduleProfileId == moduleProfileId) &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.scannerId, scannerId) ||
                other.scannerId == scannerId) &&
            (identical(other.scannerType, scannerType) ||
                other.scannerType == scannerType) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.activeParticipantId, activeParticipantId) ||
                other.activeParticipantId == activeParticipantId) &&
            (identical(other.activeParticipantType, activeParticipantType) ||
                other.activeParticipantType == activeParticipantType) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    qrId,
    moduleType,
    moduleProfileId,
    eventId,
    scannerId,
    scannerType,
    ownerId,
    activeParticipantId,
    activeParticipantType,
    status,
    id,
    createdAt,
    updatedAt,
  );

  /// Create a copy of ChatRoomModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatRoomModelImplCopyWith<_$ChatRoomModelImpl> get copyWith =>
      __$$ChatRoomModelImplCopyWithImpl<_$ChatRoomModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatRoomModelImplToJson(this);
  }
}

abstract class _ChatRoomModel implements ChatRoomModel {
  const factory _ChatRoomModel({
    final String? qrId,
    final String? moduleType,
    final String? moduleProfileId,
    final String? eventId,
    final String? scannerId,
    final String? scannerType,
    final String? ownerId,
    final String? activeParticipantId,
    final String? activeParticipantType,
    final String? status,
    @JsonKey(name: '_id') final String? id,
    final String? createdAt,
    final String? updatedAt,
  }) = _$ChatRoomModelImpl;

  factory _ChatRoomModel.fromJson(Map<String, dynamic> json) =
      _$ChatRoomModelImpl.fromJson;

  @override
  String? get qrId;
  @override
  String? get moduleType;
  @override
  String? get moduleProfileId;
  @override
  String? get eventId;
  @override
  String? get scannerId;
  @override
  String? get scannerType;
  @override
  String? get ownerId;
  @override
  String? get activeParticipantId;
  @override
  String? get activeParticipantType;
  @override
  String? get status;
  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;

  /// Create a copy of ChatRoomModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatRoomModelImplCopyWith<_$ChatRoomModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VisitModel _$VisitModelFromJson(Map<String, dynamic> json) {
  return _VisitModel.fromJson(json);
}

/// @nodoc
mixin _$VisitModel {
  String? get qrId => throw _privateConstructorUsedError;
  String? get houseId => throw _privateConstructorUsedError;
  String? get ownerId => throw _privateConstructorUsedError;
  String? get scannerId => throw _privateConstructorUsedError;
  String? get scannerType => throw _privateConstructorUsedError;
  String? get purpose => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this VisitModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VisitModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VisitModelCopyWith<VisitModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VisitModelCopyWith<$Res> {
  factory $VisitModelCopyWith(
    VisitModel value,
    $Res Function(VisitModel) then,
  ) = _$VisitModelCopyWithImpl<$Res, VisitModel>;
  @useResult
  $Res call({
    String? qrId,
    String? houseId,
    String? ownerId,
    String? scannerId,
    String? scannerType,
    String? purpose,
    String? note,
    String? status,
    @JsonKey(name: '_id') String? id,
    String? createdAt,
    String? updatedAt,
  });
}

/// @nodoc
class _$VisitModelCopyWithImpl<$Res, $Val extends VisitModel>
    implements $VisitModelCopyWith<$Res> {
  _$VisitModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VisitModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? qrId = freezed,
    Object? houseId = freezed,
    Object? ownerId = freezed,
    Object? scannerId = freezed,
    Object? scannerType = freezed,
    Object? purpose = freezed,
    Object? note = freezed,
    Object? status = freezed,
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            qrId: freezed == qrId
                ? _value.qrId
                : qrId // ignore: cast_nullable_to_non_nullable
                      as String?,
            houseId: freezed == houseId
                ? _value.houseId
                : houseId // ignore: cast_nullable_to_non_nullable
                      as String?,
            ownerId: freezed == ownerId
                ? _value.ownerId
                : ownerId // ignore: cast_nullable_to_non_nullable
                      as String?,
            scannerId: freezed == scannerId
                ? _value.scannerId
                : scannerId // ignore: cast_nullable_to_non_nullable
                      as String?,
            scannerType: freezed == scannerType
                ? _value.scannerType
                : scannerType // ignore: cast_nullable_to_non_nullable
                      as String?,
            purpose: freezed == purpose
                ? _value.purpose
                : purpose // ignore: cast_nullable_to_non_nullable
                      as String?,
            note: freezed == note
                ? _value.note
                : note // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String?,
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$VisitModelImplCopyWith<$Res>
    implements $VisitModelCopyWith<$Res> {
  factory _$$VisitModelImplCopyWith(
    _$VisitModelImpl value,
    $Res Function(_$VisitModelImpl) then,
  ) = __$$VisitModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? qrId,
    String? houseId,
    String? ownerId,
    String? scannerId,
    String? scannerType,
    String? purpose,
    String? note,
    String? status,
    @JsonKey(name: '_id') String? id,
    String? createdAt,
    String? updatedAt,
  });
}

/// @nodoc
class __$$VisitModelImplCopyWithImpl<$Res>
    extends _$VisitModelCopyWithImpl<$Res, _$VisitModelImpl>
    implements _$$VisitModelImplCopyWith<$Res> {
  __$$VisitModelImplCopyWithImpl(
    _$VisitModelImpl _value,
    $Res Function(_$VisitModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VisitModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? qrId = freezed,
    Object? houseId = freezed,
    Object? ownerId = freezed,
    Object? scannerId = freezed,
    Object? scannerType = freezed,
    Object? purpose = freezed,
    Object? note = freezed,
    Object? status = freezed,
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$VisitModelImpl(
        qrId: freezed == qrId
            ? _value.qrId
            : qrId // ignore: cast_nullable_to_non_nullable
                  as String?,
        houseId: freezed == houseId
            ? _value.houseId
            : houseId // ignore: cast_nullable_to_non_nullable
                  as String?,
        ownerId: freezed == ownerId
            ? _value.ownerId
            : ownerId // ignore: cast_nullable_to_non_nullable
                  as String?,
        scannerId: freezed == scannerId
            ? _value.scannerId
            : scannerId // ignore: cast_nullable_to_non_nullable
                  as String?,
        scannerType: freezed == scannerType
            ? _value.scannerType
            : scannerType // ignore: cast_nullable_to_non_nullable
                  as String?,
        purpose: freezed == purpose
            ? _value.purpose
            : purpose // ignore: cast_nullable_to_non_nullable
                  as String?,
        note: freezed == note
            ? _value.note
            : note // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$VisitModelImpl implements _VisitModel {
  const _$VisitModelImpl({
    this.qrId,
    this.houseId,
    this.ownerId,
    this.scannerId,
    this.scannerType,
    this.purpose,
    this.note,
    this.status,
    @JsonKey(name: '_id') this.id,
    this.createdAt,
    this.updatedAt,
  });

  factory _$VisitModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VisitModelImplFromJson(json);

  @override
  final String? qrId;
  @override
  final String? houseId;
  @override
  final String? ownerId;
  @override
  final String? scannerId;
  @override
  final String? scannerType;
  @override
  final String? purpose;
  @override
  final String? note;
  @override
  final String? status;
  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;

  @override
  String toString() {
    return 'VisitModel(qrId: $qrId, houseId: $houseId, ownerId: $ownerId, scannerId: $scannerId, scannerType: $scannerType, purpose: $purpose, note: $note, status: $status, id: $id, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VisitModelImpl &&
            (identical(other.qrId, qrId) || other.qrId == qrId) &&
            (identical(other.houseId, houseId) || other.houseId == houseId) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.scannerId, scannerId) ||
                other.scannerId == scannerId) &&
            (identical(other.scannerType, scannerType) ||
                other.scannerType == scannerType) &&
            (identical(other.purpose, purpose) || other.purpose == purpose) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    qrId,
    houseId,
    ownerId,
    scannerId,
    scannerType,
    purpose,
    note,
    status,
    id,
    createdAt,
    updatedAt,
  );

  /// Create a copy of VisitModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VisitModelImplCopyWith<_$VisitModelImpl> get copyWith =>
      __$$VisitModelImplCopyWithImpl<_$VisitModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VisitModelImplToJson(this);
  }
}

abstract class _VisitModel implements VisitModel {
  const factory _VisitModel({
    final String? qrId,
    final String? houseId,
    final String? ownerId,
    final String? scannerId,
    final String? scannerType,
    final String? purpose,
    final String? note,
    final String? status,
    @JsonKey(name: '_id') final String? id,
    final String? createdAt,
    final String? updatedAt,
  }) = _$VisitModelImpl;

  factory _VisitModel.fromJson(Map<String, dynamic> json) =
      _$VisitModelImpl.fromJson;

  @override
  String? get qrId;
  @override
  String? get houseId;
  @override
  String? get ownerId;
  @override
  String? get scannerId;
  @override
  String? get scannerType;
  @override
  String? get purpose;
  @override
  String? get note;
  @override
  String? get status;
  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;

  /// Create a copy of VisitModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VisitModelImplCopyWith<_$VisitModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
