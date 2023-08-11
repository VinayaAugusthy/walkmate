import 'package:flutter/material.dart';
import 'package:walkmate/core/colors/colors.dart';
import 'package:walkmate/core/constants/constants.dart';
import 'package:walkmate/views/shared/product_card.dart';
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
      backgroundColor: const Color.fromARGB(195, 220, 217, 217),
      body: Padding(
        padding: EdgeInsets.only(
          left: size.width * 0.04,
          top: size.width * 0.06,
          right: size.width * 0.04,
        ),
        child: SizedBox(
          height: size.height,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(size.width * 0.04),
                child: Text(
                  'WalkMate',
                  style: textStyle(30, blackColor, FontWeight.bold),
                ),
              ),
              height10,
              Padding(
                padding: EdgeInsets.zero,
                child: TabBar(
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
                  ],
                ),
              ),
              height10,
              height10,
              Expanded(
                child: TabBarView(controller: _tabController, children: [
                  Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.405,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 6,
                          itemBuilder: (context, index) {
                            return ProductCard(
                                price: "\$200.00",
                                category: 'Men Shoes',
                                id: '1',
                                image: imageUrl,
                                name: "Addidas NMD");
                          },
                        ),
                      ),
                      height10,
                      Column(
                        children: [
                          height10,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Latest Shoes',
                                style:
                                    textStyle(20, blackColor, FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Show All',
                                    style: textStyle(
                                      20,
                                      blackColor,
                                      FontWeight.bold,
                                    ),
                                  ),
                                  const Icon(Icons.keyboard_double_arrow_right)
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                      height10,
                      height10,
                      SizedBox(
                        height: size.height * 0.13,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 6,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  EdgeInsets.only(right: size.width * 0.03),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.circular(16),
                                    boxShadow: [
                                      BoxShadow(
                                        color: whiteColor,
                                        spreadRadius: 1,
                                        blurRadius: 0.8,
                                        offset: const Offset(0, 1),
                                      )
                                    ]),
                                height: size.height * 0.12,
                                width: size.width * 0.3,
                                child: Image.network(
                                  imageUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ),
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
