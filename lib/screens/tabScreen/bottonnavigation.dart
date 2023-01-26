import 'package:flutter/material.dart';
import 'package:food_app/screens/admin.dart';
import 'package:food_app/screens/history.dart';
import 'package:food_app/widgets/my_theme.dart';

import '../favorite_screen.dart';
import '../home_screen.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({
    Key? key,
  }) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  final _pages = const [
    {
      'page': HomeScreen(),
      'title': 'Categories',
    },
    {
      'page': FavoriteScreen(),
      'title': 'Your Favorite',
    },
    {
      'page': Admin(),
      'title': 'Your Favorite',
    },
    {
      'page': History(),
      'title': 'Your Favorite',
    },
  ];
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPageIndex]['page'] as Widget?,
      bottomNavigationBar: BottomNavigationBar(
        // fixedColor: Colors.white,
        onTap: _selectPage,
        backgroundColor: MyTheme.primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white,

        currentIndex: _selectedPageIndex,

        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favorites",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.offline_bolt_outlined),
            label: "Admin",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pages_sharp),
            label: "History",
          ),
        ],
      ),
    );
  }
}
