import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello World'),
        backgroundColor: const Color.fromARGB(255, 156, 159, 211),
      ),
      body: Center(
        child: Text(
          '이게 맞아??',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}