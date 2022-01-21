import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/product.dart';
import '../../screens/meal_list_screen.dart';
import '../../providers/products_provider.dart';

class HomePageListItems extends StatefulWidget {
  const HomePageListItems({
    Key? key,

    // this.id, this.title, this.imageUrl, this.description
  }) : super(key: key);

  // final String? id;
  // final String? title;
  // final String? imageUrl;
  // final String? description;

  @override
  State<HomePageListItems> createState() => _HomePageListItemsState();
}

class _HomePageListItemsState extends State<HomePageListItems> {
  // var isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final prod = Provider.of<Product>(context);
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(MealListScreen.routeName, arguments: prod.id);
      },
      child: Card(
          elevation: 50,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: ListTile(
            leading: ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: 44,
                minHeight: 44,
                maxWidth: 44,
                maxHeight: 44,
              ),
              child: Container(
                  width: 56.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(prod.imageUrl!),
                      ))),
            ),
            title: Text(prod.title!),
            subtitle: Text(prod.description!),
            trailing: IconButton(
              onPressed: () {
                prod.toggleFavoriteStatus();
              },
              icon: Icon(
                prod.isFavorite! ? Icons.favorite : Icons.favorite_border,
                color: Colors.redAccent,
              ),
            ),
          )),
    );
  }
}
