import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/orders.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);
  static const routeName = '/order';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Order>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: Column(
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
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: cart.orderItem.length,
              itemBuilder: (ctx, i) => Dismissible(
                key: ValueKey(key),
                direction: DismissDirection.endToStart,
                // onDismissed: (direction) {
                //   Provider.of<Order>(context, listen: false).removingItems(
                //     cart.orderItem.values.toList()[i].id!,
                //   );
                // },
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
                                image: NetworkImage(cart.orderItem.values
                                    .toList()[i]
                                    .imageUrl!),
                              ))),
                    ),
                    title: Text(cart.orderItem.values.toList()[i].title!),
                    subtitle:
                        Text('₹${cart.orderItem.values.toList()[i].price!}'),
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
                                '${cart.orderItem.values.toList()[i].qauntity!} x',
                              ),
                              Text(
                                '₹${cart.orderItem.values.toList()[i].qauntity! * cart.orderItem.values.toList()[i].price!}',
                              ),
                            ],
                          ),
                        )),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
