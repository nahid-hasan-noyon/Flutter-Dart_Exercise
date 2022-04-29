import 'package:flutter/cupertino.dart';

class Question extends StatelessWidget {

  final String questionText;  //? finial is used to say that 

  const Question(this.questionText, {Key? key}) : super(key: key); 

  @override
  Widget build(BuildContext context) {
    return Text(questionText);
  }
}