import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Creative Card Demo'),
        ),
        body: Center(
          child: Container(
            margin: const EdgeInsets.only(top: 50.0, left: 120.0),
            constraints: const BoxConstraints.tightFor(width: 200.0, height: 150.0),
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                colors: [Colors.red, Colors.yellow],
                center: Alignment.topLeft,
                radius: .98,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black54,
                  offset: Offset(2.0, 2.0),
                  blurRadius: 4.0,
                ),
              ],
            ),
            transform: Matrix4.rotationZ(0.2),
            alignment: Alignment.center,
            child: const Text(
              "程宇",
              style: TextStyle(color: Colors.white, fontSize: 60.0),
            ),
          ),
        ),
      ),
    );
  }
}
