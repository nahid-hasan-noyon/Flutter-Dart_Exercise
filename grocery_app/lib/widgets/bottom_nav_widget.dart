import 'package:flutter/material.dart';
import 'package:grocery_app/providers/dark_theme_provider.dart';
import 'package:grocery_app/screens/cart_screen.dart';
import 'package:grocery_app/screens/categories_screen.dart';
import 'package:grocery_app/screens/home_screen.dart';
import 'package:grocery_app/screens/user_screen.dart';
import 'package:provider/provider.dart';

class BottomNavWidget extends StatefulWidget {
  const BottomNavWidget({super.key});

  @override
  State<BottomNavWidget> createState() => _BottomNavWidgetState();
}

class _BottomNavWidgetState extends State<BottomNavWidget> {
  int _selectedIndex = 0;
  final List<Map<String, dynamic>> _pages = [
    {'page': const HomeScreen(), 'title': "Home Screen"},
    {'page': const CategoriesScreen(), 'title': "Categories Screen"},
    {'page': const CartScreen(), 'title': "Cart Screen"},
    {'page': const UserScreen(), 'title': "User Screen"},
  ];

  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    bool isDark = themeState.getDarkTheme;
    return Scaffold(
      // appBar: AppBar(title: Text(_pages[_selectedIndex]['title'])),
      body: _pages[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: isDark ? Theme.of(context).cardColor : Colors.white,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        unselectedItemColor: isDark ? Colors.white10 : Colors.black12,
        selectedItemColor: isDark ? Colors.lightBlue[200] : Colors.black87,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        onTap: _selectedPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.category_outlined,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_basket_outlined,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.manage_accounts,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
