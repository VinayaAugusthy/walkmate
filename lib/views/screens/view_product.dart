import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:walkmate/core/constants/constants.dart';
import 'package:walkmate/models/sneakers_model.dart';

class ViewProduct extends StatelessWidget {
  const ViewProduct({super.key, required this.product, required this.index});
  final Product product;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(40),
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    )),
                width: double.maxFinite,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      product.title,
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            pinned: true,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: CachedNetworkImage(
                imageUrl: product.images[index],
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          product.price.toString(),
                        ),
                        Text(product.brand),
                      ],
                    ),
                    Text(
                      product.rating.toString(),
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    height10,
                    // Padding(
                    //   padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                    //   child: Row(
                    //     children: [
                    //       Text(
                    //         product.discountPercentage.toString(),
                    //         style: const TextStyle(fontSize: 15),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    line(),
                    Text(
                      product.description,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    height10,
                    const Padding(
                      padding: EdgeInsets.fromLTRB(20, 10, 10, 80),
                      child: Text('passValue'),
                    ),
                  ],
                ),
              )
            ],
          )),
        ],
      ),
      bottomSheet: BottomSheet(
        onClosing: () {},
        builder: (context) {
          return Container(
            height: 70,
            padding: const EdgeInsets.only(right: 30, left: 30, bottom: 10),
            child: ElevatedButton(
              onPressed: () {
                // redirect(passValue.videoLink);
              },
              child: const Padding(
                padding: EdgeInsets.only(
                  left: 70,
                ),
                child: Row(
                  children: [
                    Icon(Icons.shopping_bag_rounded),
                    Text(
                      'Add to cart',
                      style: TextStyle(fontSize: 25),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  line() {
    return const Divider(
      color: Colors.black,
    );
  }
}
