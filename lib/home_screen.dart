import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('watch it'),
        actions:
        [
          Icon(Icons.search),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Icon(Icons.notifications),
          )],
      ),
    );
  }
}
