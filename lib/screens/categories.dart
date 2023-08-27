import 'package:cook_it/data/dummy_data.dart';
import 'package:cook_it/models/category.dart';
import 'package:cook_it/screens/meals.dart';
import 'package:cook_it/widgets/grid_item.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals =  dummyMeals.where((meal) => meal.categories.contains(category.id)).toList();


Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => Meals(title: category.title, meals: filteredMeals)));  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick your category'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: [
         for (final category in availableCategories) 
           GridItem(category: category,onSelectCategory: () {
             _selectCategory(context,category);
           },)
        ],
      ),
    );
  }
}
