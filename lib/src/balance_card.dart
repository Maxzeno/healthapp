// import 'package:flutter/material.dart';
// import 'package:pixel_dat_test_app/utils/config/colour_config.dart';
// import 'package:pixel_dat_test_app/utils/config/text_config.dart';

// class BalanceCard extends StatelessWidget {
//   final void Function()? onPressed;
//   final bool isAmountVisible;
//   const BalanceCard(
//       {super.key, required this.onPressed, required this.isAmountVisible});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: 24.0),
//       decoration: BoxDecoration(
//         color: const Color(0XFFD7E7F5),
//         borderRadius: BorderRadius.circular(10.0),
//       ),
//       child: Column(
//         children: [
//           Container(
//             padding:
//                 const EdgeInsets.symmetric(vertical: 4.0, horizontal: 14.0),
//             margin: const EdgeInsets.only(bottom: 18.0),
//             decoration: BoxDecoration(color: ColourConfig.defaultAppColour),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 StreamBuilder(
//                   stream: db
//                       .collection("users")
//                       .doc(authRef.currentUser!.email)
//                       .snapshots(),
//                   builder: (context, snapshot) {
//                     String? firstName = snapshot.data?['first_name'] ?? "";
//                     String? lastName = snapshot.data?['last_name'] ?? "";

//                     return Text(
//                       "$firstName $lastName",
//                       style: TextConfig.textStyle.copyWith(
//                         fontWeight: FontWeight.w500,
//                         color: ColourConfig.whiteColour,
//                       ),
//                     );
//                   },
//                 ),
//                 IconButton(
//                   onPressed: onPressed,
//                   icon: Icon(
//                     isAmountVisible ? Icons.visibility_off : Icons.visibility,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Text(
//             "Available Balance",
//             style: TextConfig.textStyle.copyWith(fontWeight: FontWeight.w500),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(bottom: 18.0),
//             child: Text(
//               isAmountVisible ? "#500.00" : "#*******",
//               style: TextConfig.textStyle.copyWith(fontSize: 28.0),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }