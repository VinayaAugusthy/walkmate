import 'package:flutter/material.dart';
import 'package:walkmate/core/colors/colors.dart';
import '../../models/sneakers_model.dart';
import '../../services/helper.dart';
import '../shared/catalogue_widget.dart';
import '../shared/style.dart';

class ProductsByCat extends StatefulWidget {
  const ProductsByCat({super.key, required int tabIndex});

  @override
  State<ProductsByCat> createState() => _ProductsByCatState();
}

class _ProductsByCatState extends State<ProductsByCat>
    with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 3, vsync: this);
  late Future<List<Product>> _male;
  // late Future<List<Sneakers>> _female;
  // late Future<List<Sneakers>> _kids;
  getMale() async {
    try {
      _male = Hepler().getMaleSneakers();
    } catch (error) {
      print("$error");
    }
  }

  // getFemale() {
  //   _female = Hepler().getFemaleSneakers();
  // }

  // getKids() {
  //   _kids = Hepler().getKidsSneakers();
  // }

  @override
  void initState() {
    super.initState();
    getMale();

    // getFemale();
    // getKids();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(195, 220, 217, 217),
      body: SizedBox(
        height: size.height,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(16, 45, 0, 0),
              height: size.height * 0.4,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/top_image.png"),
                    fit: BoxFit.fill),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(6, 12, 16, 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.close,
                            color: whiteColor,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // filter();
                          },
                          child: Icon(
                            Icons.menu,
                            color: whiteColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.zero,
                    child: TabBar(
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: greyColor,
                      controller: _tabController,
                      isScrollable: true,
                      labelColor: whiteColor,
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
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: size.height * 0.2,
                left: size.width * 0.05,
                right: size.width * 0.01,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    CatalogueWidget(male: _male, size: size),
                    CatalogueWidget(male: _male, size: size),
                    CatalogueWidget(male: _male, size: size),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // Future<dynamic> filter() {
  //   return showModalBottomSheet(
  //     context: context,
  //     isScrollControlled: true,
  //     backgroundColor: Colors.white54,
  //     builder: (context) => Container(
  //       height: MediaQuery.sizeOf(context).height * 0.82,
  //       decoration: BoxDecoration(
  //         color: whiteColor,
  //         borderRadius: const BorderRadius.only(
  //           topLeft: Radius.circular(25),
  //           topRight: Radius.circular(25),
  //         ),
  //       ),
  //       child: Column(
  //         children: [
  //           height10,
  //           Container(
  //             height: 5,
  //             width: 40,
  //             decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(10),
  //               color: Colors.black38,
  //             ),
  //             child: SizedBox(
  //               height: MediaQuery.sizeOf(context).height * 0.7,
  //               child: Column(
  //                 children: [
  //                   const CustomSpacer(),
  //                   Text(
  //                     'Filter',
  //                     style: textStyle(40, blackColor, FontWeight.bold),
  //                   ),
  //                   const CustomSpacer(),
  //                   Text(
  //                     'Gender',
  //                     style: textStyle(20, blackColor, FontWeight.bold),
  //                   ),
  //                   height10,
  //                   height10,
  //                 ],
  //               ),
  //             ),
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
