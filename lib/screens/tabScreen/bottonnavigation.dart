import 'package:flutter/material.dart';

import '../favorite_screen.dart';
import '../history_screen.dart';
import '../home_page_screen.dart';

class BottomNavigation extends StatefulWidget {
  BottomNavigation({
    Key? key,
  }) : super(key: key);

  // var? showOnlyFavorites;

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  final _pages = [
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
      'page': HomePage(),
      'title': 'Your Favorite',
    },
    {
      'page': HistoryScreen(),
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
