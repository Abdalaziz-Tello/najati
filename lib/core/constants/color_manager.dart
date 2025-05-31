import 'package:flutter/material.dart';

class ColorManager {
  static const Color inValidOverlayColor = Color(
    0x33000000,
  ); // 20% black overlay
  static const Color dhrColor = Color(0xFF3D358D);
  static const Color asrColor = Color(0xFF1D2E4D);
  static const Color mgribColor = Color(0xFF1D2E4D);
  static const Color IshaAndFajrColor = Color(0xFFFFFFFF);
  //back ground color:
  static const Color lightBlueBackground = Color(0xFFDEE9FD);
  //circles colors :
  static const Color teal = Color(0xFF48D1CC);
  static const Color purpleAccent = Color.fromARGB(255, 255, 6, 143);
  static const Color deepPurple = Color(0xFF8366FF);
  static const Color darkOrange = Color(0xFFFFB90F);
  static const Color goldenAmber = Color.fromRGBO(255, 185, 15, 0.5);
  static const Color gray = Color.fromRGBO(184, 184, 184, 0.7);
  static const Color lightPurpleGray = Color.fromRGBO(220, 215, 235, 1.0);
  //
  static const Color whiteColor = Colors.white;
  static const Color blackColor = Colors.black;
  static const Color cloudBlueColor = Color(0xffE4ECFC);
  static const Color blackOverlay = Color.fromRGBO(0, 0, 0, 0.2);
  static Color blackWithOpacity20 = Colors.black.withAlpha((0.2 * 255).toInt());
  static Color deepPurpleWithOpacity40 = ColorManager.deepPurple.withAlpha(
    (0.4 * 255).toInt(),
  );
  static Color deepPurpleWithOpacity10 = ColorManager.deepPurple.withAlpha(
    (0.1 * 255).toInt(),
  );
  static Color deepPurpleWithOpacity70 = ColorManager.deepPurple.withAlpha(
    (0.7 * 255).toInt(),
  );
  static Color purpleAccentWithOpacity32 = ColorManager.purpleAccent.withAlpha(
    (0.32 * 255).toInt(),
  );
  static Color sunsetOrangeWithOpacity60 = ColorManager.sunsetOrange.withAlpha(
    (0.6 * 255).toInt(),
  );

  static Color goldenBeigeLight = Color.fromARGB(
    179,
    228,
    187,
    113,
  ).withAlpha((0.3 * 255).toInt());

  static Color lightPurpleGrayWithOpacity40 = ColorManager.lightPurpleGray
      .withAlpha((0.4 * 255).toInt());

  static Color darkOrangeWithOpcaity50 = ColorManager.darkOrange.withAlpha(
    (0.5 * 255).toInt(),
  );

  static Color tealWithOpcaity50 = ColorManager.teal.withAlpha(
    (0.5 * 255).toInt(),
  );

  // Fajr & isha Gradient:
  static const List<Color> fajrAndIshaGradient = [
    Color(0xFF12059C),
    Color(0xFF5E55BF),
    Color(0xFF8635CF),
  ];

  // Dhuhr Gradient
  static const List<Color> validdhuhrGradient = [
    Color(0xFFFEFFFB),
    Color(0xFF99C3FF),
  ];

  // Asr Gradient
  static const List<Color> validasrGradient = [
    Color(0xFFF8FFE6),
    Color(0xFF6AA4F5),
  ];

  // Maghrib Gradient
  static const List<Color> validmaghribGradient = [
    Color(0xFFFFF3B4),
    Color(0xFFF2A282),
  ];

  //
  static const Color sunYellow = Color(0xFFFDFFE0);
  static const Color sunsetOrange = Color(0xFFEB724B);
  //contaienr color:
  static const Color lightPurpleColor = Color(0xFFD6BCF2);
  static const Color lightCyanColor = Color(0xFF99F1F1);
  //
  static const Color redColor = Colors.red;
  static const Color transparentColor = Colors.transparent;
  static const Color navyBlue = Color.fromRGBO(40, 66, 115, 1);

  //tasbeeh counter colors :
  static const Color outerCircleStart = Color(0x66CCE8F6);
  static const Color outerCircleEnd = Color.fromRGBO(228, 241, 243, 1);

  static const Color middleCircleStart = Color.fromRGBO(134, 53, 207, 1);
  static const Color middleCircleEnd = Color.fromRGBO(42, 142, 189, 1);

  static const Color innerCircle = Color.fromRGBO(158, 210, 233, 1);

  // Gradient colors
  static const Color progressStart = Color(0xFF32C9C4);
  static const Color progressEnd = Color(0xFFD2F5F4);
  static const Color progressOrange = Color(0xFFFF622F);
  static const Color progressGreen = Color(0xFFABCF5D);
  static const Color progressYellow = Color(0xFFD9CD5B);
  static const Color progressDefault = Color(0x33000000); // 20% black overlay

  // Gradients
  static const LinearGradient progressPresentGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [progressStart, progressEnd],
  );

  static const LinearGradient progressMissedGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xFFD2F5F4),
      Color(0xFFFF622F),
      Color(0xFFABCF5D),
      Color(0xFF32C9C4),
    ],
  );

  static const LinearGradient progressQadaGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [Color(0xFF32C9C4), Color(0xFFD9CD5B)],
  );

  // New colors
  static const Color container1Color = Color(0x66CCE8F6); // #CCE8F666 40%
  static const Color container2Color1 = Color(0xFF8635CF); // #8635CF
  static const Color container2Color2 = Color(0xFF2A8EBD); // #2A8EBD
  static const Color container3Color = Color(0xFF9ED2E9); // #9ED2E9

  // New gradients
  static LinearGradient container1BorderGradient = LinearGradient(
    colors: [Color(0xFFE4F1F3), Color(0xFFB7C1D4)],
  );

  static LinearGradient container2BorderGradient = LinearGradient(
    colors: [Color(0xFFDEE9FD), Color(0xFFFFFFFF)],
  );

  static LinearGradient container2BackgroundGradient = LinearGradient(
    colors: [Color(0xFF8635CF), Color(0xFF2A8EBD)],
  );

  static LinearGradient container3BorderGradient = LinearGradient(
    colors: [Color(0xFF9793B2), Color(0xFFFFFFFF)],
  );

  // Number gradient
  static LinearGradient numberGradient = LinearGradient(
    colors: [Color(0xFF284273), Color(0xFF5280D4)],
  );
}



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






                //    boxShadow: [
                //   BoxShadow(
                //     color: ColorManager.darkOrangeWithOpcaity50,
                //     blurRadius: 20,
                //     spreadRadius: 10,
                //   ),

                // ],


                //   boxShadow: [
                //   BoxShadow(
                //     color: ColorManager.tealWithOpcaity50,
                //     blurRadius: 20,
                //     spreadRadius: 10,
                //   ),
                // ],