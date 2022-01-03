import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products_provider.dart';

class MealListScreen extends StatelessWidget {
  const MealListScreen({Key? key}) : super(key: key);
  static const routeName = '/meal-list-screen';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final loadedProductsData = Provider.of<ProductsProvider>(context);
    final restaurantsData = loadedProductsData.items1.firstWhere(
      (prod) => prod.id == productId,
    );

    final foodData1 = loadedProductsData.items;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(restaurantsData.title!),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                height: 100,
                width: 100,
                child: const Image(image: AssetImage('images/eat.jpeg')),
              ),
              const Text("Pizza and burgers"),
            ],
          ),
          const Text('Free Delivery'),
          const Text('Veg')
        ],
      ),
    );
  }
}
