import 'package:flutter/material.dart';

class HomePageGridItems extends StatelessWidget {
  const HomePageGridItems(
      {Key? key, this.id, this.title, this.imageUrl, this.description})
      : super(key: key);

  final String? id;
  final String? title;
  final String? imageUrl;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 50,
      shadowColor: Colors.yellowAccent,
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
