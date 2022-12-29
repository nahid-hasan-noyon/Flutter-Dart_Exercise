import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HeartBTNWidget extends StatelessWidget {
  const HeartBTNWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // todo add action
      },
      child: const Icon(
        MdiIcons.heartOutline,
      ),
    );
  }
}
