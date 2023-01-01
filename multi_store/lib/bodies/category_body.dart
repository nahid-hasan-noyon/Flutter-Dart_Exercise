import 'package:flutter/material.dart';
import 'package:multi_store/widgets/fake_search.dart';

class CategoryBody extends StatefulWidget {
  const CategoryBody({super.key});

  @override
  State<CategoryBody> createState() => _CategoryBodyState();
}

class _CategoryBodyState extends State<CategoryBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const FakeSearchWidget(),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
    );
  }
}
