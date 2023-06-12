import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Button Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              icon: Icon(Icons.send),
              label: Text("发送"),
              onPressed: () {
                _showInputDialog(context);
              },
            ),
            OutlinedButton.icon(
              icon: Icon(Icons.add),
              label: Text("添加"),
              onPressed: _onPressed,
            ),
            TextButton.icon(
              icon: Icon(Icons.info),
              label: Text("详情"),
              onPressed: _onPressed,
            ),
          ],
        ),
      ),
    );
  }

  void _onPressed() {
    print('Button pressed!');
  }

  void _showInputDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('输入信息'),
          content: TextField(
            controller: _textController,
            decoration: InputDecoration(hintText: '请输入信息'),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                String inputText = _textController.text;
                print('发送: $inputText');
                Navigator.of(context).pop();
              },
              child: Text('发送'),
            ),
          ],
        );
      },
    );
  }
}
