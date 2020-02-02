import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Card creation'),
        ),
        body: new Center(
          child: new Column(
            children: <Widget>[
              new Container(
                child: new Text("Some text"),
                padding: const EdgeInsets.all(8.0),
              ),
              new Text("Some text"),
            ],
          ),
        ));
  }
}
