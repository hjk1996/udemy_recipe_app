import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatefulWidget {
  final List<Meal> favoritedMeals;
  final Function toggleFavorite;

  FavoritesScreen(this.favoritedMeals, this.toggleFavorite);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  void _removeFromFavoritesScreen(String id) {
    setState(() {
      widget.favoritedMeals.removeWhere((meal) => meal.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.favoritedMeals.isEmpty
        ? Center(
            child: Text('You have no favorites yet.'),
          )
        : ListView.builder(
            itemCount: widget.favoritedMeals.length,
            itemBuilder: (context, index) {
              final meal = widget.favoritedMeals[index];
              return MealItem(
                  id: meal.id,
                  title: meal.title,
                  imageUrl: meal.imageUrl,
                  duration: meal.duration,
                  complexity: meal.complexity,
                  affordability: meal.affordability,
                  removeFromFavoritesScreen: _removeFromFavoritesScreen);
            });
  }
}
