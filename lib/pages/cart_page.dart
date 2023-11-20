import 'package:ecom_user/coustomwidget/cart_item_view.dart';
import 'package:ecom_user/pages/checkout_page.dart';
import 'package:ecom_user/providers/cart_provider.dart';
import 'package:ecom_user/utils/constanse.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  static const String routeName = '/cart';
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
      ),
      body: Consumer<CartProvider>(
        builder: (context, provider, child) =>
            provider.totalItemsInCart == 0 ? Center(child: Text('Empty Cart!'),)
                : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: provider.cartList.length,
                    itemBuilder: (context, index) {
                      final cartModel = provider.cartList[index];
                      return CartItemView(cartModel: cartModel);
                    },
                  ),
                ),
                Card(
                  color: Colors.amber,
                  child: Padding(
                    padding: EdgeInsets.all(24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'SUB TOTAL: $currencySymboll${provider.getCartSubTotal()}',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pushNamed(context, CheckoutPage.routeName),
                          child: const Text(
                            'CHECKOUT',
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                          style: TextButton.styleFrom(backgroundColor: Colors.red),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
      ),
    );
  }
}
