import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/meal_list_widget.dart';
import '../providers/orders.dart';
import '../screens/OrderScreen.dart';
import '../widgets/badge.dart';

class MealListScreen extends StatefulWidget {
  const MealListScreen({Key? key}) : super(key: key);
  static const routeName = '/meal-list-screen';

  @override
  State<MealListScreen> createState() => _MealListScreenState();
}

class _MealListScreenState extends State<MealListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // title: const Text("restaurants"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: Consumer<Order>(
                builder: (_, order, iconChild) => Badge(
                  value: order.itemCount.toString(),
                  child: iconChild,
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.add_shopping_cart_outlined,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(OrderScreen.routeName);
                  },
                ),
              ),
            ),
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: const SingleChildScrollView(
        child: MealListWidget(),
      ),
    );
  }
}
