import 'package:flutter/material.dart';

import '../pages/sub_category_page.dart';

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
          Positioned(
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
          ),
          Positioned(
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
                      children: const [
                        Text(
                          '<<',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.brown,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 10,
                          ),
                        ),
                        Text(
                          'Men',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.brown,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 10,
                          ),
                        ),
                        Text(
                          '>>',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.brown,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
