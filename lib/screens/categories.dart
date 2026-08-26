import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = dummyMeals.where(
      (meal) => meal.categories.contains(category.id),
    );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(title: "", meals: filteredMeals.toList()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pick your category')),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        padding: EdgeInsets.all(20),
        children: [
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              onselectCategory: () {
                _selectCategory(context, category);
              },
            ),
        ],
      ),
    );
  }
}
