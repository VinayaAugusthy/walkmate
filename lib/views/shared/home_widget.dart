import 'package:flutter/material.dart';
import 'package:walkmate/views/shared/product_card.dart';
import 'package:walkmate/views/shared/style.dart';

import '../../core/colors/colors.dart';
import '../../core/constants/constants.dart';
import '../../models/sneakers_model.dart';
import 'latest_shoes.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key,
    required this.size,
    required Future<List<Sneakers>> male,
  }) : _male = male;

  final Size size;
  final Future<List<Sneakers>> _male;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: size.height * 0.405,
            child: FutureBuilder<List<Sneakers>>(
              future: _male,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text("Error ${snapshot.hasError}");
                } else {
                  final male = snapshot.data;
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: male!.length,
                    itemBuilder: (context, index) {
                      final shoe = snapshot.data![index];
                      return ProductCard(
                        price: "\$${shoe.price}",
                        category: shoe.category,
                        id: shoe.id,
                        image: shoe.imageUrl[0],
                        name: shoe.name,
                      );
                    },
                  );
                }
              },
            )),
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
          child: FutureBuilder<List<Sneakers>>(
            future: _male,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
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
                      child:
                          LatestShoes(size: size, imageUrl: shoe.imageUrl[1]),
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
