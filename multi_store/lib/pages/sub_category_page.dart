import 'package:flutter/material.dart';

class SubCategoryPage extends StatelessWidget {
  static const String routeName = '/sub-category-page';
  const SubCategoryPage({super.key, required this.subCategoryLabel});
  final String subCategoryLabel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Center(
          child: Text(
            subCategoryLabel,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        elevation: 0,
      ),
    );
  }
}
