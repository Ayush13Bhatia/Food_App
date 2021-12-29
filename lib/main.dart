import 'package:flutter/material.dart';
import 'package:food_app/screens/home_page_screen.dart';
import 'package:food_app/screens/meal_list_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "MEAL APP",
      theme: ThemeData(
        primarySwatch: Colors.grey,
        accentColor: Colors.deepOrange,
      ),
      home: const HomePage(),
      routes: {
        MealListScreen.routeName: (context) => const MealListScreen(),
      },
    );
  }
}
