import 'package:flutter/material.dart';
import 'package:food_app/providers/products_provider.dart';
import 'package:provider/provider.dart';

class FavaoritScreen extends StatefulWidget {
  const FavaoritScreen({Key? key}) : super(key: key);

  @override
  _FavaoritScreenState createState() => _FavaoritScreenState();
}

class _FavaoritScreenState extends State<FavaoritScreen> {
  @override
  Widget build(BuildContext context) {
    final favoriteRestaurent = Provider.of<ProductsProvider>(context).items1;

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
        itemCount: favoriteRestaurent.length,
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
                    favoriteRestaurent[index].imageUrl!,
                    fit: BoxFit.cover,
                  ),
                ),
                footer: GridTileBar(
                  backgroundColor: Colors.black26,
                  title: Text(
                    favoriteRestaurent[index].title!,
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
