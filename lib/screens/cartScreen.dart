import 'package:flutter/material.dart';
import 'package:food_app/components/app_bar_widget.dart';
import 'package:food_app/components/card_widget.dart';
import 'package:food_app/utils/my_theme.dart';
import 'package:provider/provider.dart';

import '../components/buy_product_card_widget.dart';
import '../providers/cart.dart';
import '../providers/orders.dart';
import '../utils/routes.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments;
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: AppBar().preferredSize,
        child: AppBarWidget(
          iconWidget: Container(),
          backGroundColor: MyTheme.whiteColor,
          title: 'Your Cart',
          textColor: MyTheme.blackColor,
        ),
      ),
      body: Column(
        children: [
          BuyProductCardWidget(
            totalPrice: cart.totalPrice.toStringAsFixed(2),
            buttonColor: cart.cartItem.isEmpty ? Colors.grey : Colors.blue,
            onPress: cart.cartItem.isEmpty
                ? null
                : () {
                    Provider.of<Orders>(context, listen: false).addOrder(
                      cart.cartItem.values.toList(),
                      cart.cartItem.values.toString(),
                      cart.cartItem.values.toString(),
                      cart.totalPrice,
                    );
                    cart.clear();
                    Navigator.of(context).pushNamed(Routes.history, arguments: productId);
                  },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cart.cartItem.length,
              itemBuilder: (ctx, i) {
                var cardList = cart.cartItem.values.toList()[i];
                return CardWidget(
                  image: cardList.imageUrl,
                  title: cardList.title,
                  subtitle: '₹${cardList.price.toString()}',
                  typeList: [
                    Text('${cart.counter} x '),
                    Text(' ₹${cardList.price}'),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
