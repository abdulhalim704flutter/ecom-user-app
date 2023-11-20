import 'package:ecom_user/db_helper.dart';
import 'package:ecom_user/models/order_model.dart';
import 'package:flutter/foundation.dart';

class OrderProvider extends ChangeNotifier{
  Future<void> addOrder(OrderModel orderModel){
    return DbHelper.addNewOrder(orderModel);
  }

}