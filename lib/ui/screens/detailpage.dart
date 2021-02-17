import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  String phoneurl = 'tel:91823511';
  String mailurl = 'mailto:182047T@mymail.nyp.edu.sg';

  Future<void> callnow() async {
    if (await canLaunch(phoneurl)) {
      await launch(phoneurl);
    } else {
      throw 'call not possible';
    }
  }

  Future<void> mailnow() async {
    if (await canLaunch(mailurl)) {
      await launch(mailurl);
    } else {
      throw 'mail not possible';
    }
  }

  @override
  Widget build(BuildContext context) {
    final topContextText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 120.0),
        Icon(
          Icons.restaurant,
          color: Colors.white,
          size: 40.0,
        ),
        Container(
          width: 90.0,
          child: new Divider(color: Colors.green),
        ),
        SizedBox(height: 10.0),
        Text(
          "Chome",
          style: TextStyle(color: Colors.white, fontSize: 45.0),
        ),
        SizedBox(height: 30.0),
      ],
    );

    final topContent = Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 10.0),
          height: MediaQuery.of(context).size.height * 0.5,
          decoration: new BoxDecoration(
              image: new DecorationImage(
            image: new AssetImage("assets/about_image.jpg"),
            fit: BoxFit.cover,
          )),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: EdgeInsets.all(40.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, .5)),
          child: Center(
            child: topContextText,
          ),
        ),
      ],
    );

    final bottomContentText = Text(
      "Chome is a recipe app designed to display the recipes that is popular and famous, but able to do at home at the same time!",
      style: TextStyle(fontSize: 15.0),
      textAlign: TextAlign.justify,
    );

    final bottomContent = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(20.0),
      child: Container(
          child: Column(
        children: <Widget>[
          bottomContentText,
          SizedBox(height: 25.0),
          Row(children: <Widget>[
            Text("Company: Chome\nContact Info: +65 91823511"),
            IconButton(
              icon: Icon(Icons.call),
              onPressed: () {
                callnow();
              },
              iconSize: 20.0,
              color: Colors.green,
            ),
          ]),
          Row(children: <Widget>[
            Text("Developer: Shafiq"),
            IconButton(
              icon: Icon(Icons.mail),
              color: Colors.red,
              onPressed: () {
                mailnow();
              },
              iconSize: 20.0,
            ),
          ]),
        ],
      )),
    );

    return Scaffold(
      body: Column(
        children: <Widget>[topContent, bottomContent],
      ),
    );
  }
}
