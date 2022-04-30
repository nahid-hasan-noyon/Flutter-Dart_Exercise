import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import './quiz.dart';
import 'result.dart';

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
  var _questionIndex = 0;
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': ["Red", 'Green', 'Blue', "White"],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': ["Ape", 'Snake', 'Lion', "Tiger"],
    },
    {
      'questionText': 'What\'s your favorite fruit?',
      'answers': ["Apple", 'Banana', 'Mango', "Papaya"],
    },
    {
      'questionText': 'What\'s your favorite flower?',
      'answers': ["Sunflower", 'Lotus', 'Rose', "Belly"],
    }
  ];

  // A Named function
  void _answerQuestion() {
    if (_questionIndex < _questions.length) {
      if (kDebugMode) {
        print('printing');
      }
    }
    setState(() {
      // rerender / change the UI
      _questionIndex += 1;
    });
    if (kDebugMode) {
      // if the app is in debug mode.
      print(_questionIndex); // prints the debug console
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
            : const Result(),
      ),
    );
  }
}
