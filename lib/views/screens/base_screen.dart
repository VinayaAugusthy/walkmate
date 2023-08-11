// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:walkmate/controllers/basescreen_provider.dart';
import 'package:walkmate/views/screens/cart.dart';
import 'package:walkmate/views/screens/home.dart';
import 'package:walkmate/views/screens/products_by_cart.dart';
import 'package:walkmate/views/screens/profile.dart';
import 'package:walkmate/views/screens/search.dart';
import '../shared/bottom_navbar.dart';

class BaseScreen extends StatelessWidget {
  BaseScreen({super.key});
  List pageList = [
    const ProductsByCat(),
    const SearchScreen(),
    const ShoppingCart(),
    const ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Consumer<BaseScreenNotifier>(
      builder: (BuildContext context, baseScreenNotifier, Widget? child) {
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 220, 219, 219),
          bottomNavigationBar: BottomNavBar(size: size),
          body: pageList[baseScreenNotifier.pageIndex],
        );
      },
    );
  }
}
