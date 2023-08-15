// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:walkmate/controllers/basescreen_provider.dart';

// import 'navbar_widget.dart';

// class BottomNavBar extends StatelessWidget {
//   const BottomNavBar({
//     super.key,
//     required this.size,
//   });

//   final Size size;

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<BaseScreenNotifier>(
//       builder: (context, baseScreenNotifier, child) {
//         return SafeArea(
//           child: Container(
//             padding: EdgeInsets.all(size.width * 0.03),
//             margin: EdgeInsets.symmetric(
//                 horizontal: size.width * 0.03, vertical: size.height * 0.03),
//             decoration: BoxDecoration(
//               color: Colors.black,
//               borderRadius: BorderRadius.circular(16),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 BottomNavWidget(
//                   size: size,
//                   onTap: () {
//                     baseScreenNotifier.pageIndex = 0;
//                   },
//                   icon: baseScreenNotifier.pageIndex == 0
//                       ? Icons.home
//                       : Icons.home_outlined,
//                 ),
//                 BottomNavWidget(
//                   size: size,
//                   onTap: () {
//                     baseScreenNotifier.pageIndex = 1;
//                   },
//                   icon: baseScreenNotifier.pageIndex == 1
//                       ? Icons.search
//                       : Icons.search,
//                 ),
//                 BottomNavWidget(
//                   size: size,
//                   onTap: () {
//                     baseScreenNotifier.pageIndex = 2;
//                   },
//                   icon: baseScreenNotifier.pageIndex == 2
//                       ? Icons.shopping_cart
//                       : Icons.shopping_cart_outlined,
//                 ),
//                 BottomNavWidget(
//                   size: size,
//                   onTap: () {
//                     baseScreenNotifier.pageIndex = 3;
//                   },
//                   icon: baseScreenNotifier.pageIndex == 3
//                       ? Icons.person
//                       : Icons.person_outline,
//                 )
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
