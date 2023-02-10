import 'package:flutter/material.dart';
import 'package:food_app/model/product_model.dart';
import 'package:food_app/providers/meal_provider.dart';
import 'package:food_app/providers/orders.dart';
import 'package:food_app/screens/tabScreen/bottonnavigation.dart';

import 'package:food_app/utils/routes.dart';
import 'package:provider/provider.dart';

import 'providers/cart.dart';
import '../providers/products_provider.dart';

void main() {
  return runApp(const MyApp());
}

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
          create: (context) => MealProvider(),
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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "MEAL APP",
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey).copyWith(secondary: Colors.deepOrange),
        ),
        home:
            // const LoginScreen(),
            const BottomNavigation(),
        routes: Routes().routes,
      ),
    );
  }
}
