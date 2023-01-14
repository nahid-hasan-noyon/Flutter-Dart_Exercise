import 'package:flutter/material.dart';

class StoresPage extends StatelessWidget {
  static const String routeName = 'stores-page';
  const StoresPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Stores',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
    );
  }
}
