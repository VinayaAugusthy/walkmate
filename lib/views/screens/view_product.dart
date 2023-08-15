import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:walkmate/core/colors/colors.dart';
import 'package:walkmate/core/constants/constants.dart';
import 'package:walkmate/models/cart_model.dart';
import 'package:walkmate/models/sneakers_model.dart';
import 'package:walkmate/views/screens/cart.dart';
import 'package:walkmate/views/shared/style.dart';

class ViewProduct extends StatelessWidget {
  const ViewProduct({super.key, required this.product, required this.index});
  final Product product;
  final int index;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    final cartBox = Hive.box<CartModel>('cart_box');
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
                    padding: EdgeInsets.all(size.width * 0.05),
                    child: Text(
                      product.title,
                      style: textStyle(25, blackColor, FontWeight.bold),
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
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: size.width * 0.05,
                    right: size.width * 0.05,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Price : ${product.price.toString()}',
                            style: textStyle(20, blackColor, FontWeight.bold),
                          ),
                          Text(
                            'Brand:${product.brand}',
                            style: textStyle(20, blackColor, FontWeight.bold),
                          ),
                        ],
                      ),
                      height10,
                      Text(
                        'Rating :${product.rating.toString()}',
                        style: textStyle(18, blackColor, FontWeight.bold),
                      ),
                      height10,
                      line(),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                          size.width * 0.005,
                          size.width * 0.03,
                          size.width * 0.03,
                          size.width * 0.005,
                        ),
                        child: Text(
                          product.description,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      height10,
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                          size.width * 0.005,
                          size.width * 0.03,
                          size.width * 0.03,
                          size.width * 0.03,
                        ),
                        child: Row(
                          children: [
                            Text(
                              'Order Now !!!.. Only  ${product.stock}  pairs left',
                              style: textStyle(18, blackColor, FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
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
                final cartItem = CartModel(
                  id: product.id,
                  brand: product.brand,
                  title: product.title,
                  price: product.price,
                  discountPercentage: product.discountPercentage,
                  description: product.description,
                  rating: product.rating,
                  stock: product.stock,
                  images: product.images,
                );
                cartBox.add(cartItem);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShoppingCart(
                      cartProduct: cartItem,
                    ),
                  ),
                );
              },
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: size.width * 0.05,
                  left: size.width * 0.08,
                  right: size.width * 0.08,
                ),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.shopping_bag_rounded,
                      color: blackColor,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Add to cart',
                      style: textStyle(25, blackColor, FontWeight.bold),
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
