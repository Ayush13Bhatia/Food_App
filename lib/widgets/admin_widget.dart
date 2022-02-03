import 'package:flutter/material.dart';
import 'package:food_app/model/product.dart';
import 'package:food_app/screens/add_products.dart';
import 'package:food_app/screens/adding_meal_screen.dart';
import 'package:food_app/screens/edit_product_screen.dart';
import 'package:food_app/screens/meal_list_screen.dart';
import 'package:provider/provider.dart';

class AdminWidget extends StatelessWidget {
  const AdminWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prod = Provider.of<Product>(context);

    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(AddingMealScreen.routeName, arguments: prod.id);
      },
      child: Card(
          elevation: 50,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: ListTile(
            leading: ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: 44,
                minHeight: 44,
                maxWidth: 44,
                maxHeight: 44,
              ),
              child: Container(
                  width: 56.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(prod.imageUrl!),
                      ))),
            ),
            title: Text(prod.title!),
            subtitle: Text(
              prod.description!,
            ),
            trailing: SizedBox(
              width: 100,
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      Navigator.of(context).pushNamed(AddProducts.routeName);
                    },
                    color: Theme.of(context).errorColor,
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {},
                    color: Theme.of(context).errorColor,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
