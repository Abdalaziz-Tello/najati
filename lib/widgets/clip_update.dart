// import 'package:flutter/material.dart';
// import 'package:najati_test/main.dart';

// import 'core/constants/image_manager.dart';
// import 'core/constants/color_manager.dart';
// import 'custom_widget.dart';

// class CustomContainer extends StatelessWidget {
//   final double progress;
//   final String prayerName;
//   final bool isPrayerTimeValid;

//   CustomContainer({
//     super.key,
//     required this.progress,
//     required this.prayerName,
//     required this.isPrayerTimeValid,
//   });
//   bool isPrayerTimeDhrValid = false;
//   bool isPrayerTimeAsrValid = false;

//   bool isPrayerTimeIshaValid = false;

//   bool isPrayerTimeMgribValid = false;

//   @override
//   Widget build(BuildContext context) {
//     Color textColor;
//     switch (prayerName) {
//       case "الظهر":
//         textColor =
//             isPrayerTimeDhrValid
//                 ? ColorManager.dhrColor
//                 : ColorManager.inValidOverlayColor;
//         break;
//       case "العصر":
//         textColor =
//             isPrayerTimeAsrValid
//                 ? ColorManager.asrColor
//                 : ColorManager.inValidOverlayColor;
//         break;
//       case "المغرب":
//         textColor =
//             isPrayerTimeMgribValid
//                 ? ColorManager.mgribColor
//                 : ColorManager.inValidOverlayColor;
//         break;
//       case "العشاء":
//         textColor =
//             isPrayerTimeIshaValid
//                 ? ColorManager.IshaAndFajrColor
//                 : ColorManager.inValidOverlayColor;
//         break;
//       default:
//         textColor = Colors.white;
//     }

//     return Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: Container(
//         height: screenH * 0.11,
//         width: screenW * 0.92,
//         decoration: BoxDecoration(
//           border: Border.all(color: Colors.white, width: 2),
//           borderRadius: BorderRadius.circular(17),
//           color: Color(0xFFE4ECFC), // Main container background
//         ),
//         child: Row(
//           children: [
//             // Right Section: Icons and Progress Indicator
//             Expanded(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: const [
//                       Padding(
//                         padding: EdgeInsets.only(top: 11.0),
//                         child: PrayerColumn(
//                           imagePath: ImageManager.missed,
//                           text: "فائتة",
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(top: 11.0),
//                         child: PrayerColumn(
//                           imagePath: ImageManager.present,
//                           text: "حاضر",
//                         ),
//                       ),
//                     ],
//                   ),
//                   //     const SizedBox(height: 8), // Spacing before progress bar
//                   // Progress Indicator
//                   Container(
//                     height: 5,
//                     width: screenW * 0.35,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(17),
//                       color: Colors.grey, // Background for visibility
//                     ),
//                     child: Stack(
//                       children: [
//                         Positioned(
//                           child: Container(
//                             width: 200 * progress,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(15),
//                               color: Colors.pink,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Flexible(
//               child: Container(
//                 width: screenW * 0.465,
//                 height: screenH * 0.11,
//                 decoration: BoxDecoration(),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(15),
//                   child: Stack(
//                     alignment: Alignment.center,
//                     children: [
//                       // Circular Decoration
//                       Positioned(
//                         right: -63,
//                         bottom: -36,
//                         top: -17,
//                         child: SizedBox(
//                           height: 220,
//                           width: 220,
//                           child: DecoratedBox(
//                             decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               color: Color(0xFFD9D9D9),
//                             ),
//                           ),
//                         ),
//                       ),

//                       // Prayer Name
//                       Positioned(
//                         right: 6,
//                         child: Text(
//                           prayerName,
//                           style: TextStyle(color: textColor, fontSize: 16),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class PrayerContainer extends StatelessWidget {
//   PrayerContainer({super.key});
//   double progress = 0.3;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           TopRightCircle(),
//           LeftBottomCircle(),
//           RightBottomCircle(),
//           Positioned(
//             top: screenH * 0.323,
//             left: 13,
//             child: Container(
//               // height: screenH * 0.5,
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     Center(
//                       child: CustomContainer(
//                         progress: 0.3,
//                         prayerName: "الفجر",
//                         isPrayerTimeValid: true,
//                       ),
//                     ),
//                     Center(
//                       child: CustomContainer(
//                         progress: 0.3,
//                         prayerName: "الظهر",
//                         isPrayerTimeValid: true,
//                       ),
//                     ),

//                     Center(
//                       child: CustomContainer(
//                         progress: 0.3,
//                         prayerName: "العصر",
//                         isPrayerTimeValid: true,
//                       ),
//                     ),

//                     Center(
//                       child: CustomContainer(
//                         progress: 0.3,
//                         prayerName: "المغرب",
//                         isPrayerTimeValid: true,
//                       ),
//                     ),

//                     Center(
//                       child: CustomContainer(
//                         progress: 0.3,
//                         prayerName: "العشاء",
//                         isPrayerTimeValid: true,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             top: screenH * 0.334,
//             left: 4,
//             child: Container(
//               // height: screenH * 0.5,
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     Center(
//                       child: CustomContainer(
//                         progress: 0.3,
//                         prayerName: "الفجر",
//                         isPrayerTimeValid: true,
//                       ),
//                     ),
//                     Center(
//                       child: CustomContainer(
//                         progress: 0.3,
//                         prayerName: "الظهر",
//                         isPrayerTimeValid: true,
//                       ),
//                     ),

//                     Center(
//                       child: CustomContainer(
//                         progress: 0.3,
//                         prayerName: "العصر",
//                         isPrayerTimeValid: true,
//                       ),
//                     ),

//                     Center(
//                       child: CustomContainer(
//                         progress: 0.3,
//                         prayerName: "المغرب",
//                         isPrayerTimeValid: true,
//                       ),
//                     ),

//                     Center(
//                       child: CustomContainer(
//                         progress: 0.3,
//                         prayerName: "العشاء",
//                         isPrayerTimeValid: true,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // Helper Widget for Icon + Text
// class PrayerColumn extends StatelessWidget {
//   final String imagePath;
//   final String text;

//   const PrayerColumn({super.key, required this.imagePath, required this.text});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Image.asset(
//           imagePath,
//           width: imagePath == ImageManager.missed ? 25 : 35,
//           height: imagePath == ImageManager.missed ? 20 : 30,
//           fit: BoxFit.contain,
//           errorBuilder: (context, error, stackTrace) {
//             print('Error loading image: $error');
//             return const SizedBox(height: 5);
//           },
//         ),
//         //  const SizedBox(height: 2),
//         Text(text, style: const TextStyle(fontSize: 12, color: Colors.white)),
//         const SizedBox(height: 2),
//       ],
//     );
//   }
// }
