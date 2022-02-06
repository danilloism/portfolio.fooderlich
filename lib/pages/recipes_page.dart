import 'package:flutter/material.dart';
import 'package:fooderlich/api/mock_fooderlich_service.dart';
import 'package:fooderlich/models/models.dart';

class RecipesPage extends StatelessWidget {
  const RecipesPage({Key? key}) : super(key: key);
  static final _exploreService = MockFooderlichService();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _exploreService.getRecipes(),
      builder: (context, AsyncSnapshot<List<SimpleRecipe>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          //TODO: add RecipesGridView here
          return const Center(
            child: Text('Recipes Screen'),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
