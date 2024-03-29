import 'package:flutter/material.dart';
import 'package:food_app/components/app_bar_widget.dart';
import 'package:food_app/utils/my_theme.dart';
import '../providers/orders.dart' show Orders;
import '../components/your_orders_widget.dart';
import 'package:provider/provider.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: AppBar().preferredSize,
        child: AppBarWidget(
          backGroundColor: MyTheme.primaryColor,
          iconWidget: Container(),
          iconThemeData: const IconThemeData(color: Colors.white),
          elevation: 4,
          title: 'History',
        ),
      ),
      body: orderData.orders.isEmpty
          ? const Center(
              child: Text("No History"),
            )
          : ListView.builder(
              itemCount: orderData.orders.length,
              itemBuilder: (ctx, i) => YourOrdersWidget(
                order: orderData.orders[i],
              ),
            ),
    );
  }
}
