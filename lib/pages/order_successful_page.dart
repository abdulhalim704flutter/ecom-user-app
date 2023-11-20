import 'package:flutter/material.dart';

class OrderSuccessfulPage extends StatelessWidget {
  static const String routeName = '/successful';
  const OrderSuccessfulPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Placed'),
      ),
      body: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.done),
          Text('Your Order has been placed',style: TextStyle(fontSize: 18.0),),
        ],
      ),
    );
  }
}
