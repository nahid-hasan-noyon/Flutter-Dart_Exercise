import 'package:flutter/material.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/favorites_screen.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = '/';

  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Widget> _pages = [
    const CategoriesScreen(),
    const FavoritesScreen(),
  ];

  late int _selectedPageIndex = 0;
  String title = 'Categories';

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
      if (_selectedPageIndex == 0) {
        title = 'Categories';
      } else if (_selectedPageIndex == 1) {
        title = 'Your Favorites';
      }
    });
  }

  String cat = 'Categories';
  final String label = 'Categories';

  @override
  Widget build(BuildContext context) {
    // * creates a tab bar above.
    // return DefaultTabController(
    //   length: 2,
    //   initialIndex: 0,
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: const Text('Meals'),
    //       bottom: const TabBar(tabs: [
    //         Tab(
    //           icon: Icon(Icons.category),
    //           text: 'Categories',
    //         ),
    //         Tab(
    //           icon: Icon(Icons.favorite),
    //           text: 'Categories',
    //         ),
    //       ]),
    //     ),
    //     body:
    //         const TabBarView(children: [CategoriesScreen(), FavoritesScreen()]),
    //   ),
    // );
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      drawer: const MainDrawer(),
      body: _pages[_selectedPageIndex],

      // * bottom nav bar
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Colors.blue,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.blueGrey,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.fixed,
        elevation: 4,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.category),
            backgroundColor: Colors.blue,
            label: label,
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: const Icon(Icons.favorite),
            label: label,
          )
        ],
      ),

      // * found from internet
      // bottomNavigationBar: BottomNavigationBar(
      //   selectedFontSize: 16,
      //   currentIndex: _selectedIndex,
      //   selectedItemColor: Colors.yellow,
      //   unselectedItemColor: Colors.black45,
      //   onTap: _onItemTapped,
      //   showUnselectedLabels: false,
      //   items: <BottomNavigationBarItem>[
      //     const BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.home,
      //       ),
      //       label: Text(
      //         ' Home',
      //       ),
      //       backgroundColor: Colors.red,
      //     ),
      //     const BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.thumb_up,
      //       ),
      //       label: Text(
      //         " Likes",
      //       ),
      //       backgroundColor: Colors.blue,
      //     ),
      //     const BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.search,
      //       ),
      //       label: Text(
      //         ' Search',
      //       ),
      //       backgroundColor: Colors.pink,
      //     ),
      //     const BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.star,
      //       ),
      //       label: Text(
      //         " Profile",
      //       ),
      //       backgroundColor: Colors.purple,
      //     ),
      //   ],
      // ),
    );
  }
}
