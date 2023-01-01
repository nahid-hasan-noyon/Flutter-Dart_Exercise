import 'package:flutter/material.dart';
import 'package:multi_store/widgets/fake_search.dart';

List<ItemData> items = [
  ItemData(label: 'Men'),
  ItemData(label: 'Women'),
  ItemData(label: 'Shoes'),
  ItemData(label: 'Bags'),
  ItemData(label: 'Electronics'),
  ItemData(label: 'Accessories'),
  ItemData(label: 'Home & Garden'),
  ItemData(label: 'Kids'),
  ItemData(label: 'Beauty'),
];

class CategoryBody extends StatefulWidget {
  const CategoryBody({super.key});

  @override
  State<CategoryBody> createState() => _CategoryBodyState();
}

class _CategoryBodyState extends State<CategoryBody> {
  @override
  void initState() {
    for (var item in items) {
      item.isSelected = false;
    }
    setState(() {
      items[0].isSelected = true;
    });
    super.initState();
  }

  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const FakeSearchWidget(),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Positioned(
            left: 0,
            bottom: 0,
            child: sideNavigator(size),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: categoryView(size),
          ),
        ],
      ),
    );
  }

  Widget sideNavigator(Size size) => SizedBox(
        height: size.height * 0.8,
        width: size.width * 0.2,
        child: ListView.builder(
          itemBuilder: ((context, index) {
            return GestureDetector(
              onTap: () {
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                );
              },
              child: Container(
                height: 100,
                color: items[index].isSelected
                    ? Colors.white
                    : Colors.grey.shade300,
                child: Center(
                  child: Text(items[index].label),
                ),
              ),
            );
          }),
          itemCount: items.length,
        ),
      );

  Widget categoryView(Size size) => Container(
        height: size.height * 0.8,
        width: size.width * 0.8,
        color: Colors.white,
        child: PageView(
          controller: _pageController,
          onPageChanged: (value) {
            for (var item in items) {
              item.isSelected = false;
            }
            setState(() {
              items[value].isSelected = true;
            });
          },
          scrollDirection: Axis.vertical,
          children: const [
            Center(child: Text('Men')),
            Center(child: Text('Women')),
            Center(child: Text('Shoes')),
            Center(child: Text('Bags')),
            Center(child: Text('Electronics')),
            Center(child: Text('Accessories')),
            Center(child: Text('Home & Garden')),
            Center(child: Text('Kids')),
            Center(child: Text('Beauty')),
          ],
        ),
      );
}

class ItemData {
  String label;
  bool isSelected;
  ItemData({
    required this.label,
    this.isSelected = false,
  });
}
