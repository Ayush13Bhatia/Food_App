import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  late String? id;
  late String? title;
  late String? description;
  late double? price;
  late String? imageUrl;
  late bool? isFavorite;
  Product(
      {this.id,
      this.title,
      this.description,
      this.price,
      this.imageUrl,
      this.isFavorite});
}
