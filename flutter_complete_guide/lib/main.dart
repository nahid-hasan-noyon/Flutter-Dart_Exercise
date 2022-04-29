import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // A Named function
  void buttonWasClicked() {
    if (kDebugMode) {
      // if the app is in debug mode.
      print('button clicked'); // prints the debug console
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          //Creates a visual scaffold for material design widgets
          appBar: AppBar(
            //
            title: const Text('My First App'),
          ),
          body: Column(
            // body can hold only one widget
            // column is used to use multiple widgets
            children: [
              const Text('The Questions!'),
              // adding buttons
              // first way
              const RaisedButton(
                // striped widgets means these should be used but can be in this version.
                child: Text('Answer 1'),
                onPressed: null, // null makes the button disable
              ),
              // second way
              const ElevatedButton(
                onPressed: null,
                child: Text('Answer 2'),
              ),

              // button that do something on a click.
              // 1. Using named function
              RaisedButton(
                child: const Text('Answer 3'),
                onPressed: buttonWasClicked,
                // ! Function have to be called without ().
              ),
              ElevatedButton(
                child: const Text('Answer 4'),
                onPressed: buttonWasClicked,
              ),

              // 2. Using anonymous function
              RaisedButton(
                child: const Text('Answer 5'),
                onPressed: () {
                  if (kDebugMode) {
                    print('Answer 5 was clicked');
                  }
                },
              ),
              ElevatedButton(
                child: const Text('Answer 6'),
                onPressed: () {
                  if (kDebugMode) {
                    print('Answer 5 was clicked');
                  }
                },
              ),
            ],
          )),
    );
  }
}
