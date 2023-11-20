// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppUser _$AppUserFromJson(Map<String, dynamic> json) {
  return _AppUser.fromJson(json);
}

/// @nodoc
mixin _$AppUser {
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  set email(String value) => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp get userCreationTime => throw _privateConstructorUsedError;
  @TimestampConverter()
  set userCreationTime(Timestamp value) => throw _privateConstructorUsedError;
  AddressModel? get userAddress => throw _privateConstructorUsedError;
  set userAddress(AddressModel? value) => throw _privateConstructorUsedError;
  String? get displayName => throw _privateConstructorUsedError;
  set displayName(String? value) => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  set phoneNumber(String? value) => throw _privateConstructorUsedError;
  String? get photoUrl => throw _privateConstructorUsedError;
  set photoUrl(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppUserCopyWith<AppUser> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppUserCopyWith<$Res> {
  factory $AppUserCopyWith(AppUser value, $Res Function(AppUser) then) =
      _$AppUserCopyWithImpl<$Res, AppUser>;
  @useResult
  $Res call(
      {String id,
      String email,
      @TimestampConverter() Timestamp userCreationTime,
      AddressModel? userAddress,
      String? displayName,
      String? phoneNumber,
      String? photoUrl});

  $AddressModelCopyWith<$Res>? get userAddress;
}

/// @nodoc
class _$AppUserCopyWithImpl<$Res, $Val extends AppUser>
    implements $AppUserCopyWith<$Res> {
  _$AppUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? userCreationTime = null,
    Object? userAddress = freezed,
    Object? displayName = freezed,
    Object? phoneNumber = freezed,
    Object? photoUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      userCreationTime: null == userCreationTime
          ? _value.userCreationTime
          : userCreationTime // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      userAddress: freezed == userAddress
          ? _value.userAddress
          : userAddress // ignore: cast_nullable_to_non_nullable
              as AddressModel?,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AddressModelCopyWith<$Res>? get userAddress {
    if (_value.userAddress == null) {
      return null;
    }

    return $AddressModelCopyWith<$Res>(_value.userAddress!, (value) {
      return _then(_value.copyWith(userAddress: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AppUserImplCopyWith<$Res> implements $AppUserCopyWith<$Res> {
  factory _$$AppUserImplCopyWith(
          _$AppUserImpl value, $Res Function(_$AppUserImpl) then) =
      __$$AppUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String email,
      @TimestampConverter() Timestamp userCreationTime,
      AddressModel? userAddress,
      String? displayName,
      String? phoneNumber,
      String? photoUrl});

  @override
  $AddressModelCopyWith<$Res>? get userAddress;
}

/// @nodoc
class __$$AppUserImplCopyWithImpl<$Res>
    extends _$AppUserCopyWithImpl<$Res, _$AppUserImpl>
    implements _$$AppUserImplCopyWith<$Res> {
  __$$AppUserImplCopyWithImpl(
      _$AppUserImpl _value, $Res Function(_$AppUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? userCreationTime = null,
    Object? userAddress = freezed,
    Object? displayName = freezed,
    Object? phoneNumber = freezed,
    Object? photoUrl = freezed,
  }) {
    return _then(_$AppUserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      userCreationTime: null == userCreationTime
          ? _value.userCreationTime
          : userCreationTime // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      userAddress: freezed == userAddress
          ? _value.userAddress
          : userAddress // ignore: cast_nullable_to_non_nullable
              as AddressModel?,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$AppUserImpl implements _AppUser {
  _$AppUserImpl(
      {required this.id,
      required this.email,
      @TimestampConverter() required this.userCreationTime,
      this.userAddress,
      this.displayName,
      this.phoneNumber,
      this.photoUrl});

  factory _$AppUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppUserImplFromJson(json);

  @override
  String id;
  @override
  String email;
  @override
  @TimestampConverter()
  Timestamp userCreationTime;
  @override
  AddressModel? userAddress;
  @override
  String? displayName;
  @override
  String? phoneNumber;
  @override
  String? photoUrl;

  @override
  String toString() {
    return 'AppUser(id: $id, email: $email, userCreationTime: $userCreationTime, userAddress: $userAddress, displayName: $displayName, phoneNumber: $phoneNumber, photoUrl: $photoUrl)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppUserImplCopyWith<_$AppUserImpl> get copyWith =>
      __$$AppUserImplCopyWithImpl<_$AppUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppUserImplToJson(
      this,
    );
  }
}

abstract class _AppUser implements AppUser {
  factory _AppUser(
      {required String id,
      required String email,
      @TimestampConverter() required Timestamp userCreationTime,
      AddressModel? userAddress,
      String? displayName,
      String? phoneNumber,
      String? photoUrl}) = _$AppUserImpl;

  factory _AppUser.fromJson(Map<String, dynamic> json) = _$AppUserImpl.fromJson;

  @override
  String get id;
  set id(String value);
  @override
  String get email;
  set email(String value);
  @override
  @TimestampConverter()
  Timestamp get userCreationTime;
  @TimestampConverter()
  set userCreationTime(Timestamp value);
  @override
  AddressModel? get userAddress;
  set userAddress(AddressModel? value);
  @override
  String? get displayName;
  set displayName(String? value);
  @override
  String? get phoneNumber;
  set phoneNumber(String? value);
  @override
  String? get photoUrl;
  set photoUrl(String? value);
  @override
  @JsonKey(ignore: true)
  _$$AppUserImplCopyWith<_$AppUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
