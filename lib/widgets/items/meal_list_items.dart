import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/cart.dart';

class MealListItems extends StatefulWidget {
  MealListItems(
      {Key? key,
      this.id,
      this.imageUrl,
      this.price,
      this.title,
      this.description})
      : super(key: key);
  late String? id;
  late String? title;
  late double? price;
  late String? imageUrl;
  late String? description;

  @override
  State<MealListItems> createState() => _MealListItemsState();
}

class _MealListItemsState extends State<MealListItems> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);

    return GestureDetector(
      onTap: () {
        // Navigator.of(context)
        //     .pushNamed(MealListScreen.routeName, arguments: id);
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
              Text(
                '₹ ${widget.price?.toStringAsFixed(2)}',
                style: const TextStyle(fontWeight: FontWeight.w400),
              )
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
                    IconButton(
                      onPressed: () {
                        cart.decrementCount();
                        print(cart.counter);
                        cart.removingItems(
                          widget.id!,
                        );
                      },
                      icon: const Icon(
                        Icons.remove,
                        color: Colors.pink,
                        size: 26.0,
                      ),
                    ),
                    Text(
                      '${cart.counter}',
                    ),
                    IconButton(
                      onPressed: () {
                        cart.incrementCount();
                        print(cart.counter);
                        cart.addItem(
                          widget.id!,
                          widget.price!,
                          widget.title!,
                          widget.imageUrl!,
                        );
                      },
                      icon: const Icon(
                        Icons.add,
                        color: Colors.blue,
                        size: 26.0,
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
