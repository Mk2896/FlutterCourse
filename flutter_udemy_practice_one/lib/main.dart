import 'package:flutter/material.dart';

import 'quiz.dart';
import 'result.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  final List<Map<String, dynamic>> _questions = const [
    {
      'questionText': 'What\s Your Favorite Animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 10},
        {'text': 'Crocodile', 'score': 45},
        {'text': 'Snake', 'score': 20},
        {'text': 'Lion', 'score': 35}
      ],
    },
    {
      'questionText': 'What\s Your Favorite Color?',
      'answers': [
        {'text': 'Red', 'score': 10},
        {'text': 'Grey', 'score': 45},
        {'text': 'Violet', 'score': 20},
        {'text': 'Blue', 'score': 35},
        {'text': 'Black', 'score': 50},
      ],
    },
    {
      'questionText': 'What\s Your Favorite Sport?',
      'answers': [
        {'text': 'Cricket', 'score': 15},
        {'text': 'Football', 'score': 50},
        {'text': 'Tennis', 'score': 35},
      ],
    },
  ];

  int _totalScore = 0;
  List<int> _selectedScore = List<int>.filled(3, 0);

  void _answerQuestion(int score) {
    _selectedScore[_questionIndex] = score;
  }

  void _nextQuestion() {
    _totalScore = 0;
    _selectedScore.forEach((element) {
      _totalScore += element;
    });

    if (_questionIndex < _questions.length &&
        _selectedScore[_questionIndex] != 0) {
      setState(() {
        _questionIndex++;
      });
    }
  }

  void _prevQuestion() {
    if (_questionIndex > 0) {
      setState(() {
        _questionIndex--;
      });
    }
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
      _selectedScore = List<int>.filled(3, 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                question: _questions[_questionIndex],
                answerSelectHandler: _answerQuestion,
                nextSelectHandler: _nextQuestion,
                prevSelectHandler: _prevQuestion,
              )
            : Result(
                totalScore: _totalScore,
                resetSubmitHandler: _resetQuiz,
              ),
      ),
    );
  }
}
