import 'package:flutter/material.dart';
import 'package:food_app/screens/bottonnavigation.dart';
import 'package:provider/provider.dart';

import '../screens/home_page_screen.dart';
import '../screens/meal_list_screen.dart';
import '../providers/products_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductsProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "MEAL APP",
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey)
              .copyWith(secondary: Colors.deepOrange),
        ),
        home: const MealListScreen(),
        routes: {
          MealListScreen.routeName: (context) => const MealListScreen(),
        },
      ),
    );
  }
}
