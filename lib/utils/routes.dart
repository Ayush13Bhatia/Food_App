import 'package:flutter/cupertino.dart';
import 'package:food_app/screens/add_products.dart';
import 'package:food_app/screens/adding_meal_screen.dart';
import 'package:food_app/screens/cartScreen.dart';
import 'package:food_app/screens/history.dart';
import 'package:food_app/screens/meal_list_screen.dart';

class Routes {
  static const String mealScreen = '/mealListScreen';
  static const String cartScreen = '/cartScreen';
  static const String history = '/history';
  static const String editScreen = '/editScreen';
  static const String addingMealScreen = '/addMeanScreen';
  static const String addProduct = '/addProduct';

  final Map<String, Widget Function(BuildContext)> routes = {
    mealScreen: (context) => const MealListScreen(),
    cartScreen: (context) => const CartScreen(),
    history: (context) => const History(),
    addingMealScreen: (context) => const AddingMealScreen(),
    addProduct: (context) => const AddProducts(),
  };
}
