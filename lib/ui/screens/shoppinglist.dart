import 'package:flutter/material.dart';

class ListDisplay extends StatefulWidget {
  ListDisplay({Key key}) : super(key: key);

  @override
  _ListDisplayState createState() => _ListDisplayState();
}

class _ListDisplayState extends State<ListDisplay> {
  List<String> litems = [];
  Map<String, bool> list = {};
  final TextEditingController eCtrl = new TextEditingController();

  String emptytext = "";

  var holder_1 = [];

  getItems() {
    list.forEach((key, value) {
      if (value == true) {
        holder_1.add(key);
      }
    });

    // holder_1.clear();
  }

  @override
  Widget build(BuildContext ctxt) {
    return new Scaffold(
        body: new Column(children: <Widget>[
      new TextField(
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Enter ingredient here",
            filled: true,
            fillColor: Colors.blueAccent),
        controller: eCtrl,
        onSubmitted: (text) {
          litems.add(text);
          list.putIfAbsent(text, () => false);
          eCtrl.clear();
          setState(() {});
        },
      ),
      litems.isNotEmpty
          ? new Expanded(
              child: ListView(
                children: list.keys.map((String key) {
                  return new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                          child: CheckboxListTile(
                        title: new Text(key),
                        value: list[key],
                        onChanged: (bool value) {
                          setState(() {
                            list[key] = value;
                          });
                        },
                      )),
                      IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            setState(() {
                              list.remove(key);
                            });
                          })
                    ],
                  );
                }).toList(),
              ),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 20.0),
                Text("Your shopping list is empty"),
              ],
              //child:
            )
    ]));
  }
}
