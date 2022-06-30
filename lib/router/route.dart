import 'package:projectuas/screen/login.dart';
import 'package:flutter/material.dart';
import 'package:projectuas/screen/homepage.dart';
import 'package:projectuas/screen/riwayat.dart';
import 'package:projectuas/screen/scanner.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => LoginPage());
      case '/home':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/riwayat':
        return MaterialPageRoute(builder: (_) => Riwayat());
      case '/scanner':
        return MaterialPageRoute(builder: (_) => Scanner());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(title: Text("Error")),
        body: Center(child: Text("Error Page")),
      );
    });
  }
}
