import 'package:flutter/material.dart';
import 'package:food_app/widgets/items/meal_list_card.dart';
import 'package:provider/provider.dart';

import '../../providers/products_provider.dart';
import '../../widgets/items/meal_list_items.dart';

class MealListWidget extends StatefulWidget {
  const MealListWidget({Key? key}) : super(key: key);

  @override
  _MealListWidgetState createState() => _MealListWidgetState();
}

class _MealListWidgetState extends State<MealListWidget> {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductsProvider>(context).items;

    return Column(
      children: [
        const MealListCard(),
        ListView.builder(
          primary: false,
          shrinkWrap: true,
          padding: const EdgeInsets.all(10),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return MealListItems(
              id: products[index].id!,
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
