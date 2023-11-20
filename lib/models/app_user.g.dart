// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppUserImpl _$$AppUserImplFromJson(Map<String, dynamic> json) =>
    _$AppUserImpl(
      id: json['id'] as String,
      email: json['email'] as String,
      userCreationTime: const TimestampConverter()
          .fromJson(json['userCreationTime'] as Timestamp),
      userAddress: json['userAddress'] == null
          ? null
          : AddressModel.fromJson(json['userAddress'] as Map<String, dynamic>),
      displayName: json['displayName'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      photoUrl: json['photoUrl'] as String?,
    );

Map<String, dynamic> _$$AppUserImplToJson(_$AppUserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'userCreationTime':
          const TimestampConverter().toJson(instance.userCreationTime),
      'userAddress': instance.userAddress?.toJson(),
      'displayName': instance.displayName,
      'phoneNumber': instance.phoneNumber,
      'photoUrl': instance.photoUrl,
    };
