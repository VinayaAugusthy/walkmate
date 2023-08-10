import 'package:flutter/material.dart';
import 'package:walkmate/core/colors/colors.dart';
import 'package:walkmate/core/constants/constants.dart';
import 'package:walkmate/views/shared/style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 3, vsync: this);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(size.width * 0.04),
        child: SizedBox(
          height: size.height,
          child: Column(
            children: [
              Text(
                'WalkMate',
                style: textStyle(24, blackColor, FontWeight.bold),
              ),
              height10,
              TabBar(
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorColor: greyColor,
                  controller: _tabController,
                  isScrollable: true,
                  labelColor: blackColor,
                  labelStyle: textStyle(20, whiteColor, FontWeight.bold),
                  unselectedLabelColor: greyColor.withOpacity(0.5),
                  tabs: const [
                    Tab(
                      text: "Men Shoes",
                    ),
                    Tab(
                      text: "Women Shoes",
                    ),
                    Tab(
                      text: "Kids Shoes",
                    )
                  ]),
              Expanded(
                child: TabBarView(controller: _tabController, children: [
                  Column(
                    children: [
                      Container(
                        height: size.height * 0.405,
                        color: Colors.amber,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: size.height * 0.405,
                        color: Colors.green,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: size.height * 0.405,
                        color: Colors.yellow,
                      )
                    ],
                  )
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
