import 'package:flutter/material.dart';
import 'package:najati_test/core/constants/image_manager.dart';

import 'core/constants/color_manager.dart';
import 'main.dart';

//   color:ColorManager.deepPurpleWithOpacity10,
//   boxShadow: [
//     BoxShadow(
//       color: ColorManager.deepPurpleWithOpacity70,
//       blurRadius: 20,
//       spreadRadius: 10,
//     ),
//   ],
// ),
// child: Container(
//   width: largeCircleSize * 0.68,
//   height: largeCircleSize * 0.68,
//   decoration: BoxDecoration(
//     shape: BoxShape.circle,
//     boxShadow: [
//       BoxShadow(
//         color:ColorManager.purpleAccentWithOpacity32,
//         blurRadius: 20,
//         spreadRadius: 2,
//       ),
//     ],
//   ),

// --- Custom Widget for the Top-Right Background Circle ---
class TopRightCircle extends StatelessWidget {
  TopRightCircle({Key? key, this.childImage}) : super(key: key);
  bool? childImage = false;
  @override
  Widget build(BuildContext context) {
    // Get screen dimensions using MediaQuery
    final double screenW = MediaQuery.of(context).size.width;
    final double screenH = MediaQuery.of(context).size.height;

    return Positioned(
      top: 40,
      right: -55,
      child: Opacity(
        opacity: 0.7,
        // Removed the extra Center as Container is already positioning
        child: Container(
          width: screenW * 0.5,
          height: screenH * 0.28,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: ColorManager.deepPurple,
            // Consider using theme colors
            boxShadow: [BoxShadow(blurRadius: 70)],
          ),
        ),
      ),
    );
  }
}

class childImage extends StatelessWidget {
  const childImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: screenW / 5,
      right: -screenW / 8,
      //   bottom: -300,
      child: Container(child: Image.asset(ImageManager.secondchild)),
    );
  }
}

// --- Custom Widget for the Left-Bottom Background Circle ---
class LeftBottomCircle extends StatelessWidget {
  const LeftBottomCircle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenW = MediaQuery.of(context).size.width;
    final double screenH = MediaQuery.of(context).size.height;

    return Positioned(
      left: -40,
      bottom: 170,
      child: Opacity(
        opacity: 0.4,
        child: Container(
          width: screenW * 0.3,
          height: screenH * 0.3,
          decoration: BoxDecoration(
            shape: BoxShape.circle,

            boxShadow: [
              BoxShadow(
                color: ColorManager.darkOrangeWithOpcaity50,
                blurRadius: 20,
                spreadRadius: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class QuestionCircle extends StatelessWidget {
  const QuestionCircle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenW = MediaQuery.of(context).size.width;
    final double screenH = MediaQuery.of(context).size.height;

    return Positioned(
      top: 60,
      left: 20,
      child: Opacity(
        opacity: 0.4,
        child: Container(
          width: screenW * 0.3,
          height: screenH * 0.3,
          decoration: BoxDecoration(
            shape: BoxShape.circle,

            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 193, 180, 228),
                blurRadius: 20,
                spreadRadius: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WinCircle extends StatelessWidget {
  const WinCircle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenW = MediaQuery.of(context).size.width;
    final double screenH = MediaQuery.of(context).size.height;

    return Positioned(
      top: screenH / 3,
      left: screenW / 5,
      child: Opacity(
        opacity: 0.4,
        child: Container(
          width: screenW * 0.3,
          height: screenH * 0.3,
          decoration: BoxDecoration(
            shape: BoxShape.circle,

            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 165, 161, 173),
                blurRadius: 20,
                spreadRadius: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// --- Custom Widget for the Right-Bottom Background Circle ---
class RightBottomCircle extends StatelessWidget {
  const RightBottomCircle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenW = MediaQuery.of(context).size.width;
    final double screenH = MediaQuery.of(context).size.height;

    return Positioned(
      bottom: -55,
      right: -45,
      child: Opacity(
        opacity: 0.6,
        child: Container(
          width: screenW * 0.36,
          height: screenH * 0.2,
          decoration: BoxDecoration(
            shape: BoxShape.circle,

            // Adjusted alpha in hex for clarity (0x95 is hex for 149 decimal)
            // The original color(0xff955cbeb2) might have been a typo,
            // assuming alpha was intended. If 0xff was intended as alpha,
            // it means fully opaque, making Opacity useless.
            // Using 0x95 based on the opacity value. Change if needed.
            boxShadow: [
              BoxShadow(
                color: ColorManager.tealWithOpcaity50,
                blurRadius: 20,
                spreadRadius: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
