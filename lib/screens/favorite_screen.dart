import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products_provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({
    Key? key,
  }) : super(key: key);
  // bool? showFavs;

  @override
  Widget build(BuildContext context) {
    final productsRes = Provider.of<ProductsProvider>(context).items1;
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
                  onTap: () {},
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
