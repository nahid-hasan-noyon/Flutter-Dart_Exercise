import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

// void main() {
//   runApp(const MyApp());
// }
void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyAppstate(); //? adding "_" changes that thing to private that can't be accessed from the outside of that current file.
  }
}

class _MyAppstate extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'option': 'Red', 'score': 1},
        {'option': 'Green', 'score': 2},
        {'option': 'Blue', 'score': 3},
        {'option': 'White', 'score': 4},
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'option': 'Ape', 'score': 1},
        {'option': 'Snake', 'score': 2},
        {'option': 'Lion', 'score': 3},
        {'option': 'Tiger', 'score': 4}
      ],
    },
    {
      'questionText': 'What\'s your favorite fruit?',
      'answers': [
        {'option': 'Apple', 'score': 1},
        {'option': 'Banana', 'score': 2},
        {'option': 'Mango', 'score': 3},
        {'option': 'Papaya', 'score': 4}
      ],
    },
    {
      'questionText': 'What\'s your favorite flower?',
      'answers': [
        {'option': 'Sunflower', 'score': 1},
        {'option': 'Lotus', 'score': 2},
        {'option': 'Rose', 'score': 3},
        {'option': 'Belly', 'score': 4}
      ],
    }
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  // A Named function
  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      // rerender / change the UI
      _questionIndex += 1;
    });
    if (kDebugMode) {
      // if the app is in debug mode.
      print(_totalScore); // prints the debug console
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //Creates a visual scaffold for material design widgets
        appBar: AppBar(
          title: const Text('Quizy'),
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
