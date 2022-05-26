import 'package:flutter/material.dart';

import 'package:meal_app/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget buildDrawerBanner() => Container(
        height: 120,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        alignment: Alignment.centerLeft,
        color: Colors.grey,
        child: const Center(
          child: Text(
            'Cooking up!!',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              color: Colors.blueGrey,
              fontSize: 30,
            ),
          ),
        ),
      );

  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
      onTap: () => tapHandler(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          buildDrawerBanner(),
          const SizedBox(
            height: 20,
          ),
          buildListTile(
            'Meals',
            Icons.restaurant,
            () {
              Navigator.of(context).pushNamed('/');
            },
          ),
          buildListTile(
            'Filter',
            Icons.settings,
            () => Navigator.of(context).pushNamed(FiltersScreen.routeName),
          ),
        ],
      ),
    );
  }
}
