import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Transform Demo'),
        ),
        body: Container(
          color: Colors.black,
          child: Transform(
            alignment: Alignment.topRight,
            transform: Matrix4.skewY(0.3),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              color: Colors.deepOrange,
              child: const Text('Apartment for rent!'),
            ),
          ),
        ),
      ),
    );
  }
}
