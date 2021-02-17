import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/models/state.dart';
import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/utils/store.dart';
import 'recipecard.dart';

class RecipeList extends StatefulWidget {
  @override
  _RecipeListState createState() => _RecipeListState();
}

class _RecipeListState extends State<RecipeList> {
  StateModel appState;

  List<Recipe> recipes = getRecipes();
  List<String> userFavorites = getFavoritesIDs();

  void _handleFavoritesListChanged(String recipeID) {
    // Set new state and refresh the widget:
    setState(() {
      if (userFavorites.contains(recipeID)) {
        userFavorites.remove(recipeID);
        setState(() {});
      } else {
        userFavorites.add(recipeID);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Padding _buildRecipes(List<Recipe> recipeList) {
      /*CollectionReference collectionReference =
          FirebaseFirestore.instance.collection('recipes');
      Stream<QuerySnapshot> stream;

      if (recipeType != null) {
        stream = collectionReference
            .where("type", isEqualTo: recipeType.index)
            .snapshots();
      } else {
        // Use snapshots of all recipes if recipeType has not been passed
        stream = collectionReference.snapshots();
      }*/

      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: recipeList.length,
                itemBuilder: (BuildContext context, int index) {
                  return new RecipeCard(
                    recipe: recipeList[index],
                    inFavorites: userFavorites.contains(recipeList[index].id),
                    onFavoriteButtonPressed: _handleFavoritesListChanged,
                  );
                },
              ),
            ),
          ],
        ),
      );
    }

    const double _iconSize = 20.0;

    return Scaffold(
      body: Padding(
          padding: EdgeInsets.all(5.0),
          child:
              /* Flexible(
              child: SearchBar(onSearch: null, onItemFound: null),
            ),*/
              _buildRecipes(recipes.toList())),
    );
  }
}
