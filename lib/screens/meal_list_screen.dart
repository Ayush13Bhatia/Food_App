import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products_provider.dart';
import '../model/product.dart';

class MealListScreen extends StatelessWidget {
  const MealListScreen({Key? key}) : super(key: key);
  static const routeName = '/meal-list-screen';

  @override
  Widget build(BuildContext context) {
    // final productId = ModalRoute.of(context)!.settings.arguments as String;
    // final loadedProductsData = Provider.of<ProductsProvider>(context);
    // final restaurantsData = loadedProductsData.items1.firstWhere(
    //   (prod) => prod.id == productId,
    // );

    // final foodData1 = loadedProductsData.items;

    final productData = Provider.of<ProductsProvider>(context);
    final products = productData.items;
    // final products1 = productData.items1;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("restaurants"),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                    width: 100,
                    child: Image(image: AssetImage('images/eat.jpeg')),
                  ),
                  const Text("Pizza and burgers"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [Text('Free Delivery'), Text('Veg')],
                  )
                ],
              ),
            ),
            ListView.builder(
              primary: false,
              shrinkWrap: true,
              padding: const EdgeInsets.all(10),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Navigator.of(context)
                    //     .pushNamed(MealListScreen.routeName, arguments: id);
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
                                  image:
                                      NetworkImage(products[index].imageUrl!),
                                ))),
                      ),
                      title: Text(products[index].title!),
                      subtitle: Text(products[index].description!),
                      trailing: Icon(Icons.add),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
