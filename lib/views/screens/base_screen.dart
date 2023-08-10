import 'package:flutter/material.dart';
import 'package:walkmate/views/shared/style.dart';

import '../shared/bottom_navbar.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: EdgeInsets.all(size.width * 0.03),
          margin: EdgeInsets.symmetric(
              horizontal: size.width * 0.03, vertical: size.height * 0.03),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [BottomNavWidget(size: size)],
          ),
        ),
      ),
      body: Center(
        child: Text(
          'base',
          style: textStyle(40, Colors.black, FontWeight.bold),
        ),
      ),
    );
  }
}
