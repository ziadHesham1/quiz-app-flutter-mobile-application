import 'package:flutter/material.dart';
import 'package:quiz/quiz.dart';
import 'package:quiz/mystack.dart';
import 'package:quiz/result.dart';
import 'package:quiz/test.dart';

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
      if (questionIndex >= 0) {
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
      'questionText': 'What\'s your favourite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Green', 'score': 20},
        {'text': 'Blue', 'score': 30},
        {'text': 'Yellow', 'score': 40},
      ]
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 10},
        {'text': 'Tiger', 'score': 20},
        {'text': 'Elephant', 'score': 30},
        {'text': 'Lion', 'score': 40},
      ]
    },
    {
      'questionText': 'What\'s your favourite instructor?',
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
        title: const Text("Main Screen"),
        actions: [Switch(value: isSwitched, onChanged: (themeSwitch))],
      ),
      body: Column(
        
        children: [
          
          Container(
            color: backgroundColor,
            
            child: questionIndex < questions.length
                ? Quiz(questions, questionIndex, answerQuestion)
                : Result(resetQuiz, totalScore),
          ),

          // Test(totalScore, questionIndex, scoreStack.getAllValues()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: goBack,
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
