import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../utils/routes.dart';

class GridWidget extends StatelessWidget {
  const GridWidget({Key? key, this.id, this.productId, this.title, this.imageUrl, this.description, this.num}) : super(key: key);

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
                Routes.mealScreen,
                arguments: productId,
              );
            },
            child: CachedNetworkImage(
              imageUrl: imageUrl ?? '',
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Image(
                image: AssetImage('images/eat.jpeg'),
              ),
            ),
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black26,
            title: Text(
              title ?? '',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
