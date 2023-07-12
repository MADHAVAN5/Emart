import 'dart:convert';

import 'package:flutter/material.dart';

import '../config/config.dart';
import '../constants/constants.dart';
import '../models/category_model.dart';
import '../models/order_model.dart';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';
import '../models/user_model.dart';

class StoreHelper {
  static StoreHelper instance = StoreHelper();

  Future<List<CategoryModel>> getCategories() async {
    final res = await http.get(Uri.parse("${categoryAPI}getall"),
        headers: {"Content-Type": "application/json"});
    List decodedJson = json.decode(res.body.toString());
    List<CategoryModel> categoriesList =
        decodedJson.map((e) => CategoryModel.fromJson(e)).toList();

    return categoriesList;
  }

  // Future<List<ProductModel>> getBestProducts() async {
  //   try {
  //     QuerySnapshot<Map<String, dynamic>> querySnapshot =
  //         await _firebaseFirestore.collectionGroup("products").get();

  //     List<ProductModel> productModelList = querySnapshot.docs
  //         .map((e) => ProductModel.fromJson(e.data()))
  //         .toList();

  //     return productModelList;
  //   } catch (e) {
  //     showMessage(e.toString());
  //     return [];
  //   }
  // }

  // Future<List<ProductModel>> getCategoryViewProduct(String id) async {
  //   try {
  //     QuerySnapshot<Map<String, dynamic>> querySnapshot =
  //         await _firebaseFirestore
  //             .collection("categories")
  //             .doc(id)
  //             .collection("products")
  //             .get();

  //     List<ProductModel> productModelList = querySnapshot.docs
  //         .map((e) => ProductModel.fromJson(e.data()))
  //         .toList();

  //     return productModelList;
  //   } catch (e) {
  //     showMessage(e.toString());
  //     return [];
  //   }
  // }

  // Future<UserModel> getUserInformation() async {
  //   DocumentSnapshot<Map<String, dynamic>> querySnapshot =
  //       await _firebaseFirestore
  //           .collection("users")
  //           .doc(FirebaseAuth.instance.currentUser!.uid)
  //           .get();

  //   return UserModel.fromJson(querySnapshot.data()!);
  // }

  // Future<bool> uploadOrderedProductFirebase(
  //     List<ProductModel> list, BuildContext context, String payment) async {
  //   try {
  //     showLoaderDialog(context);
  //     double totalPrice = 0.0;
  //     for (var element in list) {
  //       totalPrice += element.price * element.qty!;
  //     }
  //     DocumentReference documentReference = _firebaseFirestore
  //         .collection("usersOrders")
  //         .doc(FirebaseAuth.instance.currentUser!.uid)
  //         .collection("orders")
  //         .doc();
  //     DocumentReference admin = _firebaseFirestore.collection("orders").doc();

  //     admin.set({
  //       "products": list.map((e) => e.toJson()),
  //       "status": "Pending",
  //       "totalPrice": totalPrice,
  //       "payment": payment,
  //       "orderId": admin.id,
  //     });
  //     documentReference.set({
  //       "products": list.map((e) => e.toJson()),
  //       "status": "Pending",
  //       "totalPrice": totalPrice,
  //       "payment": payment,
  //       "orderId": documentReference.id,
  //     });
  //     Navigator.of(context, rootNavigator: true).pop();
  //     showMessage("Ordered Successfully");
  //     return true;
  //   } catch (e) {
  //     showMessage(e.toString());
  //     Navigator.of(context, rootNavigator: true).pop();
  //     return false;
  //   }
  // }

  // ////// Get Order User//////

  // Future<List<OrderModel>> getUserOrder() async {
  //   try {
  //     QuerySnapshot<Map<String, dynamic>> querySnapshot =
  //         await _firebaseFirestore
  //             .collection("usersOrders")
  //             .doc(FirebaseAuth.instance.currentUser!.uid)
  //             .collection("orders")
  //             .get();

  //     List<OrderModel> orderList = querySnapshot.docs
  //         .map((element) => OrderModel.fromJson(element.data()))
  //         .toList();

  //     return orderList;
  //   } catch (e) {
  //     showMessage(e.toString());
  //     return [];
  //   }
  // }

  // void updateTokenFromFirebase() async {
  //   String? token = await FirebaseMessaging.instance.getToken();
  //   if (token != null) {
  //     await _firebaseFirestore
  //         .collection("users")
  //         .doc(FirebaseAuth.instance.currentUser!.uid)
  //         .update({
  //       "notificationToken": token,
  //     });
  //   }
  // }
}
