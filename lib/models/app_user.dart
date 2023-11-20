import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../utils/timestamp_converter.dart';
import 'address_model.dart';
part 'app_user.freezed.dart';
part 'app_user.g.dart';

@unfreezed
class AppUser with _$AppUser{
  @JsonSerializable(explicitToJson: true)
  factory AppUser({
    required String id,
    required String email,
    @TimestampConverter() required Timestamp userCreationTime,
    AddressModel? userAddress,
    String? displayName,
    String? phoneNumber,
    String? photoUrl,


}) = _AppUser;
  factory AppUser.fromJson(Map<String,dynamic> json)=>
      _$AppUserFromJson(json);
}