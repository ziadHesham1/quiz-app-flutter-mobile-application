import 'package:flutter/material.dart';
import 'package:quiz/mainscreen.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          
          color: blackColor,
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
