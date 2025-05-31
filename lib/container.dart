import 'package:flutter/material.dart';
import 'package:najati_test/core/constants/image_manager.dart';
import 'package:najati_test/main.dart';

class PrayerContainer extends StatelessWidget {
  const PrayerContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          height: screenH * 0.16,
          width: screenW * 0.6,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 2),

            borderRadius: BorderRadius.circular(17),
            color: Colors.blue, // Main container background
          ),
          child: Row(
            children: [
              // Left Section: Prayer Name and Circle

              // Right Section: Icons and Progress Indicator
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        PrayerColumn(
                          imagePath: ImageManager.missed,
                          text: "فائتة",
                        ),
                        PrayerColumn(
                          imagePath: ImageManager.present,
                          text: "حاضر",
                        ),
                        PrayerColumn(
                          imagePath: ImageManager.qada,
                          text: "قضاء",
                        ),
                      ],
                    ),
                    const SizedBox(height: 10), // Spacing before progress bar
                    Container(
                      height: 5,
                      width: screenW * 0.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17),
                        color: Colors.white, // Background for visibility
                      ),
                    ),
                  ],
                ),
              ),
              ClipPath(
                clipper: CutCornerClipper(),
                child: ClipRRect(
                  child: Container(
                    width: screenW * 0.2,
                    height: screenH * 0.16,
                    decoration: const BoxDecoration(color: Colors.red),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Circular Decoration
                        Positioned(
                          right: -130,
                          bottom: -40,
                          top: -12,
                          child: SizedBox(
                            height: 350,
                            width: 350,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                        // Prayer Name
                        Positioned(
                          right: 6,
                          child: const Text(
                            "الفجر",
                            style: TextStyle(color: Colors.white, fontSize: 16),
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
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(text, style: const TextStyle(color: Colors.white)),
          const SizedBox(height: 4),
          Image.asset(
            imagePath,
            width: 16,
            height: 16,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              print('Error loading image: $error');
              return const SizedBox(height: 16);
            },
          ),
        ],
      ),
    );
  }
}

class CutCornerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double radius = 12.0; // Border radius for top-right and bottom-right

    Path path =
        Path()
          ..moveTo(0, 0) // Start at top-left
          ..lineTo(size.width - radius, 0) // Top line to before top-right curve
          ..quadraticBezierTo(
            size.width,
            0,
            size.width,
            radius,
          ) // Top-right curve
          ..lineTo(
            size.width,
            size.height - radius,
          ) // Right vertical line before bottom-right curve
          ..quadraticBezierTo(
            size.width,
            size.height,
            size.width - radius,
            size.height,
          ) // Bottom-right curve
          ..lineTo(0, size.height) // Bottom line
          ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
