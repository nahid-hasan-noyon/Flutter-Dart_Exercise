import 'package:flutter/material.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Row(
        children: const [
          Text(
            '100/-',
            style: TextStyle(
              fontSize: 22,
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '120/-',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              decoration: TextDecoration.lineThrough,
              decorationColor: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
