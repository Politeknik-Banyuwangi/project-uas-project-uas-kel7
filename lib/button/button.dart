import 'package:projectuas/enums.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    final Color inActiveColor = Colors.black;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Colors.white10.withOpacity(0.15),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home, color: MenuState.home == selectedMenu ? Colors.blue : inActiveColor),
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
            ),
            IconButton(
              icon: Icon(Icons.qr_code_scanner_rounded, color: MenuState.scanner == selectedMenu ? Colors.blue : inActiveColor),
              onPressed: () {
                Navigator.pushNamed(context, '/scanner');
              },
            ),
            IconButton(
              icon: Icon(Icons.person, color: MenuState.profile == selectedMenu ? Colors.blue : inActiveColor),
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
            ),
          ],
        ),
      ),
    );
  }
}
