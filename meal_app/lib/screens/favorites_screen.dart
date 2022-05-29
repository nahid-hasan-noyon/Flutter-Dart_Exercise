import 'package:flutter/material.dart';
import 'package:meal_app/Models/meal.dart';
import 'package:meal_app/widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  const FavoritesScreen(this.favoriteMeals, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return favoriteMeals.isEmpty
        ? const Center(
            child: Text('You have no favorites yet - start adding some! '),
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return MealItem(
                id: favoriteMeals[index].id,
                categories: favoriteMeals[index].categories,
                duration: favoriteMeals[index].duration,
                imageUrl: favoriteMeals[index].imageUrl,
                ingredients: favoriteMeals[index].ingredients,
                isGlutenFree: favoriteMeals[index].isGlutenFree,
                isLactoseFree: favoriteMeals[index].isLactoseFree,
                isVegan: favoriteMeals[index].isVegan,
                isVegetarian: favoriteMeals[index].isVegetarian,
                steps: favoriteMeals[index].steps,
                title: favoriteMeals[index].title,
                affordability: favoriteMeals[index].affordability,
                complexity: favoriteMeals[index].complexity,
              );
            },
            itemCount: favoriteMeals.length,
          );
  }
}
