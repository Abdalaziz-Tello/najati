// import 'package:flutter/material.dart';
// import 'package:prayer_tracking_app/core/constants/color_manager.dart';
// import 'package:prayer_tracking_app/core/constants/image_manager.dart';
// import 'package:prayer_tracking_app/core/constants/string_manager.dart';

// class MissedPrayerIcon extends StatelessWidget {
//   final bool isPrayerTime;

//   const MissedPrayerIcon({super.key, required this.isPrayerTime});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           width: 25,
//           height: 40,
//           decoration: isPrayerTime
//               ? BoxDecoration(
//                   shape: BoxShape.circle,
//                   boxShadow: [
//                     BoxShadow(
//                       color: ColorManager.sunsetOrangeWithOpacity60,
//                       blurRadius: 10,
//                       spreadRadius: 1,
//                     )
//                   ],
//                   border: Border.all(
//                     color: ColorManager.sunsetOrange,
//                     width: 2,
//                   ),
//                 )
//               : null,
//           child: Image.asset(
//             ImageManager.missedIcon,
//             width: 40,
//             height: 40,
//             color: isPrayerTime ? null : ColorManager.blackOverlay,
//           ),
//         ),
//         Text(
//           StringManager.missed,
//           style: TextStyle(
//             color: ColorManager.blackColor,
//           ),
//         ),
//       ],
//     );
//   }
// }
