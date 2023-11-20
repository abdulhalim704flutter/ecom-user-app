// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderModelImpl _$$OrderModelImplFromJson(Map<String, dynamic> json) =>
    _$OrderModelImpl(
      orderId: json['orderId'] as String,
      appUser: AppUser.fromJson(json['appUser'] as Map<String, dynamic>),
      totalAmount: json['totalAmount'] as num,
      orderStatus: json['orderStatus'] as String,
      orderDetails: (json['orderDetails'] as List<dynamic>)
          .map((e) => CartModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      orderDateTime: const TimestampConverter()
          .fromJson(json['orderDateTime'] as Timestamp),
    );

Map<String, dynamic> _$$OrderModelImplToJson(_$OrderModelImpl instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'appUser': instance.appUser.toJson(),
      'totalAmount': instance.totalAmount,
      'orderStatus': instance.orderStatus,
      'orderDetails': instance.orderDetails.map((e) => e.toJson()).toList(),
      'orderDateTime':
          const TimestampConverter().toJson(instance.orderDateTime),
    };
