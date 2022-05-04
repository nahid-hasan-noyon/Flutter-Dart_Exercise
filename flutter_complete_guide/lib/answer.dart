import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback selcetHandler;

  final String answerText;

  const Answer(this.selcetHandler, this.answerText, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: //// RaisedButton(
          ElevatedButton(
        child: Text(answerText),
        onPressed: selcetHandler,
        style: ElevatedButton.styleFrom(
          primary: Colors.purple,
          onPrimary: Colors.amber,
        ),
      ),
    );
  }
}
