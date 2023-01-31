import 'package:flutter/material.dart';
import 'package:food_app/components/app_bar_widget.dart';
import 'package:food_app/components/card_widget.dart';
import 'package:food_app/utils/my_theme.dart';
import 'package:provider/provider.dart';

import '../model/meals.dart';
import '../providers/products_provider.dart';
import '../utils/routes.dart';
import '../widgets/items/meal_list_card.dart';
import '../providers/cart.dart';
import '../widgets/badge.dart';

class MealListScreen extends StatefulWidget {
  const MealListScreen({Key? key}) : super(key: key);
  // static const routeName = '/meal-list-screen';

  @override
  State<MealListScreen> createState() => _MealListScreenState();
}

class _MealListScreenState extends State<MealListScreen> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    List<Meal>? products = [];
    final productId = ModalRoute.of(context)!.settings.arguments as String;

    final products1 = Provider.of<ProductsProvider>(context).items;

    products = products1.where((meal) {
      return meal.mealCategories!.contains(productId);
    }).toList();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: AppBar().preferredSize,
        child: AppBarWidget(
          onTapIcon: () => Navigator.pop(context),
          backGroundColor: MyTheme.whiteColor,
          title: 'Restaurant',
          action: [
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(Routes.cartScreen);
                },
                child: Consumer<Cart>(
                  builder: (_, order, child) => Badge(
                    child: const Icon(
                      Icons.add_shopping_cart_outlined,
                    ),
                    // value: order.itemCount.toString(),
                    value: '${cart.counter}',
                    // order.itemCount.toString(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const MealListCard(),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: products.length,
              itemBuilder: (context, index) {
                var list = products![index];
                return CardWidget(
                  elevation: 2,
                  image: list.imageUrl,
                  title: list.title,
                  subtitle: list.description,
                  typeList: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          cart.decrementCount();
                        });
                        cart.removingItems(
                          list.id!,
                        );
                      },
                      child: const Icon(
                        Icons.remove,
                        color: Colors.pink,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '${cart.counter}',
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        cart.incrementCount(index);
                        setState(() {});
                        cart.addItem(
                          list.id!,
                          list.price!,
                          list.title!,
                          list.imageUrl!,
                        );
                      },
                      child: const Icon(
                        Icons.add,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
