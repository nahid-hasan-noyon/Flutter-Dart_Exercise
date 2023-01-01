import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const CupertinoSearchTextField(),
          backgroundColor: Colors.white,
          elevation: 0,
          bottom: const TabBar(tabs: [
            Tab(
              child: Text(
                'Men',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            Tab(
              child: Text(
                'Men',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            Tab(
              child: Text(
                'Men',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
