import 'package:flutter/material.dart';

import '../bodies/category_body.dart';
import '../bodies/home_body.dart';

class CustomHomePage extends StatefulWidget {
  static const String routeName = 'custom-home-page';
  const CustomHomePage({super.key});

  @override
  State<CustomHomePage> createState() => _CustomHomePageState();
}

class _CustomHomePageState extends State<CustomHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _bodies = [
    const HomeBody(),
    const CategoryBody(),
    const Center(
      child: Text('Stores Tab'),
    ),
    const Center(
      child: Text('Cart Tab'),
    ),
    const Center(
      child: Text('Profile Tab'),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodies[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w600,
        ),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Category'),
          BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'Stores'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
