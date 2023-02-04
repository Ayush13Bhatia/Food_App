import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import './cart.dart';

class OrderItem with ChangeNotifier {
  final String? id;
  final String? title;
  final double? amount;
  final String? imageUrl;
  final List<CartItem>? products;
  final DateTime? dateTime;

  OrderItem({
    this.id,
    this.title,
    this.amount,
    this.imageUrl,
    this.products,
    this.dateTime,
  });
}

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
