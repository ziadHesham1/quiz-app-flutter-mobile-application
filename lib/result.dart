import 'package:flutter/material.dart';
import 'package:quiz/mainscreen.dart';

class Result extends StatelessWidget {
  const Result(this.resetQuiz, this.tScore, {super.key});
  final int tScore;
  final Function() resetQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$tScore',
            style: TextStyle(fontSize: 30, color: textColor),
          ),
          ElevatedButton(
            onPressed: resetQuiz,
            child: const Text(
              'restart the quiz',
              style: TextStyle(fontSize: 25),
            ),
          )
        ],
      ),
    );
  }
}
