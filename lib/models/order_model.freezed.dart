// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) {
  return _OrderModel.fromJson(json);
}

/// @nodoc
mixin _$OrderModel {
  String get orderId => throw _privateConstructorUsedError;
  set orderId(String value) => throw _privateConstructorUsedError;
  AppUser get appUser => throw _privateConstructorUsedError;
  set appUser(AppUser value) => throw _privateConstructorUsedError;
  num get totalAmount => throw _privateConstructorUsedError;
  set totalAmount(num value) => throw _privateConstructorUsedError;
  String get orderStatus => throw _privateConstructorUsedError;
  set orderStatus(String value) => throw _privateConstructorUsedError;
  List<CartModel> get orderDetails => throw _privateConstructorUsedError;
  set orderDetails(List<CartModel> value) => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp get orderDateTime => throw _privateConstructorUsedError;
  @TimestampConverter()
  set orderDateTime(Timestamp value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderModelCopyWith<OrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderModelCopyWith<$Res> {
  factory $OrderModelCopyWith(
          OrderModel value, $Res Function(OrderModel) then) =
      _$OrderModelCopyWithImpl<$Res, OrderModel>;
  @useResult
  $Res call(
      {String orderId,
      AppUser appUser,
      num totalAmount,
      String orderStatus,
      List<CartModel> orderDetails,
      @TimestampConverter() Timestamp orderDateTime});

  $AppUserCopyWith<$Res> get appUser;
}

/// @nodoc
class _$OrderModelCopyWithImpl<$Res, $Val extends OrderModel>
    implements $OrderModelCopyWith<$Res> {
  _$OrderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? appUser = null,
    Object? totalAmount = null,
    Object? orderStatus = null,
    Object? orderDetails = null,
    Object? orderDateTime = null,
  }) {
    return _then(_value.copyWith(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      appUser: null == appUser
          ? _value.appUser
          : appUser // ignore: cast_nullable_to_non_nullable
              as AppUser,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as num,
      orderStatus: null == orderStatus
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as String,
      orderDetails: null == orderDetails
          ? _value.orderDetails
          : orderDetails // ignore: cast_nullable_to_non_nullable
              as List<CartModel>,
      orderDateTime: null == orderDateTime
          ? _value.orderDateTime
          : orderDateTime // ignore: cast_nullable_to_non_nullable
              as Timestamp,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AppUserCopyWith<$Res> get appUser {
    return $AppUserCopyWith<$Res>(_value.appUser, (value) {
      return _then(_value.copyWith(appUser: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderModelImplCopyWith<$Res>
    implements $OrderModelCopyWith<$Res> {
  factory _$$OrderModelImplCopyWith(
          _$OrderModelImpl value, $Res Function(_$OrderModelImpl) then) =
      __$$OrderModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String orderId,
      AppUser appUser,
      num totalAmount,
      String orderStatus,
      List<CartModel> orderDetails,
      @TimestampConverter() Timestamp orderDateTime});

  @override
  $AppUserCopyWith<$Res> get appUser;
}

/// @nodoc
class __$$OrderModelImplCopyWithImpl<$Res>
    extends _$OrderModelCopyWithImpl<$Res, _$OrderModelImpl>
    implements _$$OrderModelImplCopyWith<$Res> {
  __$$OrderModelImplCopyWithImpl(
      _$OrderModelImpl _value, $Res Function(_$OrderModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? appUser = null,
    Object? totalAmount = null,
    Object? orderStatus = null,
    Object? orderDetails = null,
    Object? orderDateTime = null,
  }) {
    return _then(_$OrderModelImpl(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      appUser: null == appUser
          ? _value.appUser
          : appUser // ignore: cast_nullable_to_non_nullable
              as AppUser,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as num,
      orderStatus: null == orderStatus
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as String,
      orderDetails: null == orderDetails
          ? _value.orderDetails
          : orderDetails // ignore: cast_nullable_to_non_nullable
              as List<CartModel>,
      orderDateTime: null == orderDateTime
          ? _value.orderDateTime
          : orderDateTime // ignore: cast_nullable_to_non_nullable
              as Timestamp,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$OrderModelImpl implements _OrderModel {
  _$OrderModelImpl(
      {required this.orderId,
      required this.appUser,
      required this.totalAmount,
      required this.orderStatus,
      required this.orderDetails,
      @TimestampConverter() required this.orderDateTime});

  factory _$OrderModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderModelImplFromJson(json);

  @override
  String orderId;
  @override
  AppUser appUser;
  @override
  num totalAmount;
  @override
  String orderStatus;
  @override
  List<CartModel> orderDetails;
  @override
  @TimestampConverter()
  Timestamp orderDateTime;

  @override
  String toString() {
    return 'OrderModel(orderId: $orderId, appUser: $appUser, totalAmount: $totalAmount, orderStatus: $orderStatus, orderDetails: $orderDetails, orderDateTime: $orderDateTime)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderModelImplCopyWith<_$OrderModelImpl> get copyWith =>
      __$$OrderModelImplCopyWithImpl<_$OrderModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderModelImplToJson(
      this,
    );
  }
}

abstract class _OrderModel implements OrderModel {
  factory _OrderModel(
          {required String orderId,
          required AppUser appUser,
          required num totalAmount,
          required String orderStatus,
          required List<CartModel> orderDetails,
          @TimestampConverter() required Timestamp orderDateTime}) =
      _$OrderModelImpl;

  factory _OrderModel.fromJson(Map<String, dynamic> json) =
      _$OrderModelImpl.fromJson;

  @override
  String get orderId;
  set orderId(String value);
  @override
  AppUser get appUser;
  set appUser(AppUser value);
  @override
  num get totalAmount;
  set totalAmount(num value);
  @override
  String get orderStatus;
  set orderStatus(String value);
  @override
  List<CartModel> get orderDetails;
  set orderDetails(List<CartModel> value);
  @override
  @TimestampConverter()
  Timestamp get orderDateTime;
  @TimestampConverter()
  set orderDateTime(Timestamp value);
  @override
  @JsonKey(ignore: true)
  _$$OrderModelImplCopyWith<_$OrderModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
