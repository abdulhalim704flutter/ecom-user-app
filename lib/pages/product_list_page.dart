import 'package:ecom_user/coustomwidget/cart_badge_view.dart';
import 'package:ecom_user/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../coustomwidget/product_grid_item.dart';
import '../providers/product_provider.dart';

class ProductListPage extends StatefulWidget {
  static const String routeName = '/productlist';
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  @override
  void didChangeDependencies() {
    Provider.of<ProductProvider>(context, listen: false).getAllCategorise();
    Provider.of<ProductProvider>(context, listen: false).getAllProduct();
    Provider.of<CartProvider>(context, listen: false).getAllUserCartItems();
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          const CartBadgeView(),
        ],
      ),
      body: Consumer<ProductProvider>(
        builder: (context, provider, child) => GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              childAspectRatio: 0.65
            ),
          itemCount: provider.productList.length,
          itemBuilder: (context, index) {
              final product = provider.productList[index];
              return ProductGridItem(product: product);
          },

        ),
      ),
    );
  }
}
