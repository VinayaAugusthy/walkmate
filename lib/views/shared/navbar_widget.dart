import 'package:flutter/material.dart';

class BottomNavWidget extends StatelessWidget {
  const BottomNavWidget({
    super.key,
    required this.size,
    this.onTap,
    this.icon,
  });

  final Size size;
  final void Function()? onTap;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: size.height * 0.05,
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
