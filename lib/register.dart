//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'ui/register_button.dart';

/*try {
  UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: "barry.allen@example.com",
    password: "SuperSecretPassword!"
  );
  } on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    print('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
    print('The account already exists for that email.');
  }
  } catch (e) {
  print(e);
  }*/

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                        labelText: 'Enter your email',
                        filled: true,
                        fillColor: Colors.white)),
                SizedBox(height: 20.0),
                TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Enter your password',
                        filled: true,
                        fillColor: Colors.white)),
                SizedBox(height: 40.0),
                TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Confirm password',
                        filled: true,
                        fillColor: Colors.white)),
                SizedBox(height: 40.0),
                ConfirmRegisterButton(
                  onPressed: () =>
                      Navigator.of(context).pushReplacementNamed('/home'),
                )
              ]),
        ),
      ),
    );
  }
}
