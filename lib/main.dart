import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/models/user.dart';
//import 'package:recipe_app/register.dart';
import 'package:recipe_app/services/auth.dart';
import 'package:recipe_app/wrapper.dart';
//import 'login.dart';
import 'ui/theme.dart';
//import 'ui/screens/home.dart';
import 'package:provider/provider.dart';

void main() async {
  /*WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();*/
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<TheUser>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
        title: 'Recipes',
        theme: buildTheme(),
        /* initialRoute: '/login',
        routes: {
          '/login': (context) => LoginScreen(),
          '/home': (context) => HomeScreen(),
          '/register': (context) => RegisterScreen(),
        },*/
      ),
    );
  }
}
