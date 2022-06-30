import 'package:flutter/material.dart';
import 'package:projectuas/QrCodeScan.dart';

class Scanner extends StatelessWidget {
  Scanner({Key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QR Code Scanner',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: QrCodeScan(),
    );
  }
}
