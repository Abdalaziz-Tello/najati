import 'package:flutter/material.dart';
import 'core/constants/color_manager.dart';
import 'custom_widget.dart';
import 'main.dart';
import 'stack.dart';

class SelectStory extends StatefulWidget {
  const SelectStory({super.key});

  @override
  State<SelectStory> createState() => _SelectStoryState();
}

class _SelectStoryState extends State<SelectStory> {
  int currentIndex = 0;

  final List<Map<String, String>> cards = [
    {
      'image': 'assets/images/smile.png',
      'text':
          'ثم يجلس بين السجدتين و يقول ( رب اغفر لي وارحمني واهدني وارزقني واجبرني وعافني ).',
    },
    {
      'image': 'assets/images/smile.png',
      'text': 'يقوم من السجود إلى الوقوف مرة أخرى.',
    },
    {
      'image': 'assets/images/smile.png',
      'text': 'يكبر ويذهب إلى السجدة الثانية.',
    },
    {
      'image': 'assets/images/smile.png',
      'text': 'يقرأ التحيات في الجلوس الأخير.',
    },
    {
      'image': 'assets/images/smile.png',
      'text': 'يصلي على النبي محمد صلى الله عليه وسلم.',
    },
    {
      'image': 'assets/images/smile.png',
      'text': 'يسلم على اليمين ثم على اليسار لإنهاء الصلاة.',
    },
  ];

  void nextCard() {
    if (currentIndex < cards.length - 1) {
      setState(() {
        currentIndex++;
      });
    }
  }

  void prevCard() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF1FB),
      body: Stack(
        children: [
          TopRightCircle(),
          LeftBottomCircle(),
          RightBottomCircle(),

          // Top-left gear icon
          Positioned(
            top: screenH * 0.12,
            left: 20,
            child: Icon(
              Icons.settings,
              color: ColorManager.deepPurple,
              size: 40,
            ),
          ),

          // Main content
          Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: screenH * 0.12),
                child: Container(
                  width: screenW * 0.54,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Center(
                    child: const Text(
                      "لنتعلم معاً الوضوء ",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: ColorManager.deepPurple,
                      ),
                    ),
                  ),
                ),
              ),

              // SizedBox(height: screenH * 0.05),

              // Row of learning cards
              AnimatedSwitcher(
                duration: Duration(milliseconds: 500),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset(1.0, 0.0), // slide in from right
                      end: Offset(0.0, 0.0),
                    ).animate(animation),
                    child: FadeTransition(opacity: animation, child: child),
                  );
                },

                child: Container(
                  key: ValueKey<int>(currentIndex), // IMPORTANT!
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  padding: EdgeInsets.all(16),

                  width: screenW * 0.85,
                  height: screenH * 0.53,
                  decoration: BoxDecoration(
                    color: Color(0xFFBDE9E5),
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 12,
                        offset: Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Image
                      Container(
                        width: screenW * 0.6,
                        height: screenH * 0.25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white,
                        ),
                        child: Image.asset(
                          cards[currentIndex]['image']!,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Text + Sound Icon
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          circularArrowButton(
                            icon: Icons.arrow_back,
                            onTap: () {
                              // handle back
                              if (currentIndex > 0) {
                                setState(() => currentIndex--);
                              }
                            },
                          ),
                          circularArrowButton(
                            icon: Icons.arrow_forward,
                            onTap: () {
                              // handle forward
                              if (currentIndex < cards.length - 1) {
                                setState(() => currentIndex++);
                              }
                            },
                          ),
                        ],
                      ),

                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Expanded(
                      //       child: Text(
                      //         cards[currentIndex]['text']!,
                      //         style: TextStyle(
                      //           fontSize: 18,
                      //           fontFamily: 'Cairo',
                      //         ),
                      //         textAlign: TextAlign.right,
                      //       ),
                      //     ),
                      //     IconButton(
                      //       icon: Icon(Icons.volume_up, color: Colors.grey),
                      //       onPressed: () {
                      //         // Play audio logic
                      //       },
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 32),

              // Navigation Arrows
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    iconSize: 32,
                    onPressed: prevCard,
                    color: Colors.deepPurple,
                  ),
                  const SizedBox(width: 50),
                  IconButton(
                    icon: Icon(Icons.arrow_forward_ios),
                    iconSize: 32,
                    onPressed: nextCard,
                    color: Colors.deepPurple,
                  ),
                ],
              ),
            ],
          ),

          // "m" speech-bubble avatar
        ],
      ),
    );
  }
}

class LearningCard extends StatelessWidget {
  final String imagePath;
  final String label;

  final Color backgroundColor;
  const LearningCard({
    Key? key,
    required this.imagePath,
    required this.label,
    this.backgroundColor = const Color(0xFF95D1C8),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenW * 0.3,
      height: screenH * 0.16,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(child: Image.asset(imagePath, fit: BoxFit.contain)),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(fontSize: 14, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}

Widget circularArrowButton({
  required IconData icon,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [Color(0xFF8466D3), Color(0xFF92B6F7)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 6,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Icon(icon, color: Colors.white),
    ),
  );
}
