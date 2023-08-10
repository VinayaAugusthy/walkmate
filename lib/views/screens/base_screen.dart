import 'package:flutter/material.dart';
import 'package:walkmate/views/shared/style.dart';
import '../shared/bottom_navbar.dart';

class BaseScreen extends StatelessWidget {
  BaseScreen({super.key});
  List pageList = [];
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
            children: [
              BottomNavWidget(
                size: size,
                onTap: () {},
                icon: Icons.home,
              ),
              BottomNavWidget(
                size: size,
                onTap: () {},
                icon: Icons.search,
              ),
              BottomNavWidget(
                size: size,
                onTap: () {},
                icon: Icons.shopping_cart,
              ),
              BottomNavWidget(
                size: size,
                onTap: () {},
                icon: Icons.person,
              )
            ],
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
