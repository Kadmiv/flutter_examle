import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class CardInfoPage extends StatefulWidget {
  CardInfoPage({Key key, this.title, this.cardID}) : super(key: key);

  final String title;
  String cardID = "";

  @override
  _CardInfoPageState createState() => _CardInfoPageState();
}

class _CardInfoPageState extends State<CardInfoPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _goToMainPage() {
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
//    SchedulerBinding.instance.addPostFrameCallback((_) => {showIDSnackBar()});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Info page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showIDSnackBar,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void showIDSnackBar() {
    String id = widget.cardID;
    if (id == null) {
      id = "null";
    }
    final snackBar = SnackBar(content: Text("Card ID: " + id));
//          Scaffold.of(context).showSnackBar(snackBar);
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
}
