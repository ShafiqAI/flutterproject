import 'package:flutter/material.dart';
import 'package:recipe_app/authenticate/registerform.dart';
import 'package:recipe_app/ui/screens/sign_in.dart';

class Authentication extends StatefulWidget {
  Authentication({Key key}) : super(key: key);

  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  bool showSignIn = true;
  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignIn(toggleView: toggleView);
    } else {
      return RegisterForm(toggleView: toggleView);
    }
  }
}
