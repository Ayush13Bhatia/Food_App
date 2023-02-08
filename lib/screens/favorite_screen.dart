import 'package:flutter/material.dart';
import 'package:food_app/components/app_bar_widget.dart';
import 'package:food_app/model/product_model.dart';
import 'package:food_app/utils/my_theme.dart';
import 'package:provider/provider.dart';

import '../components/grid_widget.dart';
import '../providers/products_provider.dart';
import '../utils/routes.dart';

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
      appBar: PreferredSize(
        preferredSize: AppBar().preferredSize,
        child: AppBarWidget(
          backGroundColor: MyTheme.primaryColor,
          title: 'Favorite Restaurant',
          iconWidget: Container(),
          elevation: 3,
        ),
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
                      Routes.mealScreen,
                      arguments: prodcutMeal![index].id,
                    );
                  },
                  child: GridWidget(
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
