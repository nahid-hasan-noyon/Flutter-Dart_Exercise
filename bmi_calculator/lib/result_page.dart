import 'package:bmi_calculator/widgets/bottom_button.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  static const routeName = '/result';

  String resultText;
  String bmiResult;
  String interpretation;

  ResultPage({
    super.key,
    required this.bmiResult,
    required this.resultText,
    required this.interpretation,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Your Result'),
          Text(resultText),
          Text(
            bmiResult.toString(),
          ),
          Text(
            interpretation,
            textAlign: TextAlign.center,
          ),
          BottomButton(
            label: 'RE-CALCULATE',
            onPress: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
