import 'package:flutter/material.dart';

import 'slider_bar.dart';
import 'sub_categories_container.dart';

class SubCategoryBuilder extends StatelessWidget {
  final String category;
  final List<String> items;
  const SubCategoryBuilder({
    super.key,
    required this.category,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    String path = category.toLowerCase();
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Stack(
        children: [
          SubCategoriesContainer(
              size: size, category: category, items: items, path: path),
          SliderBar(size: size, category: category),
        ],
      ),
    );
  }
}
