import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './items/home_page_list_items.dart';

import '../providers/products_provider.dart';
import '../../widgets/items/home_page_grid_items.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final _formKey = GlobalKey<FormState>();
  var _search;
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductsProvider>(context);
    final products = productData.items;
    final products1 = productData.items1;
    return Column(
      children: [
        const Text(
          "Your Favorite Food Items",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        GridView.builder(
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.all(10.0),
          itemCount: 4,
          itemBuilder: (ctx, index) {
            return HomePageGridItems(
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
        Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
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

                        // fillColor: Colors.black,
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Enter search',

                        // border: OutlineInputBorder(),
                        filled: true,
                        errorStyle: TextStyle(fontSize: 15),
                      ),
                      onChanged: (value) {
                        _search = value;
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
              ],
            )),
        const Text(
          "Restaurants In Near Your Area",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        ListView.builder(
          primary: false,
          shrinkWrap: true,
          padding: const EdgeInsets.all(10),
          itemCount: products1.length,
          itemBuilder: (context, index) {
            return HomePageListItems(
              id: products1[index].id,
              title: products1[index].title,
              imageUrl: products1[index].imageUrl,
              description: products1[index].description,
            );
          },
        ),
      ],
    );
  }
}
