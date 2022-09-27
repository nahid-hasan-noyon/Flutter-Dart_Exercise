import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPress;

  const BottomButton({super.key, required this.label, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        color: kBottomContainerColor,
        margin: const EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBottomContainerHeight,
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 45,
            ),
          ),
        ),
      ),
    );
  }
}
