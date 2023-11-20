import 'dart:io';
import 'package:ecom_user/auth/auth_service.dart';
import 'package:ecom_user/models/rating_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../db_helper.dart';
import '../models/category_model.dart';
import '../models/product_model.dart';

class ProductProvider extends ChangeNotifier {
  List<CategoryModel> categoryList = [];
  List<ProductModel> productList = [];

  getAllCategorise() {
    DbHelper.getAllCategorise().listen((snapshot) {
      categoryList = List.generate(snapshot.docs.length,
          (index) => CategoryModel.fromJson(snapshot.docs[index].data()));
      notifyListeners();
    });
  }

  getAllProduct() {
    DbHelper.getAllProducts().listen((snapshot) {
      productList = List.generate(snapshot.docs.length,
          (index) => ProductModel.fromJson(snapshot.docs[index].data()));
      notifyListeners();
    });
  }

  ProductModel getProductById(String id) {
    return productList.firstWhere((element) => element.id == id);
  }

  num priceAfterDiscount(num price, int discount) {
    return price - (price * discount ~/ 100);
  }


  Future<String> uploadImage(String path) async {
    final imageName = 'Image_${DateTime.now().millisecondsSinceEpoch}';
    final photoRef =
        FirebaseStorage.instance.ref().child('Pictures/$imageName');
    final uploadTask = photoRef.putFile(File(path));
    final snapshot = await uploadTask.whenComplete(() => null);
    return snapshot.ref.getDownloadURL();
  }

  // this write for add rating
  Future<void> addRating(String pid, double value) {
    final rating =
        RatingModel(userId: AuthService.currentUser!.uid, rating: value);
    return DbHelper.addRating(rating, pid);
  }

  Future<void> updateProductField(String id, String field, dynamic value) async {
    return DbHelper.updateProductField(id, {'abgRating' : value});
  }

  Future<void> updateAvgRatingForProduct(String pid)async{
    final snaphot = await DbHelper.getAllRatingsByProducts(pid);
    double totalRating = 1.0;
    for(final docSnapshot in snaphot.docs){
      totalRating += docSnapshot.data()['rating'];
    }
    final avgRating = totalRating / snaphot.docs.length;
    return updateProductField(pid, 'avgRating', avgRating);

  }
}
