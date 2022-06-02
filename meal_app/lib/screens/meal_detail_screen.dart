import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';

// ignore: must_be_immutable
class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  Function toggleFavorite;
  Function isFavorite;

  MealDetailScreen(this.toggleFavorite, this.isFavorite, {Key? key})
      : super(key: key);

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: Text(
        text,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(15),
        ),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        height: 300,
        width: 330,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final selectMeal = dummyMeal.firstWhere(
      (meal) => meal.id == mealId,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(selectMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Image.network(
                selectMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingredient'),
            buildContainer(
              ListView.builder(
                itemBuilder: (context, index) => Card(
                  color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(selectMeal.ingredients[index]),
                  ),
                ),
                itemCount: selectMeal.ingredients.length,
              ),
            ),
            buildSectionTitle(context, 'Steps'),
            buildContainer(ListView.builder(
              itemBuilder: (context, index) => Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text('# ${index + 1}'),
                    ),
                    title: Text(selectMeal.steps[index]),
                  ),
                  const Divider(color: Colors.amber),
                ],
              ),
              itemCount: selectMeal.steps.length,
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavorite(mealId) ? Icons.star : Icons.star_border,
        ),
        onPressed: () => toggleFavorite(mealId),
      ),
    );
  }
}
