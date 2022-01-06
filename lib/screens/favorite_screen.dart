import 'package:flutter/material.dart';

class FavaoritScreen extends StatefulWidget {
  const FavaoritScreen({Key? key}) : super(key: key);

  @override
  _FavaoritScreenState createState() => _FavaoritScreenState();
}

class _FavaoritScreenState extends State<FavaoritScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Favorite Screen"),
    );
  }
}
