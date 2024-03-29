import 'package:flutter/cupertino.dart';

import '../model/meals_model.dart';

final List<Meal> _meals = [
  Meal(
    id: 'm1',
    mealCategories: [
      'p1',
    ],
    title: 'Cheese Burgers',
    description: 'A Cheese Boxt - it is pretty Foody!',
    price: 29.99,
    imageUrl: 'https://image.shutterstock.com/image-photo/tasty-appetizing-hamburger-cheeseburger-260nw-1053796058.jpg',
  ),
  Meal(
    id: 'm2',
    mealCategories: [
      'p2',
    ],
    title: 'Pizza',
    description: 'A nice pair of Cheese .',
    price: 59.99,
    imageUrl:
        'https://3l5bg25uxqj3020o19dc5dz5-wpengine.netdna-ssl.com/wp-content/uploads/2016/08/paleo-pizza-margarita-cropped-vertical-separated-3628.jpg',
  ),
  Meal(
    id: 'm3',
    mealCategories: [
      'p3',
    ],
    title: 'Juices',
    description: 'Warm and cozy - exactly what you need for the winter.',
    price: 19.99,
    imageUrl: 'https://media.istockphoto.com/photos/three-fruits-and-vegetables-detox-drinks-picture-id641975492',
  ),
  Meal(
      id: 'm4',
      mealCategories: [
        'p4',
      ],
      title: 'A Pan Cake',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://media.istockphoto.com/photos/pancakes-with-berries-and-maple-syrup-picture-id161170090?b=1&k=20&m=161170090&s=170667a&w=0&h=pgtnBdQKLvZz7WOmBcZhY_EXDGeATOS2jc_FJF9GbnE='),
  Meal(
      id: 'm5',
      mealCategories: [
        'p4',
      ],
      title: 'Belgian waffle',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl: 'https://static.toiimg.com/thumb/62391293.cms?width=1200&height=900'),
  Meal(
    id: 'm10',
    mealCategories: [
      'p1',
    ],
    title: 'veg Burgers',
    description: 'A Cheese Boxt - it is pretty Foody!',
    price: 29.99,
    imageUrl: 'https://image.shutterstock.com/image-photo/tasty-appetizing-hamburger-cheeseburger-260nw-1053796058.jpg',
  ),
];

class MealProvider with ChangeNotifier {
  int counter = 0;
  void incrementCounter(int index) {
    counter++;
    notifyListeners();
  }

  List<Meal> get items {
    return [..._meals];
  }

  Meal findById(String id) {
    return _meals.firstWhere((prod) => prod.id == id);
  }
}
