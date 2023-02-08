import 'package:flutter/material.dart';

class BuyProductCardWidget extends StatelessWidget {
  final Function()? onPress;
  final Color? buttonColor;
  final String? totalPrice;
  const BuyProductCardWidget({
    Key? key,
    this.buttonColor,
    this.onPress,
    this.totalPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
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
                '₹$totalPrice',
                style: TextStyle(
                  color: Theme.of(context).primaryTextTheme.bodyText1!.color,
                ),
              ),
              backgroundColor: Theme.of(context).primaryColor,
            ),
            TextButton(
              child: Text(
                'BUY NOW',
                style: TextStyle(
                  color: buttonColor,
                ),
              ),
              onPressed: onPress,
            )
          ],
        ),
      ),
    );
  }
}
