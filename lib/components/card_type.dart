import 'package:flutter/material.dart';

class CardType extends StatelessWidget {
  final List<Widget>? types;
  const CardType({Key? key, this.types}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: types ?? [],
    );
  }
}
