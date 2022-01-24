import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'items/cart_list_items.dart';

import '../providers/cart.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Column(
      children: <Widget>[
        Card(
          margin: const EdgeInsets.all(15),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                  'Total',
                  style: TextStyle(fontSize: 20),
                ),
                const Spacer(),
                Chip(
                  label: Text(
                    '₹${cart.totalAmount.toStringAsFixed(2)}',
                    style: TextStyle(
                      color:
                          Theme.of(context).primaryTextTheme.bodyText1!.color,
                    ),
                  ),
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                TextButton(
                  child: const Text('ORDER NOW'),
                  onPressed: () {
                    print("Clicked");
                    // Provider.of<Orders>(context, listen: false).addOrder(
                    //   cart.cartItem.values.toList(),
                    // cart.cartItem.values.toString(),
                    // cart.cartItem.values.toString(),
                    //   cart.totalAmount,
                    // );
                    cart.clear();
                  },
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
            itemCount: cart.cartItem.length,
            itemBuilder: (ctx, i) => CartListItems(
              id: cart.cartItem.values.toList()[i].id,
              title: cart.cartItem.values.toList()[i].title,
              price: cart.cartItem.values.toList()[i].price,
              qauntity: cart.cartItem.values.toList()[i].qauntity,
              imageUrl: cart.cartItem.values.toList()[i].imageUrl,
            ),
          ),
        ),
      ],
    );
  }
}
