import 'package:flutter/material.dart';
import 'package:food_app/components/card_widget.dart';
import 'package:food_app/utils/my_theme.dart';
import 'package:food_app/utils/routes.dart';
import 'package:provider/provider.dart';

import '../components/app_bar_widget.dart';
import '../model/meals_model.dart';
import '../providers/meal_provider.dart';

class AddingMealScreen extends StatefulWidget {
  const AddingMealScreen({Key? key}) : super(key: key);

  @override
  _AddingMealScreenState createState() => _AddingMealScreenState();
}

class _AddingMealScreenState extends State<AddingMealScreen> {
  @override
  Widget build(BuildContext context) {
    List<Meal>? products = [];
    final productId = ModalRoute.of(context)!.settings.arguments as String;

    final products1 = Provider.of<MealProvider>(context).items;

    products = products1.where((meal) {
      return meal.mealCategories!.contains(productId);
    }).toList();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: AppBar().preferredSize,
        child: AppBarWidget(
          backGroundColor: MyTheme.whiteColor,
          title: "Add Meals",
          iconWidget: Container(),
          textColor: MyTheme.blackColor,
          action: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: GestureDetector(
                onTap: () {
                  print('object11');
                  Navigator.of(context).pushNamed(Routes.addProduct);
                },
                child: const Icon(
                  Icons.add,
                ),
              ),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: products.length,
              itemBuilder: (context, index) {
                var data = products![index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(Routes.addProduct);
                  },
                  child: CardWidget(
                    elevation: 5,
                    title: data.title,
                    image: data.imageUrl,
                    subtitle: data.description,
                    typeList: [
                      Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: Text('${data.price}'),
                      )
                    ],
                  ),
                );

                // AddingMealItems(
                // id: products[index].id!,
                // description: products[index].description!,
                // imageUrl: products[index].imageUrl!,
                // price: products[index].price!,
                // title: products[index].title!,
                // );
              },
            ),
          ),
        ],
      ),
    );
  }
}
