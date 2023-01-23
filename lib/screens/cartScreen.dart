import 'package:flutter/material.dart';
import 'package:food_app/components/app_bar_widget.dart';
import 'package:food_app/widgets/my_theme.dart';

import '../widgets/cart_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: AppBar().preferredSize,
        child: AppBarWidget(
          onTapIcon: () => Navigator.pop(context),
          iconColor: MyTheme.blackColor,
          backGroundColor: MyTheme.whiteColor,
          title: 'Your Cart',
          textColor: MyTheme.blackColor,
        ),
      ),
      body: const CartWidget(),
    );
  }
}
