import 'package:flutter/material.dart';
import 'package:meal_app/Models/meal.dart';

import 'package:meal_app/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meal';
  const CategoryMealsScreen({Key? key, required this.availableMeals})
      : super(key: key);

  final List<Meal> availableMeals;

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late String categoryTitle;
  late List<Meal> displayedMeals;

  var _loadedInitData = false;

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArg =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      categoryTitle = routeArg['title'].toString();
      final categoryId = routeArg['id'];
      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeals[index].id,
            categories: displayedMeals[index].categories,
            duration: displayedMeals[index].duration,
            imageUrl: displayedMeals[index].imageUrl,
            ingredients: displayedMeals[index].ingredients,
            isGlutenFree: displayedMeals[index].isGlutenFree,
            isLactoseFree: displayedMeals[index].isLactoseFree,
            isVegan: displayedMeals[index].isVegan,
            isVegetarian: displayedMeals[index].isVegetarian,
            steps: displayedMeals[index].steps,
            title: displayedMeals[index].title,
            affordability: displayedMeals[index].affordability,
            complexity: displayedMeals[index].complexity,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
