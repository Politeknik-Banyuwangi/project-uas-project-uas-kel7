import 'package:projectuas/enums.dart';
import 'package:projectuas/button/button.dart';
import 'package:projectuas/screen/riwayat.dart';
import 'package:flutter/material.dart';
import 'package:projectuas/screen/homelist.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter/services.dart';

class HomePage extends StatelessWidget {
  static String routeName = '/home';

  Future<void> scanQR() async {
    String barcodeScanRes;

    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#ff6666', 'Batal', true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version';
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size; //this gonna give us total height and with of our device
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      body: Stack(
        children: <Widget>[
          Container(
            // Here the height of the container is 45% of our total height
            height: 300,
            width: 350,
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Card(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    child: InkWell(
                      splashColor: Colors.blue,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 90, bottom: 50, right: 90, top: 50), //apply padding to some sides only
                            child: Text("INFORMASI MAHASISWA"),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Card(
                        margin: const EdgeInsets.only(top: 40, bottom: 40, left: 40),
                        child: InkWell(
                          onTap: () {
                            scanQR();
                          },
                          splashColor: Colors.blue,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.35,
                            height: MediaQuery.of(context).size.width * 0.35,
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: const <Widget>[
                                  Icon(
                                    Icons.qr_code_scanner,
                                    size: 40,
                                    color: Colors.blueAccent,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Card(
                        margin: const EdgeInsets.only(top: 40, bottom: 40, right: 40),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Riwayat()));
                          },
                          splashColor: Colors.blue,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.35,
                            height: MediaQuery.of(context).size.width * 0.35,
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: const <Widget>[
                                  Icon(
                                    Icons.history,
                                    size: 40,
                                    color: Colors.blueAccent,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  HomeList(),
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: const  CustomBottomNavBar(
        selectedMenu: MenuState.home,
      ),
    );
  }
}
