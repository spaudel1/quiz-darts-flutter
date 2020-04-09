import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favourate color?',
      'answers': ['Black', 'Red', 'White'],
    },
    {
      'questionText': 'What\'s your favourate Animal?',
      'answers': ['Lion', 'Tiger', 'Horse'],
    },
    {
      'questionText': 'What\'s your favourate sports?',
      'answers': ['Football', 'Badminton', 'Hockey'],
    },
  ];

  var _questionIndex = 0;

  void _resetQuiz() {
    setState(() {});
    _questionIndex = 0;
  }

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex,
              )
            : Result(_resetQuiz),
      ),
    );
  }
}
