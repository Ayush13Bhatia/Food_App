import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/products_provider.dart';

class MealListCard extends StatelessWidget {
  const MealListCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final restaurantsData = Provider.of<ProductsProvider>(context).findById1(productId);

    return Card(
      elevation: 7,
      color: Colors.orange,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          const Padding(padding: EdgeInsets.all(5)),
          Container(
            width: 150.0,
            height: 150.0,
            decoration: const BoxDecoration(
              color: Colors.black87,
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('images/eat.jpeg'),
              ),
            ),
          ),
          Text(
            restaurantsData.title!,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          const Text(
            "Pizza and burgers",
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 15,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Free Delivery',
                style: TextStyle(color: Colors.white, background: Paint()..color = Colors.grey),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Veg',
                style: TextStyle(
                  color: Colors.white,
                  background: Paint()..color = Colors.green,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
