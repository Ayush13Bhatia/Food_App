import 'package:flutter/material.dart';
import 'package:food_app/components/app_bar_widget.dart';
import 'package:food_app/components/card_widget.dart';
import 'package:food_app/utils/my_theme.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';
import '../widgets/items/cart_list_card.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  // static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: AppBar().preferredSize,
        child: AppBarWidget(
          onTapIcon: () => Navigator.pop(context),
          iconWidget: Container(),
          backGroundColor: MyTheme.whiteColor,
          title: 'Your Cart',
          textColor: MyTheme.blackColor,
        ),
      ),
      body:
          // const CartWidget(),
          Column(
        children: [
          const CartListCard(),
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
