import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:najati_test/main.dart';
import 'package:najati_test/models/prayer_times/prayer_times.dart';
import 'package:najati_test/models/prayers/five_prayers_response.dart';

import 'core/constants/image_manager.dart';
import 'core/constants/color_manager.dart';
import 'custom_widget.dart';
import 'services/api/prayer_times.dart';
import 'services/api/prayers.dart';

class CustomContainer extends StatefulWidget {
  final double progress;

  CustomContainer({super.key, required this.progress});

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  PrayerTimesServiceImp service = PrayerTimesServiceImp(dio: Dio());
  late GetPrayerTimesResponse res;
  bool isLoading = true;
  List<String> fiveSalat = ["عشاء", "مغرب", "عصر", "ضهر", "فجر"];
  // Color shapeColor =
  //       isBeforePrayerTime ? ColorManager.blackOverlay : ColorManager.whiteColor;
  late final GetPrayerTimesResponse five;
  List<String> prayers = [];
  int index = 0;
  bool ishaValid = false;
  bool maghribValid = false;
  bool asrValid = false;
  bool duhrValid = false;
  bool fajrValid = false;
  String? prayerNameValid = "";

  @override
  void initState() {
    super.initState();
    _loadData();
    ishaValid = isPrayerTimeValid("العشاء");
    fajrValid = isPrayerTimeValid("الفجر");
    maghribValid = isPrayerTimeValid("المغرب");
    asrValid = isPrayerTimeValid("العصر");
    duhrValid = isPrayerTimeValid("الظهر");
    prayerNameValid = getCurrentValidPrayerName();
  }

  void _loadData() async {
    try {
      five = await service.getPrayerTimes();
      setState(() {
        res = five;
        isLoading = false;
      });
    } catch (e) {
      print("API call failed: $e");
    }
  }

  bool isNowAfterPrayer(String prayerTime) {
    final now = DateTime.now();

    final parts = prayerTime.split(":");
    final prayerDateTime = DateTime(
      now.year,
      now.month,
      now.day,
      int.parse(parts[0]),
      int.parse(parts[1]),
    );

    return now.isAfter(prayerDateTime);
  }

  bool isPrayerTimeValid(String prayerName) {
    switch (prayerName) {
      case "الفجر":
        fajrValid = !isNowAfterPrayer(five.data.prayerTimes.dhuhr);
        break;
      case "الظهر":
        duhrValid = !isNowAfterPrayer(five.data.prayerTimes.asr);
        break;
      case "العصر":
        asrValid = !isNowAfterPrayer(five.data.prayerTimes.maghrib);
        break;
      case "المغرب":
        maghribValid = !isNowAfterPrayer(five.data.prayerTimes.isha);
        break;
      case "العشاء":
        ishaValid = !isNowAfterPrayer(five.data.prayerTimes.fajr);
        break;
      default:
        return false;
    }
    return true;
  }

  String? getCurrentValidPrayerName() {
    final Map<String, bool> validityMap = {
      "الفجر": fajrValid,
      "الظهر": duhrValid,
      "العصر": asrValid,
      "المغرب": maghribValid,
      "العشاء": ishaValid,
    };

    for (final entry in validityMap.entries) {
      if (entry.value) {
        return entry.key; // return the first valid prayer name
      }
    }

    return null; // if none are valid
  }

  @override
  Widget build(BuildContext context) {
    Color textColor;
    switch (prayerNameValid) {
      case "الظهر":
        textColor =
            duhrValid
                ? ColorManager.dhrColor
                : ColorManager.inValidOverlayColor;
        break;
      case "العصر":
        textColor =
            asrValid ? ColorManager.asrColor : ColorManager.inValidOverlayColor;
        break;
      case "المغرب":
        textColor =
            maghribValid
                ? ColorManager.mgribColor
                : ColorManager.inValidOverlayColor;
        break;
      case "العشاء":
        textColor =
            ishaValid
                ? ColorManager.IshaAndFajrColor
                : ColorManager.inValidOverlayColor;
        break;
      default:
        textColor = Colors.white;
    }

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: screenH * 0.11,
        width: screenW * 0.92,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(17),
          color: Color(0xFFE4ECFC), // Main container background
        ),
        child: Row(
          children: [
            // Right Section: Icons and Progress Indicator
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(top: 11.0),
                        child: PrayerColumn(
                          imagePath: ImageManager.missed,
                          text: "فائتة",
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 11.0),
                        child: PrayerColumn(
                          imagePath: ImageManager.present,
                          text: "حاضر",
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 5,
                    width: screenW * 0.35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17),
                      color: Colors.grey, // Background for visibility
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          child: Container(
                            width: 200 * widget.progress,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.pink,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: Container(
                width: screenW * 0.465,
                height: screenH * 0.11,
                decoration: BoxDecoration(),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        right: -63,
                        bottom: -36,
                        top: -17,
                        child: SizedBox(
                          height: 220,
                          width: 220,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFD9D9D9),
                            ),
                          ),
                        ),
                      ),
                      // Prayer Name
                      Positioned(
                        right: 6,
                        child: Text(
                          fiveSalat[index],
                          style: TextStyle(color: textColor, fontSize: 16),
                        ),
                      ),

                      // Positioned widgets for each prayer
                      Positioned(
                        bottom: 20,
                        right: 80,
                        child: Container(
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                            // color:
                            //     widget.isBeforePrayerTime
                            //         ? ColorManager.blackOverlay
                            //         : ColorManager.sunsetOrange,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),

                      Positioned(
                        //  top: 50, //half container height
                        right: 80,
                        child: Container(
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                            //   color: widget.shapeColor,
                            shape: BoxShape.circle,
                            // boxShadow:
                            //     widget.isBeforePrayerTime
                            //         ? []
                            //         : [
                            //           BoxShadow(
                            //             color: ColorManager.whiteColor,
                            //             blurRadius: 20,
                            //             spreadRadius: 1,
                            //           ),
                            //  ],
                          ),
                        ),
                      ),

                      Positioned(
                        top: 25,
                        right: 75,
                        child: Container(
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                            //color: widget.shapeColor,
                            shape: BoxShape.circle,
                            //
                          ),
                        ),
                      ),

                      Positioned(
                        top: 20,
                        right: 80,
                        child: Icon(
                          Icons.auto_awesome,
                          // color: widget.shapeColor,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PrayerContainer extends StatefulWidget {
  PrayerContainer({super.key});

  @override
  State<PrayerContainer> createState() => _PrayerContainerState();
}

class _PrayerContainerState extends State<PrayerContainer> {
  double progress = 0.3;
  @override
  void _loadData() async {
    try {
      final result = await service.getPrayerTimes();
      setState(() {
        res = result;
        isLoading = false;
      });
    } catch (e) {
      print("API call failed: $e");
    }
  }

  void initState() {
    super.initState();
    _loadData();
  }

  PrayerTimesServiceImp service = PrayerTimesServiceImp(dio: Dio());
  late GetPrayerTimesResponse res;
  int index = 0;
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Stack(
          //   children: [
          //     TopRightCircle(),
          //     LeftBottomCircle(),
          //     RightBottomCircle(),
          //   ],
          // ),
          Expanded(
            child: ListView(
              children: [
                Center(
                  //  child: CustomContainer(
                  //  progress: 0.3,
                  // prayerName: "الفجر",
                  // isPrayerTimeValid: true,
                  // shapeColor: ColorManager.IshaAndFajrColor,
                  //  isBeforePrayerTime:
                  // const now = new Date();

                  // // Extract sunrise time from prayer times
                  // const sunriseTimeString = prayerTimes.Sunrise; // e.g., '06:43'

                  // // Create a new Date object for today's date at sunrise time
                  // const [hours, minutes] = sunriseTimeString.split(':').map(Number);
                  // const sunriseDate = new Date(now.getFullYear(), now.getMonth(), now.getDate(), hours, minutes);

                  // // Compare current time with sunrise time
                  // let isBeforePrayerTime = now < sunriseDate;

                  // )
                ),
                Center(child: CustomContainer(progress: 0.3)),
                Center(child: CustomContainer(progress: 0.3)),
                Center(child: CustomContainer(progress: 0.3)),
                Center(child: CustomContainer(progress: 0.3)),
                Center(child: CustomContainer(progress: 0.3)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Helper Widget for Icon + Text
class PrayerColumn extends StatelessWidget {
  final String imagePath;
  final String text;

  const PrayerColumn({super.key, required this.imagePath, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          imagePath,
          width: imagePath == ImageManager.missed ? 25 : 35,
          height: imagePath == ImageManager.missed ? 20 : 30,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            print('Error loading image: $error');
            return const SizedBox(height: 5);
          },
        ),
        //  const SizedBox(height: 2),
        Text(text, style: const TextStyle(fontSize: 12, color: Colors.white)),
        const SizedBox(height: 2),
      ],
    );
  }
}

Widget _buildFajrShape(Color shapeColor) {
  return Positioned(
    top: 20,
    right: 20,
    child: Transform(
      alignment: Alignment.center,
      transform: Matrix4.rotationY(3.1416),
      child: Icon(Icons.nightlight_round_outlined, color: shapeColor, size: 15),
    ),
  );
}

Widget _buildDhuhrShape(Color shapeColor, bool isBeforePrayerTime) {
  return Positioned(
    top: 25,
    right: 75,
    child: Container(
      width: 15,
      height: 15,
      decoration: BoxDecoration(
        color: shapeColor,
        shape: BoxShape.circle,
        boxShadow:
            isBeforePrayerTime
                ? []
                : [
                  BoxShadow(
                    color: ColorManager.whiteColor,
                    blurRadius: 10,
                    spreadRadius: 3,
                  ),
                ],
      ),
    ),
  );
}

Widget _buildAsrShape(Color shapeColor, bool isBeforePrayerTime) {
  return Positioned(
    top: 50, //half container height
    right: 80,
    child: Container(
      width: 15,
      height: 15,
      decoration: BoxDecoration(
        color: shapeColor,
        shape: BoxShape.circle,
        boxShadow:
            isBeforePrayerTime
                ? []
                : [
                  BoxShadow(
                    color: ColorManager.whiteColor,
                    blurRadius: 20,
                    spreadRadius: 1,
                  ),
                ],
      ),
    ),
  );
}

Widget _buildMaghribShape(bool isBeforePrayerTime) {
  return Positioned(
    bottom: 20,
    right: 80,
    child: Container(
      width: 15,
      height: 15,
      decoration: BoxDecoration(
        color:
            isBeforePrayerTime
                ? ColorManager.blackOverlay
                : ColorManager.sunsetOrange,
        shape: BoxShape.circle,
      ),
    ),
  );
}

Widget _buildIshaShape(Color shapeColor) {
  return Positioned(
    top: 20,
    right: 80,
    child: Icon(Icons.auto_awesome, color: shapeColor, size: 20),
  );
}
