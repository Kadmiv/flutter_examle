import 'package:co_share_app/ui/card_info_page/info_page.dart';
import 'package:co_share_app/ui/main/main_page.dart';
import 'package:co_share_app/ui/scanner_page/scanner_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
final String addressScannerPage = "/scanner_page";
final String addressCardInfoPage = "/card_info";

final appRoutes = {
  // When navigating to the "/" route, build the FirstScreen widget.
  addressMainPage: (context) => MainPage(),
  addressCardInfoPage: (context) => CardInfoPage(),
  addressScannerPage: (context) => ScannerPage(),
};



_incrementCounter() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int counter = (prefs.getInt('counter') ?? 0) + 1;
  print('Pressed $counter times.');
  await prefs.setInt('counter', counter);
}