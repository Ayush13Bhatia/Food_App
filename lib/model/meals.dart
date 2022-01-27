import 'package:flutter/material.dart';

class Meal with ChangeNotifier {
  late String? id;
  late String? title;
  late String? description;
  late double? price;
  late String? imageUrl;
  late List<String>? mealCategories;
  Meal({
    this.id,
    this.title,
    this.description,
    this.price,
    this.imageUrl,
    this.mealCategories,
  });
}
