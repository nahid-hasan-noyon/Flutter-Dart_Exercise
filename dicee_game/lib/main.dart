import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('Dicee'),
          ),
          backgroundColor: Colors.red,
        ),
        backgroundColor: Colors.red,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Row(children: [
                Expanded(
                  child: TextButton(
                    child: Image.asset('assets/images/dice$leftDiceNumber.png'),
                    onPressed: () {
                      setState(() {
                        leftDiceNumber = Random().nextInt(6) + 1;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: TextButton(
                    child:
                        Image.asset('assets/images/dice$rightDiceNumber.png'),
                    onPressed: () {
                      setState(() {
                        rightDiceNumber = Random().nextInt(6) + 1;
                      });
                    },
                  ),
                ),
              ]),
            ),
            const SizedBox(
              height: 100,
            ),
            const Text(
              'Click on dice to change.',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
