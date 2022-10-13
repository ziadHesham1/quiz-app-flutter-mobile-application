import 'package:flutter/material.dart';
import 'package:quiz/mainscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Container(
            color: blackColor,
            child: Text('Hello World'),
          ),
        ),
      ),
    );
  }
}