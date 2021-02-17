import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/services/auth.dart';
import 'package:recipe_app/services/database.dart';
import 'package:recipe_app/ui/screens/editprofile.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:recipe_app/models/user.dart';

class ProfilePage extends StatelessWidget {
  final AuthService _auth = AuthService();

  final String url = 'tel:+91823511';

  Future<void> callnow() async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'call not possible';
    }
  }

  @override
  Widget build(BuildContext context) {
    void _showUpdatePanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: EditProfileForm(),
            );
          });
    }

    final user = Provider.of<TheUser>(context);

    return StreamBuilder<TheUser>(
        stream: DatabaseService(uid: user.uid).email,
        builder: (context, snapshot) {
          TheUser userdata = snapshot.data;
          return ListView(children: <Widget>[
            Container(
              height: 250,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.red, Colors.deepOrange.shade300],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  stops: [0.5, 0.9],
                ),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Colors.white70,
                          minRadius: 60.0,
                          child: CircleAvatar(
                            backgroundImage: AssetImage('assets/leonardo.jpg'),
                            radius: 50.0,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Leonardo Dicaprio',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ]),
            ),
            Container(
                child: Column(
              children: <Widget>[
                ListTile(
                  title: Text('Email',
                      style: TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  subtitle: Text(
                    userdata.email,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                Divider(),
                ListTile(
                  title: Text('Username',
                      style: TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  subtitle: Text(
                    'LeoPalmeiro',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                Divider(),
                ListTile(
                  title: Text('Linkedin',
                      style: TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  subtitle: Text(
                    'leonardopalmeiro',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                Divider(),
                FlatButton.icon(
                    onPressed: () => _showUpdatePanel(),
                    icon: Icon(Icons.sync_rounded),
                    label: Text("Update Profile")),
                Divider(),
                FlatButton.icon(
                    label: Text("Logout"),
                    onPressed: () async {
                      await _auth.signOut();
                    },
                    icon: Icon(Icons.person))
              ],
            ))
          ]);
        });
  }
}
