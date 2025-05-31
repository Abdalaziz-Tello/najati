// Color shapeColor =
//       isBeforePrayerTime ? ColorManager.blackOverlay : ColorManager.whiteColor;

//   switch (prayerName.toLowerCase()) {
//     case KeyManager.fajr:
//       return _buildFajrShape(shapeColor);
//     case KeyManager.dhuhr:
//       return _buildDhuhrShape(shapeColor, isBeforePrayerTime);
//     case KeyManager.asr:
//       return _buildAsrShape(shapeColor, isBeforePrayerTime);
//     case KeyManager.maghrib:
//       return _buildMaghribShape(isBeforePrayerTime);
//     case KeyManager.isha:
//       return _buildIshaShape(shapeColor);
//     default:
//       return const SizedBox.shrink();
//   }
// }

// Widget _buildFajrShape(Color shapeColor) {
//   return Positioned(
//     top: 20,
//     right: 20,
//     child: Transform(
//       alignment: Alignment.center,
//       transform: Matrix4.rotationY(3.1416),
//       child: Icon(
//         Icons.nightlight_round_outlined,
//         color: shapeColor,
//         size: 15,
//       ),
//     ),
//   );
// }

// Widget _buildDhuhrShape(Color shapeColor, bool isBeforePrayerTime) {
//   return Positioned(
//     top: 25,
//     right: 75,
//     child: Container(
//       width: 15,
//       height: 15,
//       decoration: BoxDecoration(
//         color: shapeColor,
//         shape: BoxShape.circle,
//         boxShadow: isBeforePrayerTime
//             ? []
//             : [
//                 BoxShadow(
//                   color: ColorManager.whiteColor,
//                   blurRadius: 10,
//                   spreadRadius: 3,
//                 )
//               ],
//       ),
//     ),
//   );
// }

// Widget _buildAsrShape(Color shapeColor, bool isBeforePrayerTime) {
//   return Positioned(
//     top: 50, //half container height
//     right: 80,
//     child: Container(
//       width: 15,
//       height: 15,
//       decoration: BoxDecoration(
//         color: shapeColor,
//         shape: BoxShape.circle,
//         boxShadow: isBeforePrayerTime
//             ? []
//             : [
//                 BoxShadow(
//                   color: ColorManager.whiteColor,
//                   blurRadius: 20,
//                   spreadRadius: 1,
//                 )
//               ],
//       ),
//     ),
//   );
// }

// Widget _buildMaghribShape(bool isBeforePrayerTime) {
//   return Positioned(
//     bottom: 20,
//     right: 80,
//     child: Container(
//       width: 15,
//       height: 15,
//       decoration: BoxDecoration(
//         color: isBeforePrayerTime
//             ? ColorManager.blackOverlay
//             : ColorManager.sunsetOrange,
//         shape: BoxShape.circle,
//       ),
//     ),
//   );
// }

// Widget _buildIshaShape(Color shapeColor) {
//   return Positioned(
//     top: 20,
//     right: 80,
//     child: Icon(
//       Icons.auto_awesome,
//       color: shapeColor,
//       size: 20,
//     ),
//   );
// }
