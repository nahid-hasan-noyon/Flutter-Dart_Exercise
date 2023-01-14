import 'package:flutter/material.dart';

import 'constants.dart';

class SliderBar extends StatelessWidget {
  const SliderBar({
    Key? key,
    required this.size,
    required this.category,
  }) : super(key: key);

  final Size size;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      bottom: 0,
      child: SizedBox(
        height: size.height * 0.8,
        width: size.width * 0.05,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.brown.shade200,
              borderRadius: BorderRadius.circular(25),
            ),
            child: RotatedBox(
              quarterTurns: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    category == 'Beauty' ? '' : '<<',
                    style: sliderBarTextStyle,
                  ),
                  Text(
                    category,
                    style: sliderBarTextStyle,
                  ),
                  Text(
                    category == 'Men' ? '' : '>>',
                    style: sliderBarTextStyle,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
