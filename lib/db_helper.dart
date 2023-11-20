import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom_user/models/app_user.dart';
import 'package:ecom_user/models/cart_model.dart';
import 'package:ecom_user/models/order_model.dart';
import 'package:ecom_user/models/rating_model.dart';

class DbHelper {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;
  static final collectionCategory = 'Categorise';
  static final collectionProduct = 'Product';
  static final collectionUsers = 'Users';
  static final collectionCart = 'My Carts';
  static final collectionRating = 'Ratings';
  static final collectionOrder = 'Orders';


  // all ok
  static Future<void> addUser(AppUser user) {
    return _db.collection(collectionUsers)
        .doc(user.id)
        .set(user.toJson());
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllCategorise() =>
      _db.collection(collectionCategory).orderBy('name').snapshots();

  static Future<DocumentSnapshot<Map<String, dynamic>>> getuserInfoById(
          String uid) =>
      _db.collection(collectionUsers).doc(uid).get();

  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllUserCartItems(
          String uid) =>
      _db
          .collection(collectionUsers)
          .doc(uid)
          .collection(collectionCart)
          .snapshots();

  static Future<QuerySnapshot<Map<String, dynamic>>> getAllRatingsByProducts(
          String pid) =>
      _db
          .collection(collectionProduct)
          .doc(pid)
          .collection(collectionRating)
          .get();

  static Future<void> addNewOrder(OrderModel orderModel) async {
    final wb = _db.batch();
    final orderDoc = _db.collection(collectionOrder).doc(orderModel.orderId);
    wb.set(orderDoc, orderModel.toJson());
    for (final cartModel in orderModel.orderDetails) {
      final proDocSnapshot = await _db
          .collection(collectionProduct)
          .doc(cartModel.productId)
          .get();
      final currentStock = proDocSnapshot.data()!["stock"];
      final updatedStock = currentStock - cartModel.quantity;
      final proDoc =
      await _db.collection(collectionProduct).doc(cartModel.productId);
      wb.update(proDoc, {"stock": updatedStock});
    }
    final userDoc = _db.collection(collectionUsers).doc(orderModel.appUser.id);
    wb.update(userDoc, {"userAddress": orderModel.appUser.userAddress?.toJson()});

    //After Order, Delete Cart or Order page history.
    for (final cartModel in orderModel.orderDetails) {
      final cartDoc = _db.collection(collectionUsers)
          .doc(orderModel.appUser.id)
          .collection(collectionCart)
          .doc(cartModel.productId);
      wb.delete(cartDoc);
    }
    return wb.commit();
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllProducts() => _db
      .collection(collectionProduct)
      .where('available', isEqualTo: true)
      .snapshots();

  Future<void> addToCart(String uid, CartModel cartModel) {
    return _db
        .collection(collectionUsers)
        .doc(uid)
        .collection(collectionCart)
        .doc(cartModel.productId)
        .set(cartModel.toJson());
  }

  Future<void> removeFromCart(String uid, String pid) {
    return _db
        .collection(collectionUsers)
        .doc(uid)
        .collection(collectionCart)
        .doc(pid)
        .delete();
  }

  static Future<void> updateCartQuantity(String uid, CartModel cartModel) {
    return _db
        .collection(collectionUsers)
        .doc(uid)
        .collection(collectionCart)
        .doc(cartModel.productId)
        .update(cartModel.toJson());
  }

  static Future<void> updateProductField(String pid, Map<String, dynamic> map) {
    return _db.collection(collectionProduct).doc(pid).update(map);
  }

  // this is write for add rating and update rating
  static Future<void> addRating(RatingModel ratingModel, String pid) async {
    return _db
        .collection(collectionProduct)
        .doc(pid)
        .collection(collectionRating)
        .doc(ratingModel.userId)
        .set(ratingModel.toJson());
  }
}
