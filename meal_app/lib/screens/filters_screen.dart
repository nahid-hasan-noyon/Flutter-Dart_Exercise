import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  const FiltersScreen({Key? key}) : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  late final _glutenFree = false;
  final _vegetarian = false;
  final _vegan = false;
  final _lactoseFree = false;

  Widget _buildSwitchListTile(
      String title, var currentValue, String description) {
    return SwitchListTile(
      title: Text(
        title,
        style: const TextStyle(fontSize: 26),
      ),
      value: currentValue,
      subtitle: Text(description),
      onChanged: (newValue) {
        setState(
          () {
            currentValue = newValue;
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your filters'),
        ),
        drawer: const MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: const Center(
                child: Text(
                  'Adjust Your meal selection.',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                ),
              ),
            ),
            Expanded(
                child: ListView(children: [
              _buildSwitchListTile(
                'Gluten-free',
                _glutenFree,
                'Only include gluten-free meals.',
              ),
              _buildSwitchListTile(
                'Lactose-free',
                _lactoseFree,
                'Only include lactose-free meals.',
              ),
              _buildSwitchListTile(
                'Vegetarian',
                _vegetarian,
                'Only include Vegetarian meals.',
              ),
              _buildSwitchListTile(
                'Vegan',
                _vegan,
                'Only include vegan meals.',
              ),
            ]))
          ],
        ));
  }
}
