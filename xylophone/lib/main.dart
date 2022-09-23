import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            button(context, Colors.blue, 1),
            button(context, Colors.red, 2),
            button(context, Colors.orange, 3),
            button(context, Colors.yellow, 4),
            button(context, Colors.green, 5),
            button(context, Colors.purple, 6),
            button(context, Colors.grey, 7),
          ],
        ),
      ),
    );
  }

  Expanded button(BuildContext context, Color color, int num) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
        ),
        onPressed: () {
          final snackBar = SnackBar(
            content: Center(
              child: Text('$num'),
            ),
            duration: const Duration(microseconds: 1),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: const Text(' '),
      ),
    );
  }
}
