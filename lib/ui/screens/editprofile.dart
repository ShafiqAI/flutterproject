import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/models/user.dart';
import 'package:recipe_app/services/database.dart';

class EditProfileForm extends StatefulWidget {
  EditProfileForm({Key key}) : super(key: key);

  @override
  _EditProfileFormState createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  final _formKey = GlobalKey<FormState>();

  String _currentEmail;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<TheUser>(context);

    return StreamBuilder<TheUser>(
        stream: DatabaseService(uid: user.uid).profiles,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            TheUser userdata = snapshot.data;

            return Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Text("Update Profile!"),
                  SizedBox(height: 20.0),
                  TextFormField(
                    initialValue: userdata.email,
                    decoration: InputDecoration(
                      labelText: "Enter your email",
                    ),
                    validator: (val) =>
                        val.isEmpty ? 'Please enter a name' : null,
                    onChanged: (val) => setState(() => _currentEmail = val),
                  ),
                  SizedBox(height: 20.0),
                  RaisedButton(
                    color: Colors.blue[400],
                    child: Text(
                      'Update Profile',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        await DatabaseService(uid: user.uid)
                            .updateUserEmail(_currentEmail ?? userdata.email);
                        Navigator.pop(context);
                      }
                    },
                  )
                ],
              ),
            );
          } else {}
        });
  }
}
