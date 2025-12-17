// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_history_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ChatHistoryResponseModel _$ChatHistoryResponseModelFromJson(
  Map<String, dynamic> json,
) {
  return _ChatHistoryResponseModel.fromJson(json);
}

/// @nodoc
mixin _$ChatHistoryResponseModel {
  String? get id => throw _privateConstructorUsedError;
  String? get roomId => throw _privateConstructorUsedError;
  String? get senderId => throw _privateConstructorUsedError;
  String? get senderType => throw _privateConstructorUsedError;
  String? get messageType => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  DateTime? get deliveredAt => throw _privateConstructorUsedError;
  SenderDetails? get senderDetails => throw _privateConstructorUsedError;

  /// Serializes this ChatHistoryResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatHistoryResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatHistoryResponseModelCopyWith<ChatHistoryResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatHistoryResponseModelCopyWith<$Res> {
  factory $ChatHistoryResponseModelCopyWith(
    ChatHistoryResponseModel value,
    $Res Function(ChatHistoryResponseModel) then,
  ) = _$ChatHistoryResponseModelCopyWithImpl<$Res, ChatHistoryResponseModel>;
  @useResult
  $Res call({
    String? id,
    String? roomId,
    String? senderId,
    String? senderType,
    String? messageType,
    String? content,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deliveredAt,
    SenderDetails? senderDetails,
  });

  $SenderDetailsCopyWith<$Res>? get senderDetails;
}

/// @nodoc
class _$ChatHistoryResponseModelCopyWithImpl<
  $Res,
  $Val extends ChatHistoryResponseModel
>
    implements $ChatHistoryResponseModelCopyWith<$Res> {
  _$ChatHistoryResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatHistoryResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? roomId = freezed,
    Object? senderId = freezed,
    Object? senderType = freezed,
    Object? messageType = freezed,
    Object? content = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deliveredAt = freezed,
    Object? senderDetails = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            roomId: freezed == roomId
                ? _value.roomId
                : roomId // ignore: cast_nullable_to_non_nullable
                      as String?,
            senderId: freezed == senderId
                ? _value.senderId
                : senderId // ignore: cast_nullable_to_non_nullable
                      as String?,
            senderType: freezed == senderType
                ? _value.senderType
                : senderType // ignore: cast_nullable_to_non_nullable
                      as String?,
            messageType: freezed == messageType
                ? _value.messageType
                : messageType // ignore: cast_nullable_to_non_nullable
                      as String?,
            content: freezed == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            deliveredAt: freezed == deliveredAt
                ? _value.deliveredAt
                : deliveredAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            senderDetails: freezed == senderDetails
                ? _value.senderDetails
                : senderDetails // ignore: cast_nullable_to_non_nullable
                      as SenderDetails?,
          )
          as $Val,
    );
  }

  /// Create a copy of ChatHistoryResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SenderDetailsCopyWith<$Res>? get senderDetails {
    if (_value.senderDetails == null) {
      return null;
    }

    return $SenderDetailsCopyWith<$Res>(_value.senderDetails!, (value) {
      return _then(_value.copyWith(senderDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChatHistoryResponseModelImplCopyWith<$Res>
    implements $ChatHistoryResponseModelCopyWith<$Res> {
  factory _$$ChatHistoryResponseModelImplCopyWith(
    _$ChatHistoryResponseModelImpl value,
    $Res Function(_$ChatHistoryResponseModelImpl) then,
  ) = __$$ChatHistoryResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? id,
    String? roomId,
    String? senderId,
    String? senderType,
    String? messageType,
    String? content,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deliveredAt,
    SenderDetails? senderDetails,
  });

  @override
  $SenderDetailsCopyWith<$Res>? get senderDetails;
}

/// @nodoc
class __$$ChatHistoryResponseModelImplCopyWithImpl<$Res>
    extends
        _$ChatHistoryResponseModelCopyWithImpl<
          $Res,
          _$ChatHistoryResponseModelImpl
        >
    implements _$$ChatHistoryResponseModelImplCopyWith<$Res> {
  __$$ChatHistoryResponseModelImplCopyWithImpl(
    _$ChatHistoryResponseModelImpl _value,
    $Res Function(_$ChatHistoryResponseModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatHistoryResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? roomId = freezed,
    Object? senderId = freezed,
    Object? senderType = freezed,
    Object? messageType = freezed,
    Object? content = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deliveredAt = freezed,
    Object? senderDetails = freezed,
  }) {
    return _then(
      _$ChatHistoryResponseModelImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        roomId: freezed == roomId
            ? _value.roomId
            : roomId // ignore: cast_nullable_to_non_nullable
                  as String?,
        senderId: freezed == senderId
            ? _value.senderId
            : senderId // ignore: cast_nullable_to_non_nullable
                  as String?,
        senderType: freezed == senderType
            ? _value.senderType
            : senderType // ignore: cast_nullable_to_non_nullable
                  as String?,
        messageType: freezed == messageType
            ? _value.messageType
            : messageType // ignore: cast_nullable_to_non_nullable
                  as String?,
        content: freezed == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        deliveredAt: freezed == deliveredAt
            ? _value.deliveredAt
            : deliveredAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        senderDetails: freezed == senderDetails
            ? _value.senderDetails
            : senderDetails // ignore: cast_nullable_to_non_nullable
                  as SenderDetails?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatHistoryResponseModelImpl implements _ChatHistoryResponseModel {
  const _$ChatHistoryResponseModelImpl({
    this.id,
    this.roomId,
    this.senderId,
    this.senderType,
    this.messageType,
    this.content,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.deliveredAt,
    this.senderDetails,
  });

  factory _$ChatHistoryResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatHistoryResponseModelImplFromJson(json);

  @override
  final String? id;
  @override
  final String? roomId;
  @override
  final String? senderId;
  @override
  final String? senderType;
  @override
  final String? messageType;
  @override
  final String? content;
  @override
  final String? status;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final DateTime? deliveredAt;
  @override
  final SenderDetails? senderDetails;

  @override
  String toString() {
    return 'ChatHistoryResponseModel(id: $id, roomId: $roomId, senderId: $senderId, senderType: $senderType, messageType: $messageType, content: $content, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, deliveredAt: $deliveredAt, senderDetails: $senderDetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatHistoryResponseModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.senderType, senderType) ||
                other.senderType == senderType) &&
            (identical(other.messageType, messageType) ||
                other.messageType == messageType) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deliveredAt, deliveredAt) ||
                other.deliveredAt == deliveredAt) &&
            (identical(other.senderDetails, senderDetails) ||
                other.senderDetails == senderDetails));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    roomId,
    senderId,
    senderType,
    messageType,
    content,
    status,
    createdAt,
    updatedAt,
    deliveredAt,
    senderDetails,
  );

  /// Create a copy of ChatHistoryResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatHistoryResponseModelImplCopyWith<_$ChatHistoryResponseModelImpl>
  get copyWith =>
      __$$ChatHistoryResponseModelImplCopyWithImpl<
        _$ChatHistoryResponseModelImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatHistoryResponseModelImplToJson(this);
  }
}

abstract class _ChatHistoryResponseModel implements ChatHistoryResponseModel {
  const factory _ChatHistoryResponseModel({
    final String? id,
    final String? roomId,
    final String? senderId,
    final String? senderType,
    final String? messageType,
    final String? content,
    final String? status,
    final DateTime? createdAt,
    final DateTime? updatedAt,
    final DateTime? deliveredAt,
    final SenderDetails? senderDetails,
  }) = _$ChatHistoryResponseModelImpl;

  factory _ChatHistoryResponseModel.fromJson(Map<String, dynamic> json) =
      _$ChatHistoryResponseModelImpl.fromJson;

  @override
  String? get id;
  @override
  String? get roomId;
  @override
  String? get senderId;
  @override
  String? get senderType;
  @override
  String? get messageType;
  @override
  String? get content;
  @override
  String? get status;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  DateTime? get deliveredAt;
  @override
  SenderDetails? get senderDetails;

  /// Create a copy of ChatHistoryResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatHistoryResponseModelImplCopyWith<_$ChatHistoryResponseModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}

SenderDetails _$SenderDetailsFromJson(Map<String, dynamic> json) {
  return _SenderDetails.fromJson(json);
}

/// @nodoc
mixin _$SenderDetails {
  String? get name => throw _privateConstructorUsedError;
  String? get photo => throw _privateConstructorUsedError;

  /// Serializes this SenderDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SenderDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SenderDetailsCopyWith<SenderDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SenderDetailsCopyWith<$Res> {
  factory $SenderDetailsCopyWith(
    SenderDetails value,
    $Res Function(SenderDetails) then,
  ) = _$SenderDetailsCopyWithImpl<$Res, SenderDetails>;
  @useResult
  $Res call({String? name, String? photo});
}

/// @nodoc
class _$SenderDetailsCopyWithImpl<$Res, $Val extends SenderDetails>
    implements $SenderDetailsCopyWith<$Res> {
  _$SenderDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SenderDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = freezed, Object? photo = freezed}) {
    return _then(
      _value.copyWith(
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
            photo: freezed == photo
                ? _value.photo
                : photo // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SenderDetailsImplCopyWith<$Res>
    implements $SenderDetailsCopyWith<$Res> {
  factory _$$SenderDetailsImplCopyWith(
    _$SenderDetailsImpl value,
    $Res Function(_$SenderDetailsImpl) then,
  ) = __$$SenderDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, String? photo});
}

/// @nodoc
class __$$SenderDetailsImplCopyWithImpl<$Res>
    extends _$SenderDetailsCopyWithImpl<$Res, _$SenderDetailsImpl>
    implements _$$SenderDetailsImplCopyWith<$Res> {
  __$$SenderDetailsImplCopyWithImpl(
    _$SenderDetailsImpl _value,
    $Res Function(_$SenderDetailsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SenderDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = freezed, Object? photo = freezed}) {
    return _then(
      _$SenderDetailsImpl(
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        photo: freezed == photo
            ? _value.photo
            : photo // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SenderDetailsImpl implements _SenderDetails {
  const _$SenderDetailsImpl({this.name, this.photo});

  factory _$SenderDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$SenderDetailsImplFromJson(json);

  @override
  final String? name;
  @override
  final String? photo;

  @override
  String toString() {
    return 'SenderDetails(name: $name, photo: $photo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SenderDetailsImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.photo, photo) || other.photo == photo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, photo);

  /// Create a copy of SenderDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SenderDetailsImplCopyWith<_$SenderDetailsImpl> get copyWith =>
      __$$SenderDetailsImplCopyWithImpl<_$SenderDetailsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SenderDetailsImplToJson(this);
  }
}

abstract class _SenderDetails implements SenderDetails {
  const factory _SenderDetails({final String? name, final String? photo}) =
      _$SenderDetailsImpl;

  factory _SenderDetails.fromJson(Map<String, dynamic> json) =
      _$SenderDetailsImpl.fromJson;

  @override
  String? get name;
  @override
  String? get photo;

  /// Create a copy of SenderDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SenderDetailsImplCopyWith<_$SenderDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
