import 'package:flutter/material.dart';
import 'package:food_app/screens/meal_list_screen.dart';

class HomePageGridItems extends StatelessWidget {
  const HomePageGridItems(
      {Key? key,
      this.id,
      this.productId,
      this.title,
      this.imageUrl,
      this.description,
      this.num})
      : super(key: key);

  final String? id;
  final String? productId;
  final String? title;
  final String? imageUrl;
  final String? description;
  final double? num;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: num,
      shadowColor: Colors.yellowAccent,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: GridTile(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(
                MealListScreen.routeName,
                arguments: productId,
              );
            },
            child: Image.network(
              imageUrl!,
              fit: BoxFit.cover,
            ),
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black26,
            title: Text(
              title!,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
