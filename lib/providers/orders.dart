import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../model/cart_item_model.dart';
import '../model/order_item_model.dart';

class Orders with ChangeNotifier {
  final List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem>? cartProducts, String? title, String? imageurl, double? total) {
    _orders.insert(
      0,
      OrderItem(
        id: DateTime.now().toString(),
        amount: total,
        title: title,
        dateTime: DateTime.now(),
        products: cartProducts,
      ),
    );
    notifyListeners();
  }
}
