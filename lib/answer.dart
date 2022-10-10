import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answerText;
  final Function() answerQuestion;

  const Answer(this.answerQuestion, this.answerText, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 0,horizontal: 10),
      width: double.infinity ,
      child: ElevatedButton(
        
        onPressed: answerQuestion,
        child: Text(
          answerText,
          style: const TextStyle(fontSize: 25), 
        ),
      ),
    );
  }
}
