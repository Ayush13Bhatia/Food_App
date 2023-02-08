import 'package:flutter/material.dart';
import 'package:food_app/components/card_widget.dart';
import 'package:food_app/providers/meal_provider.dart';
import 'package:food_app/utils/my_theme.dart';
import 'package:provider/provider.dart';

import '../components/grid_widget.dart';
import '../model/product_model.dart';
import '../providers/products_provider.dart';
import '../utils/routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _searchController = TextEditingController();
    final productData = Provider.of<MealProvider>(context);
    final productData1 = Provider.of<ProductsProvider>(context);

    final products = productData.items;

    final products1 = productData1.items1;

    final productId = ModalRoute.of(context)!.settings.arguments.toString();

    List<Product>? productMeal = [];
    print(productMeal);
    // var hh;

    productMeal = products1.where((meal) {
      // productMeal!.add(meal);
      // print(meal)
      return meal.id!.contains(productId);
    }).toList();
    // final prod1 = Provider.of<Product>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.location_on,
                    size: 40,
                    color: MyTheme.primaryColor,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Deliver to",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Kotlana Solan",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    width: 56.0,
                    height: 50.0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('images/one.jpeg'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Text(
              "Your Favorite Food Items",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            // GridView.builder(
            //   physics: const NeverScrollableScrollPhysics(),
            //   shrinkWrap: true,
            //   padding: const EdgeInsets.all(10.0),
            //   itemCount: 4,
            //   itemBuilder: (ctx, index) {
            //     return GridWidget(
            //       num: 50,
            //       productId: products[index].id,
            //       id: products[index].id,
            //       title: products[index].title,
            //       imageUrl: products[index].imageUrl,
            //       description: products[index].description,
            //     );
            //   },
            //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //     crossAxisCount: 2,
            //     childAspectRatio: 3 / 2,
            //     crossAxisSpacing: 10,
            //     mainAxisExtent: 120,
            //     mainAxisSpacing: 10,
            //   ),
            // ),

            //search bar
            // Padding(
            //   padding: const EdgeInsets.only(left: 15, right: 15),
            //   child: Card(
            //     elevation: 6,
            //     color: Colors.white,
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(50.0),
            //     ),
            //     child: TextFormField(
            //       controller: _searchController,
            //       decoration: const InputDecoration(
            //         border: OutlineInputBorder(
            //           borderRadius: BorderRadius.all(Radius.circular(50)),
            //           borderSide: BorderSide(
            //             color: Colors.black,
            //             width: 5.0,
            //           ),
            //         ),
            //         prefixIcon: Icon(Icons.search),
            //         hintText: 'Enter search',
            //         filled: true,
            //         errorStyle: TextStyle(fontSize: 15),
            //       ),
            //       onChanged: (value) {
            //         value = value;
            //       },
            //       validator: (value) {
            //         if (value!.isEmpty) {
            //           return 'Please enter a search term';
            //         }
            //         return null;
            //       },
            //     ),
            //   ),
            // ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: products1.length,
                itemBuilder: (context, index) {
                  var data = products1[index];
                  return CardWidget(
                    onTap: () {
                      Navigator.of(context).pushNamed(Routes.mealScreen, arguments: products1[index].id);
                    },
                    image: data.imageUrl,
                    elevation: 50,
                    title: data.title,
                    subtitle: data.description,
                    iconTap: () {
                      data.toggleFavoriteStatus();
                    },
                    typeList: [
                      ChangeNotifierProvider.value(
                        value: data,
                        child: Consumer<Product>(
                          builder: (_, ref, child) => Icon(
                            ref.isFavorite! ? Icons.favorite : Icons.favorite_border,
                            color: MyTheme.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
