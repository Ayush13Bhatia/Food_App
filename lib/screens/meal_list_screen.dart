import 'package:flutter/material.dart';

class MealListScreen extends StatelessWidget {
  const MealListScreen({Key? key}) : super(key: key);
  static const routeName = '/meal-list-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('title!'),
      ),
      body: const Center(
        child: Text("All food items"),
      ),
    );
  }
}
