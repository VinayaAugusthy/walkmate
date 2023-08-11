import 'package:flutter/material.dart';
import 'package:walkmate/core/colors/colors.dart';
import 'package:walkmate/core/constants/constants.dart';
import 'package:walkmate/models/sneakers_model.dart';
import 'package:walkmate/services/helper.dart';
import 'package:walkmate/views/shared/style.dart';
import '../shared/home_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 3, vsync: this);
  late Future<List<Sneakers>> _male;
  late Future<List<Sneakers>> _female;
  late Future<List<Sneakers>> _kids;
  getMale() {
    _male = Hepler().getMaleSneakers();
  }

  getFemale() {
    _female = Hepler().getFemaleSneakers();
  }

  getKids() {
    _kids = Hepler().getKidsSneakers();
  }

  @override
  void initState() {
    super.initState();
    getMale();
    getFemale();
    getKids();
  }

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
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    HomeWidget(size: size, male: _male),
                    HomeWidget(size: size, male: _female),
                    HomeWidget(size: size, male: _kids),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
