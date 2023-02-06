import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_app/components/app_bar_widget.dart';
import 'package:food_app/components/card_widget.dart';
import 'package:food_app/providers/meal_provider.dart';
import 'package:food_app/utils/my_theme.dart';
import 'package:provider/provider.dart';

import '../model/meals.dart';
import '../providers/products_provider.dart';
import '../utils/routes.dart';
import '../widgets/items/meal_list_card.dart';
import '../providers/cart.dart';
import '../components/badge.dart';

class MealListScreen extends StatefulWidget {
  const MealListScreen({Key? key}) : super(key: key);

  @override
  State<MealListScreen> createState() => _MealListScreenState();
}

class _MealListScreenState extends State<MealListScreen> {
  late final MealProvider mealProvider;
  @override
  void initState() {
    // TODO: implement initState
    mealProvider = context.read<MealProvider>();
    super.initState();
  }

  int counter = 0;
  late bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);

    List<Meal>? products = [];
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final products1 = Provider.of<MealProvider>(context).items;
    products = products1.where((meal) {
      return meal.mealCategories!.contains(productId);
    }).toList();

    final restaurantsData = Provider.of<ProductsProvider>(context).findById1(productId);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: AppBar().preferredSize,
        child: AppBarWidget(
          backGroundColor: MyTheme.whiteColor,
          title: restaurantsData.title ?? '',
          textColor: MyTheme.blackColor,
          iconWidget: Container(),
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
                    // value: '${cart.counter}',
                    value: '${order.mealList.length}',
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
              itemBuilder: (_, index) {
                var meal = products![index];
                return CardWidget(
                  elevation: 2,
                  image: meal.imageUrl,
                  title: meal.title,
                  subtitle: meal.description,
                  typeList: [
                    GestureDetector(
                      onTap: () {
                        cart.decrementCount(meal);
                        if (cart.counter == 0) {
                          cart.removingItems(
                            meal.id!,
                          );
                        }
                      },
                      child: const Icon(
                        Icons.remove,
                        color: Colors.pink,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Consumer<Cart>(
                      builder: (_, ref, child) {
                        var mealList = ref.mealList;
                        var counter = 0;
                        for (Meal m in mealList) {
                          if (m == meal) {
                            counter++;
                          }
                        }
                        return Text(
                          '$counter',
                        );
                      },
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        cart.incrementCount(meal);
                        cart.addItem(
                          meal.id!,
                          meal.price!,
                          meal.title!,
                          meal.imageUrl!,
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
