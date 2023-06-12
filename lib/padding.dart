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
          title: const Text('Padding Demo'),
        ),
        body: const PaddingTestRoute(),
      ),
    );
  }
}

class PaddingTestRoute extends StatelessWidget {
  const PaddingTestRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: const <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: Text(
              "移动开发综合实训",
              style: TextStyle(
                fontSize: 24,
                color: Colors.red,
                fontFamily: '微软雅黑',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text(
              "程宇20211900015",
              style: TextStyle(
                fontSize: 35,
                color: Colors.orange,
                fontFamily: '宋体',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Text(
              "时间：2023.6.5",
              style: TextStyle(
                fontSize: 18,
                color: Colors.blue,
                fontFamily: '楷体',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
