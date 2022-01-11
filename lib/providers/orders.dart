import 'package:flutter/material.dart';

class OrderItem {
  late String? id;
  late String? title;
  late double? price;
  late int? qauntity;
  late String? imageUrl;

  OrderItem(
    this.id,
    this.title,
    this.price,
    this.qauntity,
    this.imageUrl,
  );
}

class Order with ChangeNotifier {
  late Map<String, OrderItem> _orderitems = {};

  Map<String, OrderItem> get orderItem {
    return {..._orderitems};
  }

  int get itemCount {
    return _orderitems.length;
  }

  double get totalAmount {
    var total = 0.0;
    _orderitems.forEach((key, orderItem) {
      total += orderItem.price! * orderItem.qauntity!;
    });
    return total;
  }

  void addItem(String productId, double price, String title, String imageUrl) {
    if (_orderitems.containsKey(productId)) {
      //  change qauntity
      _orderitems.update(
        productId,
        (existingOrderItem) => OrderItem(
          existingOrderItem.id,
          title,
          price,
          existingOrderItem.qauntity! + 1,
          imageUrl,
        ),
      );
    } else {
      _orderitems.putIfAbsent(
        productId,
        () => OrderItem(
          DateTime.now().toString(),
          title,
          price,
          1,
          imageUrl,
        ),
      );
    }
    notifyListeners();
  }

  void removingItems(String productId) {
    if (_orderitems.containsKey(productId)) {
      //  change qauntity
      _orderitems.remove(
        productId,
      );
    }
    notifyListeners();
  }
}
