import 'package:flutter/material.dart';
import 'package:meal_app/Models/meal.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/favorites_screen.dart';
import 'package:meal_app/widgets/main_drawer.dart';

// ignore: must_be_immutable
class TabsScreen extends StatefulWidget {
  static const routeName = '/';
  List<Meal> favoriteMeals;

  TabsScreen(this.favoriteMeals, {Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': const CategoriesScreen(),
        'title': 'Categories',
      },
      {
        'page': FavoritesScreen(widget.favoriteMeals),
        'title': 'Your Favorite',
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

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
        title: Text(_pages[_selectedPageIndex]['title'] as String),
      ),
      drawer: const MainDrawer(),
      body: _pages[_selectedPageIndex]['page'] as Widget,

      // * bottom nav bar
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Colors.blue,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.blueGrey,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.fixed,
        elevation: 4,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            backgroundColor: Colors.blue,
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: Icon(Icons.favorite),
            label: 'Your Favorite',
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
