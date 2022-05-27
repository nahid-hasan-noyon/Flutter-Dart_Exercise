import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:meal_app/Models/meal.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/category_meals_screen.dart';
import 'package:meal_app/screens/filters_screen.dart';
import 'package:meal_app/screens/meal_detail_screen.dart';
import 'package:meal_app/screens/tabs_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _availableMeals = dummyMeal;
  final List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = dummyMeal.where((meal) {
        if (_filters['gluten'] == true && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] == true && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] == true && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] == true && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliMeals',
      theme: ThemeData(
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
      ),
      initialRoute: TabsScreen.routeName,
      routes: {
        CategoriesScreen.routeName: (context) => const CategoriesScreen(),
        CategoryMealsScreen.routeName: (context) =>
            CategoryMealsScreen(availableMeals: _availableMeals),
        MealDetailScreen.routeName: (context) => const MealDetailScreen(),
        TabsScreen.routeName: (context) => TabsScreen(_favoriteMeals),
        FiltersScreen.routeName: (context) => FiltersScreen(
              saveFilters: _setFilters,
              currentFilters: _filters,
            ),
      },
      onGenerateRoute: (settings) {
        if (kDebugMode) {
          print(settings.arguments);
        }
        return MaterialPageRoute(
          builder: (context) => TabsScreen(_favoriteMeals),
        );
      },
      onUnknownRoute: (settings) {
        if (kDebugMode) {
          print(settings.arguments);
        }
        return MaterialPageRoute(
          builder: (context) => TabsScreen(_favoriteMeals),
        );
      },
    );
  }
}
