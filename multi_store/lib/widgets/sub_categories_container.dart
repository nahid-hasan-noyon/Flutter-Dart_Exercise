import 'package:flutter/material.dart';

import '../pages/sub_category_page.dart';

class SubCategoriesContainer extends StatelessWidget {
  const SubCategoriesContainer({
    Key? key,
    required this.size,
    required this.category,
    required this.items,
    required this.path,
  }) : super(key: key);

  final Size size;
  final String category;
  final List<String> items;
  final String path;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      bottom: 0,
      height: size.height * 0.8,
      width: size.width * 0.75,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(30),
            child: Text(
              category,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.65,
            child: GridView.count(
              crossAxisCount: 3,
              mainAxisSpacing: 70,
              crossAxisSpacing: 15,
              children: List.generate(items.length, (index) {
                return GestureDetector(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 70,
                        width: 70,
                        child: Image(
                          image: AssetImage(
                            'assets/images/$path/$path$index.jpg',
                          ),
                        ),
                      ),
                      FittedBox(
                        child: Text(items[index]),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SubCategoryPage(
                          subCategoryLabel: items[index],
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
