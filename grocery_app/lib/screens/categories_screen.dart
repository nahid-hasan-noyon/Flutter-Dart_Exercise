import 'package:flutter/material.dart';
import 'package:grocery_app/providers/dark_theme_provider.dart';
import 'package:grocery_app/widgets/categories_widget.dart';
import 'package:provider/provider.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});

  final List<Color> gridColors = [
    Colors.green,
    Colors.red,
    Colors.blue,
    Colors.yellow,
    Colors.pink,
    Colors.orange,
  ];

  final List<Map<String, dynamic>> catInfo = [
    {
      'imgPath':
          'https://img.freepik.com/free-photo/healthy-vegetables-wooden-table_1150-38014.jpg',
      'catTitle': 'Fruits'
    },
    {
      'imgPath':
          'https://img.freepik.com/free-photo/healthy-vegetables-wooden-table_1150-38014.jpg',
      'catTitle': 'Vegetables'
    },
    {
      'imgPath':
          'https://img.freepik.com/free-photo/healthy-vegetables-wooden-table_1150-38014.jpg',
      'catTitle': 'Herbs'
    },
    {
      'imgPath':
          'https://img.freepik.com/free-photo/healthy-vegetables-wooden-table_1150-38014.jpg',
      'catTitle': 'Nuts'
    },
    {
      'imgPath':
          'https://img.freepik.com/free-photo/healthy-vegetables-wooden-table_1150-38014.jpg',
      'catTitle': 'Spices'
    },
    {
      'imgPath':
          'https://img.freepik.com/free-photo/healthy-vegetables-wooden-table_1150-38014.jpg',
      'catTitle': 'Grains'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    bool isDark = themeState.getDarkTheme;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text(
            'Categories',
            style: TextStyle(
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 240 / 250,
            children: List.generate(
              6,
              (index) => CategoriesWidget(
                catTitle: catInfo[index]['catTitle'],
                passedColor: gridColors[index],
                imgPath: catInfo[index]['imgPath'],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
