import 'package:flutter/material.dart';
import 'package:quiz/mainscreen.dart';

class Question extends StatelessWidget {
  final String questionText;
  const Question(this.questionText, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      questionText,
      style: TextStyle(fontSize: 30, color: textColor,),textAlign:TextAlign.center ,
    );
  }
}
