import 'package:flutter/material.dart';

import 'card_info_page/info_page.dart';
import 'list_example/main.dart';
import 'main/main_page.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(primaryColor: Color.fromRGBO(58, 66, 86, 1.0)),
//      home: new ListPage(title: 'Lessons'),
      initialRoute: '/',
      routes: appRoutes,
    );
  }
}

final String addressMainPage = "/";
final String addressListPage = "/list_page";
final String addressCardInfoPage = "/card_info";

final appRoutes = {
  // When navigating to the "/" route, build the FirstScreen widget.
  addressMainPage: (context) => MainPage(),
  // When navigating to the "/second" route, build the SecondScreen widget.
  addressListPage: (context) => ListPage(),
  addressCardInfoPage: (context) => CardInfoPage(),
};
