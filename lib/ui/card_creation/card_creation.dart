import 'dart:async';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:co_share_app/ui/card_info_page/info_page.dart';
import 'package:co_share_app/ui/settings/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CardCreationPage extends StatefulWidget {
  CardCreationPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CardCreationPageState createState() => _CardCreationPageState();
}

class _CardCreationPageState extends State<CardCreationPage> {
  TextEditingController _controller;

  String barcode = "";

  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    var typeLogo =
        "https://gsminfo.com.ua/wp-content/uploads/2019/12/comfy.202fb1dd-600x400.jpg";

    var logoImage = Image.network(
      typeLogo,
      fit: BoxFit.fill,
    );

    final pageTop = new Container(
      child: new Stack(
        children: [
          Align(
            child: Container(
              child: logoImage,
            ),
            alignment: AlignmentDirectional.topCenter,
          ),
          new Positioned(
            child: new Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: SvgPicture.asset(
                    'assets/images/icon-cancel.svg',
                    semanticsLabel: 'Acme Logo',
                    height: 26,
                    width: 26,
                    color: Colors.white,
                  ),
                  onPressed: onCancelClicked,
                ),
                IconButton(
                  icon: SvgPicture.asset(
                    'assets/images/icon-done.svg',
                    semanticsLabel: 'Acme Logo',
//                    height: 60,
//                    width: 60,
                    color: Colors.white,
                  ),
                  onPressed: onDoneClicked,
                ),
              ],
            ),
            top: 30.0,
            left: 10.0,
            right: 16.0,
          ),
        ],
      ),
    );

    final otherPagePart = Container(
      child: Column(
        children: <Widget>[
          new Row(
            children: <Widget>[
              new Flexible(
                child: new Padding(
                  padding: EdgeInsets.fromLTRB(16.0, 16.0, 10.0, 0.0),
                  child: TextField(
                    controller: _controller,
                    onChanged: (text) {
                      barcode = text;
                    },
                  ),
                ),
              ),
              new Padding(
                padding: EdgeInsets.fromLTRB(16.0, 16.0, 14.0, 0.0),
                child: new IconButton(
                  icon: SvgPicture.asset(
                    'assets/images/icon-barcode.svg',
                    semanticsLabel: 'Acme Logo',
                    height: 40,
                    width: 60,
                  ),
                  onPressed: scan,
                ),
              ),
            ],
          ),
        ],
      ),
    );

    final pageBody = new Container(
      child: Column(
        children: <Widget>[pageTop, otherPagePart],
      ),
    );

    return new Scaffold(
      appBar: null,
      body: pageBody,
    );
  }

  void onCancelClicked() {
    Navigator.of(context).pop();
  }

  void onDoneClicked() {
    var rules = "";
    var isValidCode = doValidationOfCode(barcode, rules);

    if (!isValidCode) {
      showNotValidDialog();
    }
  }

  void onScannerClicked() {}

  Future scan() async {
    try {
      String barcode = await BarcodeScanner.scan();
      setState(() => this.barcode = barcode);
      setState(() => _controller.text = this.barcode);
    } on FormatException {
      setState(() => this.barcode);
    } catch (e) {
      setState(() => this.barcode);
    }
  }

  bool doValidationOfCode(String barcode, String rules) {
    return true;
  }

  void showNotValidDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("WARNING"),
          content: new Text(
              "Code of card is not standard ! \n Do you want save card?"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("CANCEL"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                Route route =
                    MaterialPageRoute(builder: (context) => CardInfoPage());
                Navigator.push(context, route);
              },
            ),
          ],
        );
      },
    );
  }

//
//  Future scan() async {
//    try {
//      String barcode = await BarcodeScanner.scan();
//      setState(() => this.barcode = barcode);
//    } on PlatformException catch (e) {
//      if (e.code == BarcodeScanner.CameraAccessDenied) {
//        setState(() {
//          this.barcode = 'The user did not grant the camera permission!';
//        });
//      } else {
//        setState(() => this.barcode = 'Unknown error: $e');
//      }
//    } on FormatException {
//      setState(() => this.barcode =
//      'null (User returned using the "back"-button before scanning anything. Result)');
//    } catch (e) {
//      setState(() => this.barcode = 'Unknown error: $e');
//    }
//  }
}
