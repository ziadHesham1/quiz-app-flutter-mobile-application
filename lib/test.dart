import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  final int totalScore;
  final int questionIndex;
  final String scorevalues;
  const Test(this.totalScore, this.questionIndex, this.scorevalues, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
            height: 200,
          ),
        Text(
          'totalScore : $totalScore',
          style: const TextStyle(fontSize: 30),
        ),
        Text(
          'questionIndex : $questionIndex',
          style: const TextStyle(fontSize: 30),
        ),
        Text(
          scorevalues,
          style: const TextStyle(fontSize: 30),
        ),
      ],
    );
  }
}
