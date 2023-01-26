import 'package:flutter/material.dart';
import 'package:food_app/providers/cart.dart';
import 'package:food_app/screens/edit_product_screen.dart';
import 'package:food_app/utils/routes.dart';
import 'package:provider/provider.dart';

class AddingMealItems extends StatefulWidget {
  AddingMealItems({
    Key? key,
    this.id,
    this.imageUrl,
    this.price,
    this.title,
    this.description,
  }) : super(key: key);

  late String? id;
  late String? title;
  late double? price;
  late String? imageUrl;
  late String? description;

  @override
  _AddingMealItemsState createState() => _AddingMealItemsState();
}

class _AddingMealItemsState extends State<AddingMealItems> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(Routes.editScreen);
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
                ),
              ),
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          subtitle: Text(widget.description!),
          trailing: ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: 110,
                minHeight: 110,
                maxWidth: 110,
                maxHeight: 120,
              ),
              child: SizedBox(
                width: 56.0,
                height: 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '₹ ${widget.price?.toStringAsFixed(2)}',
                      style: const TextStyle(fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
