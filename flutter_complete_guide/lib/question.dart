import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText; //? finial is used to say that

  const Question(this.questionText, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: double.infinity, // gets the full size of screen
      child: Text(
        questionText, // string which will come via constructor
        style: const TextStyle(fontSize: 28),
        textAlign: TextAlign.center, //? TextAlign.center is a enum
        //? enum is a list of predefined values.
      ),
    );
  }
}
