import 'package:flutter/material.dart';
import 'package:food_app/providers/cart.dart';
import 'package:food_app/utils/routes.dart';
import 'package:food_app/widgets/adding_meal_widget.dart';
import 'package:provider/provider.dart';

class AddingMealScreen extends StatefulWidget {
  const AddingMealScreen({Key? key}) : super(key: key);
  static const routeName = '/adding-screen';

  @override
  _AddingMealScreenState createState() => _AddingMealScreenState();
}

class _AddingMealScreenState extends State<AddingMealScreen> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(
              icon: const Icon(
                Icons.add,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.editScreen);
              },
            ),
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: const SingleChildScrollView(
        child: AddingMealWidget(),
      ),
    );
  }
}
