import 'package:co_share_app/app.dart';
import 'package:co_share_app/repo/models/card.dart';
import 'package:co_share_app/ui/card_info_page/info_page.dart';
import 'package:co_share_app/ui/scanner_page/scanner_page.dart';
import 'package:co_share_app/ui/settings/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _openInfoPage() {
    // Navigate to the second screen using a named route.
    Navigator.pushNamed(context, addressCardInfoPage);
  }

  void _openInfoPageOfCard(String cardID) {
//    Route route =        MaterialPageRoute(builder: (context) => CardInfoPage(cardID: cardID));
    Route route = MaterialPageRoute(builder: (context) => ScannerPage());
    Navigator.push(context, route);
  }

  void _openSettings() {
//    Route route =        MaterialPageRoute(builder: (context) => CardInfoPage(cardID: cardID));
    Route route = MaterialPageRoute(builder: (context) => SettingsPage());
    Navigator.push(context, route);
  }

  PageController _myPage = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    var keys = testCardsMap.keys.toList();

    final appBar = AppBar(
      elevation: 0.1,
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      title: Text("CoShare"),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.list),
          onPressed: () {},
        )
      ],
    );

    final bottomNavigationBar = Container(
      height: 55.0,
      child: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 4.0,
        color: Color.fromRGBO(58, 66, 86, 1.0),
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.credit_card, color: Colors.white),
              onPressed: () {
                setState(() {
                  _myPage.jumpToPage(0);
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.settings, color: Colors.white),
              onPressed: () {
                setState(() {
                  _myPage.jumpToPage(1);
                });
              },
            ),
          ],
        ),
      ),
    );

    var floatingActionButton = new FloatingActionButton(
      onPressed: _openInfoPage,
      tooltip: 'Increment',
      child: Icon(Icons.add),
    );

    var floatingActionButtonLocation =
        FloatingActionButtonLocation.centerDocked;

    var dataList = new ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: keys.length,
      itemBuilder: (BuildContext context, int index) {
        var key = keys[index];
        return new GestureDetector(
          onTap: () => _openInfoPageOfCard(testCardsMap[key].id),
          child: new Container(
            padding: EdgeInsets.all(2),
            height: 220,
            width: double.maxFinite,
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image.network(
                testCardsMap[key].imageUrl,
                fit: BoxFit.fill,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5,
              margin: EdgeInsets.all(10),
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );

    var pageBody = new PageView(
      controller: _myPage,
      onPageChanged: (int) {
        print('Page Changes to index $int');
      },
      children: <Widget>[
        Center(
          child: dataList,
        ),
        Center(
          child: new SettingsPage(),
        ),
      ],
      physics:
          NeverScrollableScrollPhysics(), // Comment this if you need to use Swipe.
    );

    return Scaffold(
      appBar: appBar,
      body: pageBody,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}

var testCardsMap = {
  1: new CardInfo("id_1"),
  2: new CardInfo("id_2"),
  3: new CardInfo("id_3"),
  4: new CardInfo("id_4"),
  5: new CardInfo("id_5"),
  6: new CardInfo("id_6"),
  7: new CardInfo("id_7"),
  8: new CardInfo("id_8"),
  9: new CardInfo("id_9"),
  10: new CardInfo("id_10"),
  11: new CardInfo("id_11"),
  12: new CardInfo("id_12"),
  13: new CardInfo("id_13"),
  14: new CardInfo("id_14"),
  15: new CardInfo("id_15"),
  16: new CardInfo("id_16"),
  17: new CardInfo("id_17"),
  18: new CardInfo("id_18"),
};
