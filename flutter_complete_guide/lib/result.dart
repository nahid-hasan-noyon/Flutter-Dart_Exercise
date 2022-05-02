import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  const Result(this.resultScore, this.resetHandler, {Key? key})
      : super(key: key);

  String get resultPhrase {
    String reslutText = '';
    if (resultScore <= 6) {
      reslutText = 'Your taste is good';
    } else if (resultScore <= 8) {
      reslutText = 'Your taste is better';
    } else if (resultScore <= 12) {
      reslutText = 'Your taste is awesome';
    } else {
      reslutText = "Your taste is mind blowing";
    }
    return reslutText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Text(
          resultPhrase,
          style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        TextButton(
          style: TextButton.styleFrom(
            primary: Colors.orange,
          ),
          child: const Text('Restart Quiz'),
          onPressed: resetHandler,
        ),
      ],
    ));
  }
}
