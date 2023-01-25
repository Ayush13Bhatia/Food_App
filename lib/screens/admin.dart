import 'package:flutter/material.dart';
import 'package:food_app/components/app_bar_widget.dart';
import 'package:food_app/components/card_widget.dart';
import 'package:food_app/model/product.dart';
import 'package:food_app/providers/products_provider.dart';
import 'package:food_app/widgets/my_theme.dart';
import 'package:provider/provider.dart';

import 'add_products.dart';
import 'adding_meal_screen.dart';

class Admin extends StatelessWidget {
  const Admin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductsProvider>(context);

    final products1 = productData.items1;
    final prod = Provider.of<Product>(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: AppBar().preferredSize,
        child: AppBarWidget(
          iconWidget: Container(),
          elevation: 3,
          backGroundColor: MyTheme.primaryColor,
          title: 'Admin Window',
          action: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(AddProducts.routeName, arguments: prod.id);
              },
              child: const Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Icon(
                  Icons.add,
                  color: MyTheme.whiteColor,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: products1.length,
              itemBuilder: (context, index) => ChangeNotifierProvider.value(
                value: products1[index],
                child: CardWidget(
                  elevation: 2,
                  image: products1[index].imageUrl,
                  title: products1[index].title ?? '',
                  subtitle: products1[index].description ?? '',
                  onTap: () {
                    Navigator.of(context).pushNamed(AddingMealScreen.routeName, arguments: products1[index].id);
                  },
                  typeList: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed(AddProducts.routeName);
                          },
                          child: const Icon(
                            Icons.edit,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: const Icon(
                            Icons.delete,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
