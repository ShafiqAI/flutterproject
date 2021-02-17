//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'ui/google_sign_in_button.dart';
import 'ui/register_button.dart';

/*final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
bool _autoValidate = false;*/

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // User result = FirebaseAuth.instance.currentUser;
    BoxDecoration _buildBackground() {
      return BoxDecoration(
          image: DecorationImage(
        image: AssetImage("assets/loginbackground.jpg"),
        fit: BoxFit.cover,
      ));
    }

    Text _buildText() {
      return Text(
        'Recipes',
        style: Theme.of(context).textTheme.headline1,
        textAlign: TextAlign.center,
      );
    }

    return Scaffold(
      body: Container(
        decoration: _buildBackground(),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildText(),
                SizedBox(height: 50.0),
                TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Enter your username',
                        filled: true,
                        fillColor: Colors.white)),
                SizedBox(height: 20.0),
                TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Enter your password',
                        filled: true,
                        fillColor: Colors.white)),
                SizedBox(height: 40.0),
                GoogleSignInButton(
                  onPressed: () =>
                      Navigator.of(context).pushReplacementNamed('/home'),
                ),
                SizedBox(height: 10.0),
                RegisterButton(
                  onPressed: () =>
                      Navigator.of(context).pushReplacementNamed('/register'),
                )
              ]),
        ),
      ),
    );
  }
}
