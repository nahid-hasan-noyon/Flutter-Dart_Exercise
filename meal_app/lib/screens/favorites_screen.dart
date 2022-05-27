import 'package:flutter/material.dart';
import 'package:meal_app/Models/meal.dart';

class FavoritesScreen extends StatelessWidget {
  List<Meal> favoriteMeals;
  FavoritesScreen(this.favoriteMeals, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('The favorites :o'),
    );
  }
}
