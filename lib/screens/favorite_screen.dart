import 'package:flutter/material.dart';

import 'package:food_app/model/product.dart';
import 'package:food_app/screens/meal_list_screen.dart';

import 'package:provider/provider.dart';

import '../providers/products_provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final productsRes = Provider.of<ProductsProvider>(context).favoriteItems;
    // final productsRes = product.favoriteItems;
    // final prod = Provider.of<ProductsProvider>(context).items1;
    // final productId = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text('Favorite Restaurant'),
      ),
      body: GestureDetector(
        onTap: () {},
        child: GridView.builder(
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.all(10.0),
          itemCount: productsRes.length,
          itemBuilder: (ctx, index) {
            return Card(
              elevation: 10,
              shadowColor: Colors.white,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: GridTile(
                  child: GestureDetector(
                    onTap: () {
                      // Navigator.of(context).pushNamed(MealListScreen.routeName,
                      //     arguments:);
                    },
                    child: Image.network(
                      productsRes[index].imageUrl!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  footer: GridTileBar(
                    backgroundColor: Colors.black26,
                    title: Text(
                      productsRes[index].title!,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
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
      ),
    );
  }
}
