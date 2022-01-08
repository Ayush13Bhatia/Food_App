import 'package:flutter/material.dart';

import '../../screens/meal_list_screen.dart';

class HomePageListItems extends StatefulWidget {
  HomePageListItems(
      {Key? key, this.id, this.title, this.imageUrl, this.description})
      : super(key: key);
  final String? id;
  final String? title;

  final String? imageUrl;
  final String? description;

  @override
  State<HomePageListItems> createState() => _HomePageListItemsState();
}

class _HomePageListItemsState extends State<HomePageListItems> {
  var isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(MealListScreen.routeName, arguments: widget.id);
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
                      image: NetworkImage(widget.imageUrl!),
                    ))),
          ),
          title: Text(widget.title!),
          subtitle: Text(widget.description!),
          trailing: IconButton(
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: Colors.redAccent,
            ),
          ),
        ),
      ),
    );
  }
}
