import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/meal_list_screen.dart';
import '../providers/products_provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments;
    final productsRs = Provider.of<ProductsProvider>(context);

    final productsRes = productsRs.favoriteItems;
    // final prod = productsRs.findById1(productId);
    // final prod = Provider.of<Product>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text('Favorite Restaurant'),
      ),
      body: GridView.builder(
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
                    Navigator.of(context).pushNamed(MealListScreen.routeName,
                        arguments: productId);

                    // Navigator.push(
                    //   context,

                    //   MaterialPageRoute(
                    //       builder: (context) => const MealListScreen()),
                    // );
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
    );
  }
}
