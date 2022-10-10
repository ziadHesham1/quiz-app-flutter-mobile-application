import 'package:flutter/material.dart';

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
            style: const TextStyle(fontSize: 30),
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
