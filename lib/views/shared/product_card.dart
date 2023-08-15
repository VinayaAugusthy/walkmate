import 'package:flutter/material.dart';
import 'package:walkmate/core/colors/colors.dart';
import 'package:walkmate/views/shared/style.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    super.key,
    required this.price,
    required this.category,
    required this.id,
    required this.image,
    required this.name,
  });
  final String name;
  final String price;
  final String category;
  final int id;
  final String image;
  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    bool isSelected = true;
    return Padding(
      padding: EdgeInsets.fromLTRB(size.width * 0.005, 0, size.width * 0.05, 0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          height: size.height,
          width: size.width * 0.6,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: whiteColor,
              spreadRadius: 1,
              blurRadius: 0.6,
              offset: const Offset(1, 1),
            )
          ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: size.height * 0.2,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(widget.image),
                      ),
                    ),
                  ),
                  Positioned(
                    right: size.width * 0.05,
                    top: size.width * 0.05,
                    child: GestureDetector(
                      onTap: null,
                      child: Icon(
                        Icons.favorite_border_outlined,
                        size: size.width * 0.02,
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: size.width * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        right: size.width * 0.01,
                        left: size.width * 0.01,
                        top: size.width * 0.02,
                      ),
                      child: Text(
                        widget.name,
                        style: textStyle(22, blackColor, FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        right: size.width * 0.01,
                        left: size.width * 0.01,
                        top: size.width * 0.01,
                      ),
                      child: Text(
                        widget.category,
                        style: textStyle(18, greyColor, FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: size.width * 0.05, right: size.width * 0.03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(size.width * 0.01),
                      child: Text(
                        widget.price,
                        style: textStyle(18, blackColor, FontWeight.w600),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'Colors',
                          style: textStyle(18, greyColor, FontWeight.w500),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        ChoiceChip(
                          label: const Text(''),
                          selected: isSelected,
                          visualDensity: VisualDensity.compact,
                          selectedColor: blackColor,
                        )
                      ],
                    )
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
