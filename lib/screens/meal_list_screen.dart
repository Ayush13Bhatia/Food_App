import 'package:flutter/material.dart';
import 'package:food_app/components/app_bar_widget.dart';
import 'package:food_app/widgets/my_theme.dart';
import 'package:provider/provider.dart';

import '../widgets/meal_list_widget.dart';
import '../providers/cart.dart';
import 'cartScreen.dart';
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
      appBar: PreferredSize(
        preferredSize: AppBar().preferredSize,
        child: AppBarWidget(
          iconColor: Colors.black,
          onTapIcon: () => Navigator.pop(context),
          backGroundColor: MyTheme.whiteColor,
          action: [
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                },
                child: Consumer<Cart>(
                  builder: (_, order, child) => Badge(
                    child: const Icon(
                      Icons.add_shopping_cart_outlined,
                    ),
                    value: order.itemCount.toString(),
                    // order.itemCount.toString(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: const SingleChildScrollView(
        child: MealListWidget(),
      ),
    );
  }
}
