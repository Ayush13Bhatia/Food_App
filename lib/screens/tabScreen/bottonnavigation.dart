import 'package:flutter/material.dart';
import 'package:food_app/screens/admin.dart';
import 'package:food_app/screens/yoursOrders.dart';

import '../favorite_screen.dart';
import '../home_page_screen.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({
    Key? key,
  }) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  final _pages = const [
    // HomePage(),

    // FavaoritScreen(),

    // OrdersScreen(),
    // HistoryScreen(),

    {
      'page': HomePage(),
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
      'page': YoursOrders(),
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
      // appBar: AppBar(),
      body: _pages[_selectedPageIndex]['page'] as Widget?,
      bottomNavigationBar: BottomNavigationBar(
        // fixedColor: Colors.white,
        onTap: _selectPage,
        backgroundColor: Colors.red,
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
