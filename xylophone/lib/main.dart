import 'package:flutter/material.dart';
// import 'package:assets_audio_player/assets_audio_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  final snackBar = SnackBar(
                    content: const Text('Yay! A SnackBar!'),
                    action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () {
                        // Some code to undo the change.
                      },
                    ),
                  );
                  // Find the ScaffoldMessenger in the widget tree
                  // and use it to show a SnackBar.
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: const Text('Click me'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
