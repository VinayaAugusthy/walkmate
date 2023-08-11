import 'package:flutter/material.dart';

import '../../core/colors/colors.dart';

class LatestShoes extends StatelessWidget {
  const LatestShoes({
    super.key,
    required this.size,
    required this.imageUrl,
  });

  final Size size;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
