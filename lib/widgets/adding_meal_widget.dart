import 'package:flutter/material.dart';
import 'package:food_app/model/meals.dart';
import 'package:food_app/providers/products_provider.dart';
import 'package:food_app/widgets/items/adding_meal_items.dart';
import 'package:provider/provider.dart';

class AddingMealWidget extends StatelessWidget {
  const AddingMealWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Meal>? products = [];
    final productId = ModalRoute.of(context)!.settings.arguments as String;

    final products1 = Provider.of<ProductsProvider>(context).items;

    products = products1.where((meal) {
      return meal.mealCategories!.contains(productId);
    }).toList();

    return Column(
      children: [
        ListView.builder(
          primary: false,
          shrinkWrap: true,
          padding: const EdgeInsets.all(10),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return AddingMealItems(
              id: products![index].id!,
              description: products[index].description!,
              imageUrl: products[index].imageUrl!,
              price: products[index].price!,
              title: products[index].title!,
            );
          },
        ),
      ],
    );
  }
}
