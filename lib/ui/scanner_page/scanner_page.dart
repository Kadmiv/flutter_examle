import 'dart:async';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class ScannerPage extends StatefulWidget {
  ScannerPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ScannerPageState createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  String barcode = "";

//  void _openInfoPageOfCard(String cardID) {
//    Route route =
//        MaterialPageRoute(builder: (context) => CardInfoPage(cardID: cardID));
//    Navigator.push(context, route);
//  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Barcode Scanner Example'),
        ),
        body: new Center(
          child: new Column(
            children: <Widget>[
              new Container(
                child: new MaterialButton(
                    onPressed: scan, child: new Text("Scan")),
                padding: const EdgeInsets.all(8.0),
              ),
              new Text(barcode),
              new BarcodeWidget(
                barcode: Barcode.code128(),
                data: barcode,
                width: 200,
                height: 80,
                style: GoogleFonts.sourceCodePro(
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                  ),
                ),
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Colors.blue,
                )),
              ),
            ],
          ),
        ));
  }

  Future scan() async {
    try {
      String barcode = await BarcodeScanner.scan();
      setState(() => this.barcode = barcode);
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          this.barcode = 'The user did not grant the camera permission!';
        });
      } else {
        setState(() => this.barcode = 'Unknown error: $e');
      }
    } on FormatException {
      setState(() => this.barcode =
          'null (User returned using the "back"-button before scanning anything. Result)');
    } catch (e) {
      setState(() => this.barcode = 'Unknown error: $e');
    }
  }
}
