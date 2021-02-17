import 'package:flutter/material.dart';
import 'profile.dart';
import 'detailpage.dart';
import 'shoppinglist.dart';
import 'recipelist.dart';
import 'favorites.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _iconSize = 20.0;

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            backgroundColor: Colors.white,
            elevation: 2.0,
            bottom: TabBar(
              labelColor: Theme.of(context).indicatorColor,
              tabs: [
                Tab(icon: Icon(Icons.restaurant, size: _iconSize)),
                Tab(icon: Icon(Icons.favorite, size: _iconSize)),
                Tab(icon: Icon(Icons.shopping_cart_outlined, size: _iconSize)),
                Tab(icon: Icon(Icons.person_sharp, size: _iconSize)),
                Tab(
                    icon:
                        Icon(Icons.perm_device_info_rounded, size: _iconSize)),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(5.0),
          child: TabBarView(
            children: [
              RecipeList(),
              FavoritesList(),
              ListDisplay(),
              ProfilePage(),
              DetailPage(),
            ],
          ),
        ),
      ),
    );
  }
}
