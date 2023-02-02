import 'package:flutter/material.dart';
import 'package:food_app/model/meals.dart';

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
  Map<String, CartItem> _cartItems = {};
  List<Meal> mealList = [];
  int counter = 0;

  void incrementCount(Meal meal) {
    mealList.add(meal);
    notifyListeners();
  }

  void decrementCount(Meal meal) {
    if (mealList.isEmpty) {
      return;
    }
    mealList.remove(meal);
    notifyListeners();
  }

  Map<String, CartItem> get cartItem {
    return {..._cartItems};
  }

  int get itemCount {
    int total = 0;
    _cartItems.forEach((key, value) {
      total += value.qauntity!;
    });
    return total;
  }

  double get totalAmount {
    var total = 0.0;
    _cartItems.forEach((key, orderItem) {
      total += orderItem.price! * counter;
    });
    return total;
  }

  double get totalAmountSub {
    var total = 0.0;
    _cartItems.forEach((key, orderItem) {
      total -= orderItem.price! * orderItem.qauntity!;
    });
    return total;
  }

  void addItem(
    String productId,
    double price,
    String title,
    String imageUrl,
  ) {
    if (_cartItems.containsKey(productId)) {
      //  change qauntity
      _cartItems.update(
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
      _cartItems.putIfAbsent(
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
    if (_cartItems.containsKey(productId)) {
      _cartItems.removeWhere((key, value) => key.contains(productId));
    }
    notifyListeners();
  }

  void clear() {
    _cartItems = {};
    notifyListeners();
  }
}
