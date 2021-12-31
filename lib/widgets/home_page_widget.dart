import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './/widgets/items/home_page_grid_items.dart';
import './items/home_page_list_items.dart';

import '../providers/products_provider.dart';

class HomePageWidget extends StatelessWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductsProvider>(context);
    final products = productData.items;
    final products1 = productData.items1;
    return Column(
      children: [
        const Text(
          "Your Favorite Food Items",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        GridView.builder(
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.all(10.0),
          itemCount: 4,
          itemBuilder: (ctx, index) {
            return HomePageGridItems(
              id: products[index].id,
              title: products[index].title,
              imageUrl: products[index].imageUrl,
              description: products[index].description,
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
        const Text(
          "Restaurants In Near Your Area",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        ListView.builder(
          primary: false,
          shrinkWrap: true,
          padding: const EdgeInsets.all(10),
          itemCount: products1.length,
          itemBuilder: (context, index) {
            return HomePageListItems(
              id: products1[index].id,
              title: products1[index].title,
              imageUrl: products1[index].imageUrl,
              description: products1[index].description,
            );
          },
        ),
      ],
    );
  }
}
