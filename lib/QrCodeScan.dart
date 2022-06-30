import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QrCodeScan extends StatefulWidget {
  @override
  _QrCodeScanState createState() => _QrCodeScanState();
}

class _QrCodeScanState extends State<QrCodeScan> {
  String result = "Waiting QR Scan Text";
  Future _scanQR() async {
    try {
      var BarcodeScanner;
      String qrResult = await BarcodeScanner.scan();
      setState(() {
        result = qrResult;
      });
    } on PlatformException catch (ex) {
      var BarcodeScanner;
      if (ex.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          result = "Camera permission denied";
        });
      } else {
        setState(() {
          result = "Unkown error $ex";
        });
      }
    } on FormatException {
      setState(() {
        result = "You pressed the back button before scanning anything";
      });
    } catch (e) {
      setState(() {
        result = "Unkown error $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        appBar: AppBar(
          title: Text("QR Code Scanner"),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              result,
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            new SizedBox(
              height: 20.0,
            ),
            new SizedBox(
              child: new RaisedButton(
                onPressed: () {
                  _scanQR();
                },
                textColor: Colors.white,
                child: Text('Scann QR CODE', style: TextStyle(fontSize: 20)),
              ),
            )
          ],
        )));
  }
}
