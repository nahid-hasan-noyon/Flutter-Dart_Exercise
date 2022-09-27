import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPress;

  const RoundIconButton({
    super.key,
    required this.icon,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      elevation: 6.0,
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: const CircleBorder(),
      fillColor: const Color(0xff4c4f5e),
      child: Icon(icon),
    );
  }
}
