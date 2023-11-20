import 'package:freezed_annotation/freezed_annotation.dart';
part 'address_model.freezed.dart';
part 'address_model.g.dart';

@unfreezed
class AddressModel with _$AddressModel{
  factory AddressModel({
    required String streetAddress,
    required String city,
    required String zipCode,
}) = _AddressModel;
  factory AddressModel.fromJson(Map<String, dynamic> json)=>
      _$AddressModelFromJson(json);

}