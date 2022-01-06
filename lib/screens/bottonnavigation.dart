import 'package:flutter/material.dart';

import '../screens/favorite_screen.dart';
import '../screens/history_screen.dart';
import '../screens/orders_screen.dart';
import '../screens/home_page_screen.dart';

class Bottomnavigation extends StatefulWidget {
  const Bottomnavigation({Key? key}) : super(key: key);

  @override
  _BottomnavigationState createState() => _BottomnavigationState();
}

class _BottomnavigationState extends State<Bottomnavigation> {
  final List _pages = const [
    HomePage(),

    FavaoritScreen(),

    OrdersScreen(),
    HistoryScreen(),

    // {
    //   'page': HomePage(),
    //   'title': 'Categories',
    // },
    // {
    //   'page': FavaoritScreen(),
    //   'title': 'Your Favorite',
    // },
    // {
    //   'page': OrdersScreen(),
    //   'title': 'Your Favorite',
    // },
    // {
    //   'page': HistoryScreen(),
    //   'title': 'Your Favorite',
    // },
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
      body: _pages[_selectedPageIndex],
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
            label: "Orders",
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
