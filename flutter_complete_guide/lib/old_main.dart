import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import './question.dart';

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

  // A Named function
  void buttonWasClicked() {
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
    var questions = [
      'What\'s your favorite color?',
      'What\'s your favorite animal?'
    ];
    return MaterialApp(
      home: Scaffold(
          //Creates a visual scaffold for material design widgets
          appBar: AppBar(
            //
            title: const Text('Quizy'),
          ),
          body: Column(
            //? body can hold only one widget
            // column is used to use multiple widgets
            children: [
              Question(
                // Text(
                questions[_questionIndex],
              ),

              //*  adding buttons
              // first way
              // ? const RaisedButton(
              //   // striped widgets means these should be used but can be in this version.
              //   child: Text('Answer 1'),
              //   onPressed: null, // null makes the button disable
              // ),
              // second way
              const ElevatedButton(
                onPressed: null,
                child: Text('Answer 2'),
              ),

              //* button that do something on a click.
              // 1. Using named function
              // ? RaisedButton(
              //   child: const Text('Answer 3'),
              //   onPressed: buttonWasClicked,
              //   // ! Function have to be called without ().
              // ),
              ElevatedButton(
                child: const Text('Answer 4'),
                onPressed: buttonWasClicked,
              ),

              // 2. Using anonymous function
              // ? RaisedButton(
              //   child: const Text('Answer 5'),
              //   onPressed: () {
              //     if (kDebugMode) {
              //       print('Answer 5 was clicked');
              //     }
              //   },
              // ),
              ElevatedButton(
                child: const Text('Answer 6'),
                onPressed: () {
                  if (kDebugMode) {
                    print('Answer 6 was clicked');
                  }
                },
              ),
              // ? RaisedButton(
              //   child: const Text('change the question'),
              //   onPressed: buttonWasClicked,
              // ),
            ],
          )),
    );
  }
}
