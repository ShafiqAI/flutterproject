import 'package:flutter/material.dart';

import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/utils/store.dart';
import 'recipecard.dart';

class FavoritesList extends StatefulWidget {
  @override
  _FavoritesListState createState() => _FavoritesListState();
}

class _FavoritesListState extends State<FavoritesList> {
  List<Recipe> recipes = getRecipes();
  List<String> userFavorites = getFavoritesIDs();

  void _handleFavoritesListChanged(String recipeID) {
    // Set new state and refresh the widget:
    setState(() {
      if (userFavorites.contains(recipeID)) {
        userFavorites.remove(recipeID);
      } else {
        userFavorites.add(recipeID);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Column _buildRecipes(List<Recipe> recipesList) {
      return Column(children: <Widget>[
        Expanded(
            child: ListView.builder(
                itemCount: recipesList.length,
                itemBuilder: (BuildContext context, int index) {
                  return new RecipeCard(
                    recipe: recipesList[index],
                    inFavorites: userFavorites.contains(recipesList[index].id),
                    onFavoriteButtonPressed: _handleFavoritesListChanged,
                  );
                }))
      ]);
    }

    const double _iconSize = 20.0;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(5.0),
        child: _buildRecipes(recipes
            .where((recipe) => userFavorites.contains(recipe.id))
            .toList()),
      ),
    );
  }
}
