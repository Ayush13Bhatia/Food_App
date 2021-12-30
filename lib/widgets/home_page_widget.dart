import 'package:flutter/material.dart';
import 'package:food_app/widgets/restaurentList/home_page_grid_items.dart';
import 'restaurentList/home_page_list_items.dart';
import '../../model/product.dart';

class HomePageWidget extends StatelessWidget {
  HomePageWidget({Key? key}) : super(key: key);

  final List<Product> loadedProducts = [
    Product(
      id: 'p1',
      title: 'Cheese Box',
      description: 'A Cheese Boxt - it is pretty Foody!',
      price: 29.99,
      imageUrl:
          'https://image.shutterstock.com/image-photo/tasty-appetizing-hamburger-cheeseburger-260nw-1053796058.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Moutains Pizza Club',
      description: 'A nice pair of Cheese .',
      price: 59.99,
      imageUrl:
          'https://3l5bg25uxqj3020o19dc5dz5-wpengine.netdna-ssl.com/wp-content/uploads/2016/08/paleo-pizza-margarita-cropped-vertical-separated-3628.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Juice Shop',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://media.istockphoto.com/photos/three-fruits-and-vegetables-detox-drinks-picture-id641975492',
    ),
    Product(
      id: 'p4',
      title: 'A Pan Club',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://media.istockphoto.com/photos/pancakes-with-berries-and-maple-syrup-picture-id161170090?b=1&k=20&m=161170090&s=170667a&w=0&h=pgtnBdQKLvZz7WOmBcZhY_EXDGeATOS2jc_FJF9GbnE=',
    ),
    Product(
      id: 'p2',
      title: 'Moutains Pizza Club',
      description: 'A nice pair of Cheese .',
      price: 59.99,
      imageUrl:
          'https://3l5bg25uxqj3020o19dc5dz5-wpengine.netdna-ssl.com/wp-content/uploads/2016/08/paleo-pizza-margarita-cropped-vertical-separated-3628.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Juice Shop',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://media.istockphoto.com/photos/three-fruits-and-vegetables-detox-drinks-picture-id641975492',
    ),
    Product(
      id: 'p4',
      title: 'A Pan Club',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://media.istockphoto.com/photos/pancakes-with-berries-and-maple-syrup-picture-id161170090?b=1&k=20&m=161170090&s=170667a&w=0&h=pgtnBdQKLvZz7WOmBcZhY_EXDGeATOS2jc_FJF9GbnE=',
    ),
  ];
  final List<Product> loadedProducts2 = [
    Product(
      id: 'p1',
      title: 'Burgers',
      description: 'A Cheese Boxt - it is pretty Foody!',
      price: 29.99,
      imageUrl:
          'https://image.shutterstock.com/image-photo/tasty-appetizing-hamburger-cheeseburger-260nw-1053796058.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Pizza',
      description: 'A nice pair of Cheese .',
      price: 59.99,
      imageUrl:
          'https://3l5bg25uxqj3020o19dc5dz5-wpengine.netdna-ssl.com/wp-content/uploads/2016/08/paleo-pizza-margarita-cropped-vertical-separated-3628.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Juices',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://media.istockphoto.com/photos/three-fruits-and-vegetables-detox-drinks-picture-id641975492',
    ),
    Product(
        id: 'p4',
        title: 'A Pan Cake',
        description: 'Prepare any meal you want.',
        price: 49.99,
        imageUrl:
            'https://media.istockphoto.com/photos/pancakes-with-berries-and-maple-syrup-picture-id161170090?b=1&k=20&m=161170090&s=170667a&w=0&h=pgtnBdQKLvZz7WOmBcZhY_EXDGeATOS2jc_FJF9GbnE='),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridView.builder(
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.all(10.0),
          itemCount: 4,
          itemBuilder: (ctx, index) {
            return HomePageGridItems(
              id: loadedProducts2[index].id,
              title: loadedProducts2[index].title,
              imageUrl: loadedProducts2[index].imageUrl,
              description: loadedProducts2[index].description,
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
        ListView.builder(
          primary: false,
          shrinkWrap: true,
          padding: const EdgeInsets.all(10),
          itemCount: loadedProducts.length,
          itemBuilder: (context, index) {
            return HomePageListItems(
              id: loadedProducts[index].id,
              title: loadedProducts[index].title,
              imageUrl: loadedProducts[index].imageUrl,
              description: loadedProducts[index].description,
            );
          },
        ),
      ],
    );
  }
}
