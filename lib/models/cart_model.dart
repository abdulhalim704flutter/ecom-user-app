import 'package:freezed_annotation/freezed_annotation.dart';
part 'cart_model.freezed.dart';
part 'cart_model.g.dart';

@unfreezed

class CartModel with _$CartModel{


  factory CartModel({
    required String productId,
    required String productName,
    required String imageUrl,
    required num price,
    @Default(1) num quantity,
}) = _CartModel;

  factory CartModel.fromJson(Map<String,dynamic> json) =>
      _$CartModelFromJson(json);
}