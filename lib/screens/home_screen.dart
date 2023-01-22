import 'package:flutter/material.dart';
import 'package:food_app/components/card_widget.dart';
import 'package:food_app/widgets/my_theme.dart';
import 'package:provider/provider.dart';

import '../model/meals.dart';
import '../model/product.dart';
import '../providers/products_provider.dart';
import '../widgets/Items/home_page_list_items.dart';
import '../widgets/items/home_page_grid_items.dart';
import 'meal_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductsProvider>(context);
    final prod = Provider.of<Meal>(context);

    final products = productData.items;

    final products1 = productData.items1;

    final productId = ModalRoute.of(context)!.settings.arguments.toString();

    List<Product>? productMeal = [];
    print(productMeal);
    // var hh;

    productMeal = products1.where((meal) {
      // productMeal!.add(meal);
      // print(meal)
      return meal.id!.contains(productId);
    }).toList();
    final prod1 = Provider.of<Product>(context);
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
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.all(10.0),
              itemCount: 4,
              itemBuilder: (ctx, index) {
                return HomePageGridItems(
                  num: 50,
                  productId: products[index].id,
                  id: products[index].id,
                  title: products[index].title,
                  imageUrl: products[index].imageUrl,
                  description: products[index].description,
                );
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 10,
                mainAxisExtent: 120,
                mainAxisSpacing: 10,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Card(
                elevation: 6,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 5.0,
                      ),
                    ),
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Enter search',
                    filled: true,
                    errorStyle: TextStyle(fontSize: 15),
                  ),
                  onChanged: (value) {
                    value = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a search term';
                    }
                    return null;
                  },
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: products1.length,
                itemBuilder: (context, index) => ChangeNotifierProvider.value(
                  value: products1[index],
                  child: CardWidget(
                    onTap: () {
                      Navigator.of(context).pushNamed(MealListScreen.routeName, arguments: products1[index].id);
                    },
                    image: products1[index].imageUrl,
                    elevation: 50,
                    title: products1[index].title,
                    subtitle: products1[index].description,
                    iconTap: () {
                      prod1.toggleFavoriteStatus();
                    },
                    typeList: [
                      Icon(
                        prod1.isFavorite! ? Icons.favorite : Icons.favorite_border,
                        color: MyTheme.primaryColor,
                      ),
                    ],
                  ),
                  // const HomePageListItems(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
