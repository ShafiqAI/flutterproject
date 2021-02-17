import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/authenticate/authenticate.dart';
import 'package:recipe_app/models/user.dart';
import 'package:recipe_app/ui/screens/home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<TheUser>(context);

    if (user == null) {
      return Authentication();
    } else {
      return HomeScreen();
    }

    //return home/authenticate widget
  }
}
