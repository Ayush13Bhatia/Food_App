import 'package:flutter/material.dart';
import '../providers/orders.dart' show Orders;
import '../widgets/your_orders_widget.dart';
import 'package:provider/provider.dart';

class YoursOrders extends StatefulWidget {
  const YoursOrders({
    Key? key,
  }) : super(key: key);

  @override
  _YoursOrdersState createState() => _YoursOrdersState();
}

class _YoursOrdersState extends State<YoursOrders> {
  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          "You Orders",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
          itemCount: orderData.orders.length,
          itemBuilder: (ctx, i) => YourOrdersWidget(
                order: orderData.orders[i],
              )),
    );
  }
}
