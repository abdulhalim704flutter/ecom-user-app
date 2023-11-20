import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecom_user/models/cart_model.dart';
import 'package:ecom_user/providers/cart_provider.dart';
import 'package:ecom_user/utils/constanse.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItemView extends StatelessWidget {
  final CartModel cartModel;
  const CartItemView({super.key, required this.cartModel});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: CachedNetworkImage(
              width: 70,
              height: 70,
              fadeInDuration: Duration(seconds: 2),
              fadeInCurve: Curves.bounceInOut,
              imageUrl: cartModel.imageUrl,
              placeholder: (context, url) => Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => Center(
                child: Icon(Icons.error),
              ),
            ),
            title: Text(
              cartModel.productName,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            trailing: Text(
              '$currencySymboll${cartModel.price}',
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        cartProvider.decraseQuantity(cartModel);
                      },
                      icon: const Icon(
                        Icons.remove_circle,
                        size: 25,
                      )),
                  Text(
                    cartModel.quantity.toString(),
                    style: const TextStyle(fontSize: 16),
                  ),
                  IconButton(
                      onPressed: () {
                        cartProvider.increaseQuantity(cartModel);
                      },
                      icon: const Icon(
                        Icons.add_circle,
                        size: 25,
                      )),
                ],
              ),
              //const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Text(
                    '$currencySymboll${cartProvider.priceWithWuantity(cartModel.price, cartModel.quantity)}',
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w600)),
              ),
              IconButton(
                  onPressed: () {
                    cartProvider.removeFromCart(cartModel.productId);
                  },
                  icon: Icon(Icons.delete))
            ],
          )
        ],
      ),
    );
  }
}
