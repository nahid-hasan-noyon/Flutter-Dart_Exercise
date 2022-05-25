import 'package:flutter/material.dart';

import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meal';
  const CategoryMealsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArg =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryId = routeArg['id'];
    final categoryTitle = routeArg['title'];
    final categoryMeals = dummyMeal.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: categoryMeals[index].id,
            categories: categoryMeals[index].categories,
            duration: categoryMeals[index].duration,
            imageUrl: categoryMeals[index].imageUrl,
            ingredients: categoryMeals[index].ingredients,
            isGlutenFree: categoryMeals[index].isGlutenFree,
            isLactoseFree: categoryMeals[index].isLactoseFree,
            isVegan: categoryMeals[index].isVegan,
            isVegetarian: categoryMeals[index].isVegetarian,
            steps: categoryMeals[index].steps,
            title: categoryMeals[index].title,
            affordability: categoryMeals[index].affordability,
            complexity: categoryMeals[index].complexity,
          );
        },
        itemCount: categoryId?.length,
      ),
    );
  }
}
