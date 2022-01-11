import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/orders.dart';

import '../screens/OrderScreen.dart';

import '../providers/products_provider.dart';
import '../widgets/badge.dart';

class MealListScreen extends StatefulWidget {
  const MealListScreen({Key? key}) : super(key: key);
  static const routeName = '/meal-list-screen';

  @override
  State<MealListScreen> createState() => _MealListScreenState();
}

class _MealListScreenState extends State<MealListScreen> {
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String;

    final restaurantsData =
        Provider.of<ProductsProvider>(context).findById1(productId);

    final products = Provider.of<ProductsProvider>(context).items;

    final cart = Provider.of<Order>(context, listen: false);
    int _counter = 0;

    void _incrementCount() {
      _counter++;
    }

    void _decrementCount() {
      if (_counter == 0) {
        return;
      }
      _counter--;
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // title: const Text("restaurants"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: Consumer<Order>(
                builder: (_, order, iconChild) => Badge(
                  value: order.itemCount.toString(),
                  child: iconChild,
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.add_shopping_cart_outlined,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(OrderScreen.routeName);
                  },
                ),
              ),
            ),
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
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
                        style: TextStyle(
                            color: Colors.white,
                            background: Paint()..color = Colors.grey),
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
                              image: NetworkImage(products[index].imageUrl!),
                            ),
                          ),
                        ),
                      ),
                      title: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              products[index].title!,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '₹ ${products[index].price}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      ),
                      subtitle: Text(products[index].description!),
                      trailing: ConstrainedBox(
                          constraints: const BoxConstraints(
                            minWidth: 110,
                            minHeight: 110,
                            maxWidth: 110,
                            maxHeight: 120,
                          ),
                          child: SizedBox(
                            width: 56.0,
                            height: 50.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    _decrementCount();
                                    print(_counter);
                                    cart.removingItems(
                                      products[index].id!,
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.remove,
                                    color: Colors.pink,
                                    size: 26.0,
                                  ),
                                ),
                                Text(
                                  '$_counter',
                                ),
                                IconButton(
                                  onPressed: () {
                                    _incrementCount();
                                    print(_counter);
                                    cart.addItem(
                                      products[index].id!,
                                      products[index].price!,
                                      products[index].title!,
                                      products[index].imageUrl!,
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.add,
                                    color: Colors.blue,
                                    size: 26.0,
                                  ),
                                ),
                              ],
                            ),
                          )),
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
