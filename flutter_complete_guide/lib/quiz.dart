import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  //const Quiz({Key? key, required this.questions, required this.questionIndex, required this.answerQuestion}) : super(key: key);

  const Quiz(
      {Key? key,
      required this.questions,
      required this.answerQuestion,
      required this.questionIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      //? body can hold only one widget
      // column is used to use multiple widgets
      children: [
        Question(
          questions[questionIndex]["questionText"] as String,
        ),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(() => answerQuestion(answer['score']),
              answer['option'] as String);
        }).toList(),
      ],
    );
  }
}
