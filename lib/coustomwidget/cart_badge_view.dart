import 'package:ecom_user/pages/cart_page.dart';
import 'package:ecom_user/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartBadgeView extends StatelessWidget {
  const CartBadgeView({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> Navigator.pushNamed(context, CartPage.routeName),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const Icon(
            Icons.shopping_cart,
            size: 30,
          ),
          Positioned(
            top: -5,
            left: -5,
            child: Container(
              padding: EdgeInsets.all(2.0),
              alignment: Alignment.center,
              constraints: BoxConstraints(
                maxHeight: 20,
                maxWidth: 20,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
              ),
              child: FittedBox(
                  child: Consumer<CartProvider>(
                    builder:(context,provider, child) =>  Text(
                  provider.totalItemsInCart.toString(),
                style: TextStyle(color: Colors.white),
              ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
