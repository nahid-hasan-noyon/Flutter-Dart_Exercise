import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey[900],
          title: const Center(
            child: Text('I am Rich'),
          ),
        ),
        backgroundColor: Colors.blueGrey,
        body: const Center(
          child: Image(
            image: AssetImage('assets/images/rich_food.jpg'),
          ),
        ),
      ),
    ),
  );
}
