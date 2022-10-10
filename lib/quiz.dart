import 'package:flutter/material.dart';
import 'package:quiz/answer.dart';
import 'package:quiz/question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> qList;
  final int qIndex;
  final Function(int s) answerQuestion;

  const Quiz(
    this.qList,
    this.qIndex,
    this.answerQuestion, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var questionList = qList[qIndex]['questionText'].toString();
    var answerList = qList[qIndex]['answers'] as List<Map<String, Object>>;
    return Column(
      children: [
        Question(questionList),
        ...answerList.map((ans) {
          return Answer(
              () => answerQuestion(
                    int.parse(
                      ans['score'].toString(),
                    ),
                  ),
              ans['text'].toString());
        })
      ],
    );
  }
}
