import 'package:flutter/material.dart';

class Bottumnavigation extends StatefulWidget {
  const Bottumnavigation({Key? key}) : super(key: key);

  @override
  _BottumnavigationState createState() => _BottumnavigationState();
}

class _BottumnavigationState extends State<Bottumnavigation> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (value) {},
      backgroundColor: Theme.of(context).primaryColor,
      unselectedItemColor: Colors.pinkAccent,
      selectedItemColor: Theme.of(context).accentColor,
      currentIndex: 2,
      type: BottomNavigationBarType.shifting,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
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
    );
  }
}
