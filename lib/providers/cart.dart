import 'package:flutter/material.dart';

class CartItem {
  late String? id;
  late String? title;
  late double? price;
  late int? qauntity;
  late String? imageUrl;

  CartItem(
    this.id,
    this.title,
    this.price,
    this.qauntity,
    this.imageUrl,
  );
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _cartitems = {};

  Map<String, CartItem> get cartItem {
    return {..._cartitems};
  }

  int get itemCount {
    return _cartitems.length;
  }

  double get totalAmount {
    var total = 0.0;
    _cartitems.forEach((key, orderItem) {
      total += orderItem.price! * orderItem.qauntity!;
    });
    return total;
  }

  void addItem(
    String productId,
    double price,
    String title,
    String imageUrl,
  ) {
    if (_cartitems.containsKey(productId)) {
      //  change qauntity
      _cartitems.update(
        productId,
        (existingOrderItem) => CartItem(
          existingOrderItem.id,
          title,
          price,
          existingOrderItem.qauntity! + 1,
          imageUrl,
        ),
      );
    } else {
      _cartitems.putIfAbsent(
        productId,
        () => CartItem(
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
    if (_cartitems.containsKey(productId)) {
      //  change qauntity
      _cartitems.remove(
        productId,
      );
    }
    notifyListeners();
  }

  void clear() {
    _cartitems = {};
    notifyListeners();
  }

  int counter = 0;

  void incrementCount() {
    counter++;
  }

  void decrementCount() {
    if (counter == 0) {
      return;
    }
    counter--;
  }
}
