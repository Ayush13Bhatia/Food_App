import 'package:flutter/material.dart';
import 'package:food_app/model/meals.dart';
import 'package:food_app/model/product.dart';
import 'package:food_app/screens/meal_list_screen.dart';
import 'package:provider/provider.dart';

import '../providers/products_provider.dart';
import '../widgets/items/home_page_grid_items.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductsProvider>(context).favoriteItems;
    final productItems = Provider.of<ProductsProvider>(context).items1;

    List<Product>? prodcutMeal = [];

    prodcutMeal = productItems.where((meal) {
      return meal.isFavorite!;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text('Favorite Restaurant'),
      ),
      body: prodcutMeal.isEmpty
          ? const Center(
              child: Text("No favorite items"),
            )
          : GridView.builder(
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.all(10.0),
              itemCount: products.length,
              itemBuilder: (ctx, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      MealListScreen.routeName,
                      arguments: prodcutMeal![index].id,
                    );
                  },
                  child: HomePageGridItems(
                    num: 0,
                    id: products[index].id,
                    productId: prodcutMeal![index].id,
                    title: products[index].title,
                    imageUrl: products[index].imageUrl,
                    description: products[index].description,
                  ),
                );
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 10,
                mainAxisExtent: 120,
                mainAxisSpacing: 10,
              ),
            ),
    );
  }
}
