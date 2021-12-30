import 'package:flutter/material.dart';

import '../model/product.dart';

class ProductsProvider with ChangeNotifier {
  List<Product> _items = [];

  List<Product> get items {
    return [..._items];
  }

  void addProducts() {
    notifyListeners();
  }
}
