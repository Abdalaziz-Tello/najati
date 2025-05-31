//  Center(
//         child: Container(
//           height: screenH * 0.14,
//           width: screenW * 0.92,
//           decoration: BoxDecoration(
//             border: Border.all(color: Colors.white, width: 2),

//             borderRadius: BorderRadius.circular(17),
//             color: Colors.blue, // Main container background
//           ),
//           child: Row(
//             children: [
//               // Left Section: Prayer Name and Circle

//               // Right Section: Icons and Progress Indicator
              
//               Expanded(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: const [
//                         Padding(
//                           padding: EdgeInsets.only(top: 15.0),
//                           child: PrayerColumn(
//                             imagePath: ImageManager.missed,
//                             text: "فائتة",
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.only(top: 15.0),
//                           child: PrayerColumn(
//                             imagePath: ImageManager.present,
//                             text: "حاضر",
//                           ),
//                         ),
//                         // PrayerColumn(
//                         //   imagePath: ImageManager.qada,
//                         //   text: "قضاء",
//                         // ),
//                       ],
//                     ),
//                     const SizedBox(height: 10), // Spacing before progress bar
//                     // Progress Indicator
//                     Container(
//                       height: 5,
//                       width: screenW * 0.35,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(17),
//                         color: Colors.grey, // Background for visibility
//                       ),
//                       child: Stack(
//                         children: [
//                           Positioned(
//                             //  right: 0,
//                             child: Container(
//                               width: 200 * progress,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(15),
//                                 color: Colors.pink,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 width: screenW * 0.38,
//                 height: screenH * 0.14,
//                 decoration: BoxDecoration(),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(15),
//                   //  clipBehavior: Clip.antiAlias,
//                   child: Stack(
//                     alignment: Alignment.center,
//                     children: [
//                       // Circular Decoration
//                       Positioned(
//                         // right: -130,
//                         // bottom: -40,
//                         // //   left: 3,
//                         // top: -12,
//                         right: -63,
//                         bottom: -36,
//                         //   left: 3,
//                         top: -17,
//                         child: SizedBox(
//                           height: 220,
//                           width: 220,
//                           child: DecoratedBox(
//                             decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               color: Colors.red,
//                             ),
//                           ),
//                         ),
//                       ),
//                       // Prayer Name
//                       Positioned(
//                         right: 6,
//                         child: const Text(
//                           "الفجر",
//                           style: TextStyle(color: Colors.white, fontSize: 16),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),