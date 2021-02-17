import 'package:recipe_app/models/recipe.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/*Future<bool> updateFavorites(String uid, String recipeId) {
  DocumentReference favoritesReference =
      Firestore.instance.collection('users').document(uid);

  return Firestore.instance.runTransaction((Transaction tx) async {
    DocumentSnapshot postSnapshot = await tx.get(favoritesReference);
    if (postSnapshot.exists) {
      // Extend 'favorites' if the list does not contain the recipe ID:
      if (!postSnapshot.data.containsKey(recipeId)) {
        await tx.update(favoritesReference, <String, dynamic>{
          'favorites': FieldValue.arrayUnion([recipeId])
        });
        // Delete the recipe ID from 'favorites':
      } else {
        await tx.update(favoritesReference, <String, dynamic>{
          'favorites': FieldValue.arrayRemove([recipeId])
        });
      }
    } else {
      // Create a document for the current user in collection 'users'
      // and add a new array 'favorites' to the document:
      await tx.set(favoritesReference, {
        'favorites': [recipeId]
      });
    }
  }).then((result) {
    return true;
  }).catchError((error) {
    print('Error: $error');
    return false;
  });
}*/

List<Recipe> getRecipes() {
  return [
    Recipe(
      id: '0',
      type: RecipeType.food,
      name: 'Oatmeal with Fruits',
      duration: Duration(minutes: 15),
      ingredients: [
        '100g of oats',
        '100ml of milk',
        'Fruits of your choice',
        'Honey',
        'Cinnamon',
      ],
      preparation: [
        '1.Heat 4 cups water in a medium pot over high heat.',
        '2.When almost about to boil, reduce heat to medium-low and add the oats, cinnamon, and vanilla.',
        '3.Cook, stirring often, until the oats are softened and the water is absorbed, about 4 minutes. Stir in your fruit of choice. Cook for an additional 4-6 minutes or until the fruit is soft and the water is absorbed.',
      ],
      imageURL:
          'https://images.unsplash.com/photo-1517673400267-0251440c45dc?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=f197f4922b3f26ed3f4e3e66a113b67b&auto=format&fit=crop&w=1050&q=80',
    ),
    Recipe(
      id: '1',
      type: RecipeType.food,
      name: 'Pancakes with Maple Syrup',
      duration: Duration(minutes: 20),
      ingredients: [
        '2 eggs',
        '100ml of milk',
        '50g of flour',
        '10g of butter',
        'Baking powder',
        'Maple syrup',
      ],
      preparation: [
        '1.In a small bowl, combine the flour, baking powder and salt. In another bowl, combine the egg, milk, oil and syrup; stir into dry ingredients just until blended.',
        '2.Pour batter by 1/4 cupfuls onto a lightly greased hot griddle; turn when bubbles form on top of pancakes.',
        '3.Cook until second side is golden brown (pancakes will be thin). Serve with additional syrup.',
      ],
      imageURL:
          'https://images.unsplash.com/photo-1517741991040-91338b176129?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=f65c4032c1b3131f829d464fb979f5e8&auto=format&fit=crop&w=675&q=80',
    ),
    Recipe(
      id: '2',
      type: RecipeType.drink,
      name: 'Strawberry Juice',
      duration: Duration(minutes: 10),
      ingredients: [
        '100g of strawberries',
        '500ml of water',
        '2 teaspoons of sugar',
        'Juice of half a lemon',
      ],
      preparation: [
        '1. Rinse the strawberries under cold water. Remove the stem and roughly chop it. Also slice a lemon.',
        '2. Take chopped berries, lemon juice and sugar in a blender. Also add salt if using.',
        '3. Blend it till you get smooth puree of strawberries.',
      ],
      imageURL:
          'https://images.unsplash.com/photo-1506802913710-40e2e66339c9?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=c8ffc5bbb3719b5a46ee703acb0a0ac5&auto=format&fit=crop&w=634&q=80',
    ),
    Recipe(
      id: '3',
      type: RecipeType.drink,
      name: 'Blueberry Smoothie',
      duration: Duration(minutes: 10),
      ingredients: [
        '100g of fresh blueberries',
        '200g of plain yoghurt',
        '100g of milk',
        '1 banana',
      ],
      preparation: [
        '1.Grab some frozen blueberries, a banana, vanilla Greek yogurt, and apple juice. All of the ingredients go into a blender and are mixed until smooth. That’s all there is to it!',
      ],
      imageURL:
          'https://images.unsplash.com/photo-1532301791573-4e6ce86a085f?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=c0d9fe8ce9033db3a46ddf00bba92240&auto=format&fit=crop&w=1050&q=80',
    ),
  ];
}

List<String> getFavoritesIDs() {
  return [
    '0',
  ];
}
