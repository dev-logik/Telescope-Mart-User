import 'package:flutter/material.dart';
import 'package:telescope_mart/db/db_helper.dart';
import 'package:telescope_mart/models/order_model.dart';

class OrderProvider extends ChangeNotifier {
  List<OrderModel> orderList = [];

  Future<void> saveOrder({required OrderModel order}) async {
    await DbHelper.saveOrder(order);
  }

  Future<void> getAllOrders(String uid) async {
    DbHelper.getAllOrders(uid).listen((querySnapshot) {
      orderList = querySnapshot.docs
          .map((doc) => OrderModel.fromJson(doc.data()))
          .toList();
      notifyListeners();
    });
  }
}
