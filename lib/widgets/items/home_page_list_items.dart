import 'package:flutter/material.dart';

import '../../screens/meal_list_screen.dart';

class HomePageListItems extends StatelessWidget {
  const HomePageListItems(
      {Key? key, this.id, this.title, this.imageUrl, this.description})
      : super(key: key);
  final String? id;
  final String? title;

  final String? imageUrl;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(MealListScreen.routeName, arguments: id);
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
                      image: NetworkImage(imageUrl!),
                    ))),
          ),
          title: Text(title!),
          subtitle: Text(description!),
          trailing: const Icon(Icons.favorite_border),
        ),
      ),
    );
  }
}
