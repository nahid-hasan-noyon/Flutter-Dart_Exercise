import 'package:flutter/material.dart';

import 'model/quiz_brain.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  QuizScreenState createState() => QuizScreenState();
}

class QuizScreenState extends State<QuizScreen> {
  QuizBrain quizBrain = QuizBrain();

  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userPickedAnswer) {
    setState(() {
      bool correctAnswer = quizBrain.getQuestionAnswer();
      if (correctAnswer == userPickedAnswer) {
        quizBrain.addAnsweredCorrectly();
        scoreKeeper.add(
          const Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
      } else {
        scoreKeeper.add(
          const Icon(
            Icons.close,
            color: Colors.red,
          ),
        );
      }
      if (quizBrain.nextQuestion()) {
        int correctlyAnswered = quizBrain.showAnsweredCorrectly();
        showDialog<String>(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Game Over'),
            content: Text(
              'You correctly answered $correctlyAnswered out of 13 question.',
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  quizBrain.resetQuestionNumber();
                  scoreKeeper.clear();
                },
                child: const Text('Reset'),
              ),
            ],
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.green,
              ),
              onPressed: quizBrain.isQuestionFinished()
                  ? null
                  : () {
                      checkAnswer(true);
                    },
              child: const Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              onPressed: quizBrain.isQuestionFinished()
                  ? null
                  : () {
                      checkAnswer(false);
                    },
              child: const Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}

// todo on clicking reset button remove the icons from bottom. 