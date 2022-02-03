import 'package:flutter/material.dart';
import 'package:food_app/model/meals.dart';
import 'package:food_app/model/product.dart';
import 'package:food_app/providers/orders.dart';
import 'package:food_app/screens/add_products.dart';
import 'package:food_app/screens/adding_meal_screen.dart';
import 'package:food_app/screens/admin.dart';
import 'package:food_app/screens/edit_product_screen.dart';
import 'package:food_app/screens/yoursOrders.dart';
import 'package:provider/provider.dart';

import 'screens/cartScreen.dart';
import '../screens/meal_list_screen.dart';
import '../screens/tabScreen/bottonnavigation.dart';

import 'providers/cart.dart';
import '../providers/products_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (context) => Orders(),
        ),
        ChangeNotifierProvider(
          create: (context) => Product(),
        ),
        ChangeNotifierProvider(
          create: (context) => Meal(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "MEAL APP",
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey)
              .copyWith(secondary: Colors.deepOrange),
        ),
        home: const BottomNavigation(),
        routes: {
          MealListScreen.routeName: (context) => const MealListScreen(),
          CartScreen.routeName: (context) => const CartScreen(),
          YoursOrders.routeName: (context) => const YoursOrders(),
          EditProductScreen.routeName: (context) => const EditProductScreen(),
          AddingMealScreen.routeName: (context) => const AddingMealScreen(),
          AddProducts.routeName: (context) => const AddProducts()
        },
      ),
    );
  }
}
