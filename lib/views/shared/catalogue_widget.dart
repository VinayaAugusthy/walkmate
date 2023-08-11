import 'package:flutter/material.dart';
import 'package:walkmate/views/shared/stagger_tile.dart';

import '../../core/constants/constants.dart';
import '../../models/sneakers_model.dart';

class CatalogueWidget extends StatelessWidget {
  const CatalogueWidget({
    super.key,
    required Future<List<Sneakers>> male,
    required this.size,
  }) : _male = male;

  final Future<List<Sneakers>> _male;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Sneakers>>(
      future: _male,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text("Error ${snapshot.hasError}");
        } else {
          final male = snapshot.data;
          return Padding(
            padding: EdgeInsets.only(
              left: size.width * 0.01,
              right: size.width * 0.05,
            ),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: size.height * 0.01,
                crossAxisSpacing: size.width * 0.06,
                childAspectRatio: 0.58,
              ),
              scrollDirection: Axis.vertical,
              itemCount: male!.length,
              itemBuilder: (context, index) {
                final shoe = snapshot.data![index];
                return StaggerTile(
                  price: "\$${shoe.price}",
                  name: shoe.name,
                  imageUrl: shoe.imageUrl[1],
                );
              },
            ),
          );
        }
      },
    );
  }
}
