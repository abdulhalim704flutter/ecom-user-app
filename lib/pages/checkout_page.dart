import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom_user/models/address_model.dart';
import 'package:ecom_user/models/app_user.dart';
import 'package:ecom_user/models/order_model.dart';
import 'package:ecom_user/pages/order_successful_page.dart';
import 'package:ecom_user/pages/product_list_page.dart';
import 'package:ecom_user/providers/cart_provider.dart';
import 'package:ecom_user/providers/order_provider.dart';
import 'package:ecom_user/providers/user_providers.dart';
import 'package:ecom_user/utils/constanse.dart';
import 'package:ecom_user/utils/helper_funtions.dart';
import 'package:ecom_user/utils/widgets_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

class CheckoutPage extends StatefulWidget {
  static const String routeName = '/checkout';
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  late CartProvider cartProvider;
  late UserProvider userProvider;
  late AppUser appUser;
  String? city;
  final _formKey = GlobalKey<FormState>();
  final addressController = TextEditingController();
  final zipCodeController = TextEditingController();
  @override
  void didChangeDependencies() {
    cartProvider = Provider.of<CartProvider>(context, listen: false);
    userProvider = Provider.of<UserProvider>(context, listen: false);
    _getUser();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirm Order'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(12.0),
        children: [
          const Text(
            'items',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          Card(
            child: Column(
              children: cartProvider.cartList
                  .map((cartModel) => ListTile(
                        title: Text(
                          cartModel.productName,
                          style: const TextStyle(fontSize: 18.0),
                        ),
                        trailing: Text(
                          '${cartModel.quantity}x${cartProvider.priceWithWuantity(cartModel.price, cartModel.quantity)}',
                          style: const TextStyle(fontSize: 18.0),
                        ),
                      ))
                  .toList(),
            ),
          ),
          Card(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'TOTAL AMOUNT',
                    style: const TextStyle(
                        fontSize: 18.0, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    '$currencySymboll${cartProvider.getCartSubTotal()}',
                    style: const TextStyle(
                        fontSize: 18.0, fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
          ),
          const Text(
            'Delivary Address',
            style: const TextStyle(fontSize: 18.0),
          ),
          Card(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    DropdownButtonFormField<String>(
                      items: cities
                          .map((city) => DropdownMenuItem<String>(
                                value: city,
                                child: Text(city),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          city = value;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Thsi field must not be empty!';
                        }
                        return null;
                      },
                      value: city,
                      hint: const Text('Select City'),
                      isExpanded: true,
                      decoration:
                          const InputDecoration(border: InputBorder.none),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: TextFormField(
                        controller: addressController,
                        decoration: InputDecoration(
                          labelText: 'Street Address',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This field must not be empty!';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: zipCodeController,
                        decoration: InputDecoration(
                          labelText: 'Zip Code',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This field must not be empty!';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: ElevatedButton(
                onPressed: _saveOrder, child: const Text('PLACE ORDER')),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    addressController.dispose();
    zipCodeController.dispose();
    super.dispose();
  }

  void _getUser() async {
    appUser = await userProvider.getUser();
    if (appUser.userAddress != null) {
      setState(() {
        city = appUser.userAddress!.city;
        addressController.text = appUser.userAddress!.streetAddress;
        zipCodeController.text = appUser.userAddress!.zipCode;
      });
    }
  }

  void _saveOrder() async {
    if (_formKey.currentState!.validate()) {
      final address = AddressModel(
          streetAddress: addressController.text,
          city: city!,
          zipCode: zipCodeController.text);
      appUser.userAddress = address;
      final orderModel = OrderModel(
        orderId: genarateOrder,
        appUser: appUser,
        totalAmount: cartProvider.getCartSubTotal(),
        orderStatus: OrderStatus.pending,
        orderDetails: cartProvider.cartList,
        orderDateTime: Timestamp.fromDate(DateTime.now()),
      );
      EasyLoading.show(status: "Please Wait");
      Provider.of<OrderProvider>(context, listen: false)
          .addOrder(orderModel)
          .then((value) {
        EasyLoading.dismiss();
        showMsg(context, "Oder Saved");
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => OrderSuccessfulPage()),
            ModalRoute.withName(ProductListPage.routeName));
      }).catchError((error) {
        EasyLoading.dismiss();
        showMsg(context, error.toString());
      });
    }
  }
}
