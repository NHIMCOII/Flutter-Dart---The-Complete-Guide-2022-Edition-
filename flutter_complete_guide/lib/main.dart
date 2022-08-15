import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

// State is data/info used by your app
// StatefulWidget build of 2 classes
// Class MyApp can be recreated when internal data change
// MyAppState is persistent, it's attached to the widget but cant be recreated
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

// '_' turn public class/var to -> private class/var
class _MyAppState extends State<MyApp> {
  // final != const ( runtime const != compile time const)
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color ?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Blue', 'score': 3},
        {'text': 'Yellow', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favorite animal ?',
      'answers': [
        {'text': 'Snake', 'score': 10},
        {'text': 'Horse', 'score': 5},
        {'text': 'Cat', 'score': 3},
        {'text': 'Dog', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favorite drink ?',
      'answers': [
        {'text': 'Liquor', 'score': 10},
        {'text': 'Bloody Marie', 'score': 5},
        {'text': 'Soda', 'score': 3},
        {'text': 'Juice', 'score': 1},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    // Need to wrap changable data in setState for performance
    // Force app to rerender UI (specifically that widget you call setState)

    _totalScore += score;
    setState(() {
      _questionIndex++;
    });
  }

  @override
  // Execute build when rerender needed
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Container(
            width: double.infinity,
            child: Text(
              'Quiz',
              textAlign: TextAlign.left,
            ),
          ),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
