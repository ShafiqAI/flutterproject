import 'package:flutter/material.dart';

import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/ui/screens/recipe_title.dart';
//import 'package:recipe_app/utils/store.dart';
import 'package:recipe_app/ui/screens/recipe_image.dart';

class DetailScreen extends StatefulWidget {
  final Recipe recipe;
  final bool inFavorites;

  DetailScreen(this.recipe, this.inFavorites);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  ScrollController _scrollController;
  bool _inFavorites;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    _scrollController = ScrollController();
    _inFavorites = widget.inFavorites;
  }

  @override
  void dispose() {
    // "Unmount" the controllers:
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _toggleInFavorites() {
    setState(() {
      _inFavorites = !_inFavorites;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool innerViewIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Colors.white,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                background: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    RecipeImage(widget.recipe.imageURL),
                    RecipeTitle(widget.recipe, 25.0),
                  ],
                ),
              ),
              expandedHeight: 340.0,
              pinned: true,
              floating: true,
              elevation: 2.0,
              forceElevated: innerViewIsScrolled,
              bottom: TabBar(
                labelColor: Colors.blueAccent,
                tabs: <Widget>[
                  Tab(icon: Icon(Icons.food_bank_rounded)),
                  Tab(icon: Icon(Icons.library_books_sharp)),
                ],
                controller: _tabController,
              ),
            )
          ];
        },
        body: TabBarView(
          children: <Widget>[
            IngredientsView(widget.recipe.ingredients),
            PreparationView(widget.recipe.preparation),
          ],
          controller: _tabController,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          _inFavorites == true ? Icons.favorite : Icons.favorite_border,
          color: Colors.red,
        ),
        elevation: 2.0,
        backgroundColor: Colors.white,
      ),
    );
  }
}

class IngredientsView extends StatelessWidget {
  final List<String> ingredients;

  IngredientsView(this.ingredients);
  @override
  Widget build(BuildContext context) {
    List<Widget> children = new List<Widget>();
    ingredients.forEach((item) {
      children.add(
        new Row(
          children: <Widget>[
            new Icon(Icons.done),
            new SizedBox(width: 5.0),
            new Text(
              item,
              style: TextStyle(fontSize: 17.0),
            ),
          ],
        ),
      );
      // Add spacing between the lines:
      children.add(
        new SizedBox(
          height: 5.0,
        ),
      );
    });
    return ListView(
      padding: EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 75.0),
      children: children,
    );
  }
}

class PreparationView extends StatelessWidget {
  final List<String> preparationSteps;

  PreparationView(this.preparationSteps);
  @override
  Widget build(BuildContext context) {
    List<Widget> textElements = List<Widget>();
    preparationSteps.forEach((item) {
      textElements.add(
        Text(
          item,
          style: TextStyle(fontSize: 17.0),
          textAlign: TextAlign.justify,
        ),
      );
      // Add spacing between the lines:
      textElements.add(
        SizedBox(
          height: 20.0,
        ),
      );
    });
    return ListView(
      padding: EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 75.0),
      children: textElements,
    );
  }
}
