import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/OrderScreen.dart';
import '../screens/meal_list_screen.dart';
import '../screens/tabScreen/bottonnavigation.dart';

import '../providers/orders.dart';
import '../providers/products_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Order(),
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
          OrderScreen.routeName: (context) => const OrderScreen(),
        },
      ),
    );
  }
}
