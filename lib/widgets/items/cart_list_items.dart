import 'package:flutter/material.dart';

class CartListItems extends StatelessWidget {
  const CartListItems(
      {Key? key, this.id, this.title, this.price, this.qauntity, this.imageUrl})
      : super(key: key);
  final String? id;
  final String? title;
  final double? price;
  final int? qauntity;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(key),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        // Provider.of<Orders>(context, listen: false).removingItems(
        //   cart.orderItem.values.toList()[i].id!,
        // );
      },
      background: Container(
        color: Theme.of(context).errorColor,
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
      ),
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
          subtitle: Text('₹${price!}'),
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
                      '${qauntity!} x',
                    ),
                    Text(
                      '₹${qauntity! * price!}',
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
