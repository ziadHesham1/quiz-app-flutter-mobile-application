import 'package:flutter/material.dart';
import 'package:quiz/quiz.dart';
import 'package:quiz/mystack.dart';
import 'package:quiz/result.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MainScreenState();
  }
}

Color whiteColor = Colors.white;
Color blackColor = Colors.black;
Color textColor = blackColor;
Color backgroundColor = whiteColor;
var questionIndex = 0;
var totalScore = 0;
MyStack scoreStack = MyStack();

class MainScreenState extends State {
  bool isSwitched = false;
  void answerQuestion(int score) {
    totalScore += score;
    scoreStack.push(score);
    setState(() {
      questionIndex++;
    });
  }

  void resetQuiz() {
    setState(() {
      scoreStack.empty();
      totalScore = 0;
      questionIndex = 0;
    });
  }

  void goBack() {
    setState(() {
      if (questionIndex > 0) {
        questionIndex--;
        int lastScore = scoreStack.pop();
        totalScore -= lastScore;
      }
    });
  }

  themeSwitch(value) {
    setState(() {
      isSwitched = value;
      if (isSwitched) {
        //switch to dark mode
        textColor = whiteColor;
        backgroundColor = blackColor;
      } else {
        // go back to light mode
        textColor = blackColor;
        backgroundColor = whiteColor;
      }
    });
  }

  final List<Map<String, Object>> questions = [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Green', 'score': 20},
        {'text': 'Blue', 'score': 30},
        {'text': 'Yellow', 'score': 40},
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 10},
        {'text': 'Tiger', 'score': 20},
        {'text': 'Elephant', 'score': 30},
        {'text': 'Lion', 'score': 40},
      ]
    },
    {
      'questionText': 'What\'s your favorite instructor?',
      'answers': [
        {'text': 'Hassan', 'score': 10},
        {'text': 'Hassan', 'score': 20},
        {'text': 'Hassan', 'score': 30},
        {'text': 'Hassan', 'score': 40},
      ]
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: questionIndex < questions.length
            ? Text("Question ${questionIndex + 1}")
            : const Text("Result"),
        actions: [
          Switch(
            value: isSwitched,
            onChanged: (themeSwitch),
            activeColor: whiteColor,
          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        color: backgroundColor,
        child: Column(
          children: [
            Container(
              child: questionIndex < questions.length
                  ? Quiz(questions, questionIndex, answerQuestion)
                  : Result(resetQuiz, totalScore),
            ),

            // Test(totalScore, questionIndex, scoreStack.getAllValues()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: goBack,
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
