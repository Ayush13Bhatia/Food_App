import 'package:flutter/material.dart';

class MealListWidget extends StatelessWidget {
  const MealListWidget({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: const Center(
        child: Text("All food items Provider"),
      ),
    );
  }
}
