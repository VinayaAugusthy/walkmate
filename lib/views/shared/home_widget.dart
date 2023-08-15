// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:walkmate/views/shared/product_card.dart';
import 'package:walkmate/views/shared/style.dart';
import '../../core/colors/colors.dart';
import '../../core/constants/constants.dart';
import '../../models/sneakers_model.dart';
import '../screens/products_by_cart.dart';
import '../screens/view_product.dart';
import 'latest_shoes.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key,
    required this.size,
    required Future<List<Product>> male,
    required this.tabIndex,
  }) : _male = male;

  final Size size;
  final Future<List<Product>> _male;

  final int tabIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: size.height * 0.405,
          child: FutureBuilder<List<Product>>(
            future: _male,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                print(snapshot.error);
                return Text("Error ${snapshot.error}");
              } else {
                final male = snapshot.data;
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: male!.length,
                  itemBuilder: (context, index) {
                    final shoe = snapshot.data![index];
                    return index < shoe.images.length
                        ? GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ViewProduct(
                                    product: shoe,
                                    index: index,
                                  ),
                                ),
                              );
                            },
                            child: ProductCard(
                              price: "\$${shoe.price}",
                              category: shoe.category,
                              id: shoe.id,
                              image: shoe.images[index],
                              name: shoe.title,
                            ),
                          )
                        : Container();
                  },
                );
              }
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
                  style: textStyle(20, blackColor, FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductsByCat(
                          tabIndex: tabIndex,
                        ),
                      ),
                    );
                  },
                  child: Row(
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
                  ),
                )
              ],
            ),
          ],
        ),
        height10,
        height10,
        SizedBox(
          height: size.height * 0.2,
          child: FutureBuilder<List<Product>>(
            future: _male,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Text("Error ${snapshot.hasError}");
              } else {
                final male = snapshot.data;
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: male!.length,
                  itemBuilder: (context, index) {
                    final shoe = snapshot.data![index];
                    return Padding(
                      padding: EdgeInsets.all(size.width * 0.02),
                      child: LatestShoes(size: size, imageUrl: shoe.images[1]),
                    );
                  },
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
