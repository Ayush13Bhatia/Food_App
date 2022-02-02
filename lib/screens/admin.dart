import 'package:flutter/material.dart';

class Admin extends StatelessWidget {
  const Admin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome to Admin Page"),
      ),
      body: const Center(
        child: Text("Admins Section"),
      ),
    );
  }
}
