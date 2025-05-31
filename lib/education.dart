import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:najati_test/models/educational_section/get_all_stories_response.dart';
import 'package:najati_test/services/api/educational_section.dart';

import 'core/constants/color_manager.dart';
import 'core/constants/image_manager.dart';
import 'custom_widget.dart';
import 'main.dart';
import 'models/charachter_model.dart';
import 'services/api/charachter.dart';
import 'stack.dart';

class LearnTogetherScreen extends StatefulWidget {
  LearnTogetherScreen({super.key});

  @override
  State<LearnTogetherScreen> createState() => _LearnTogetherScreenState();
}

class _LearnTogetherScreenState extends State<LearnTogetherScreen> {
  //   bool openCharachter = false;
  //   late GetAllStoriesResponse res;
  //   EducationalSectionServiceImp model = EducationalSectionServiceImp(dio: Dio());
  //   @override
  //   void initState() {
  //     super.initState();
  //     _loadData();
  //   }

  //   void _loadData() async {
  //     try {
  //       res = await model.getAllStories(); // Call your API
  //       // Use the response as needed
  //     } catch (e) {
  //       print("API call failed: $e");
  //     }
  //   }

  //   bool isStoryHovered = false;
  //   @override
  //   Widget build(BuildContext context) {
  //     return Scaffold(
  //       backgroundColor: const Color(0xFFEAF1FB),
  //       body: Stack(
  //         children: [
  //           TopRightCircle(),
  //           LeftBottomCircle(),
  //           RightBottomCircle(),

  //           // Top-left gear icon
  //           Positioned(
  //             top: screenH * 0.12,
  //             left: 20,
  //             child: Icon(
  //               Icons.settings,
  //               color: ColorManager.deepPurple,
  //               size: 40,
  //             ),
  //           ),

  //           // Main content
  //           Column(
  //             // mainAxisAlignment: MainAxisAlignment.spaceAround,
  //             children: [
  //               Padding(
  //                 padding: EdgeInsets.symmetric(vertical: screenH * 0.1),
  //                 child: Container(
  //                   width: screenW * 0.46,
  //                   padding: const EdgeInsets.symmetric(
  //                     horizontal: 20,
  //                     vertical: 5,
  //                   ),
  //                   decoration: BoxDecoration(
  //                     color: Colors.white.withOpacity(0.3),
  //                     borderRadius: BorderRadius.circular(40),
  //                   ),
  //                   child: Center(
  //                     child: const Text(
  //                       "لنتعلم معاً",
  //                       style: TextStyle(
  //                         fontSize: 22,
  //                         fontWeight: FontWeight.bold,
  //                         color: ColorManager.deepPurple,
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               ),

  //               // SizedBox(height: screenH * 0.05),

  //               // Row of learning cards
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                 children: [
  //                   MouseRegion(
  //                     onEnter: (_) => setState(() => isStoryHovered = true),
  //                     onExit: (_) => setState(() => isStoryHovered = false),
  //                     child: InkWell(
  //                       onTap: () {
  //                         setState(() {
  //                           openCharachter = true;
  //                         });
  //                       },
  //                       child: LearningCard(
  //                         imagePath: ImageManager.prayer,
  //                         label: 'الصلاة',
  //                         backgroundColor:
  //                             isStoryHovered
  //                                 ? Color(0xFF95D1C8)
  //                                 : const Color(0xFF95D1C8),
  //                       ),
  //                     ),
  //                   ),
  //                   LearningCard(
  //                     imagePath: ImageManager.prayer,
  //                     label: 'الوضوء',
  //                     backgroundColor:
  //                         isStoryHovered
  //                             ? const Color.fromARGB(255, 160, 194, 189)
  //                             : const Color(0xFF95D1C8),
  //                   ),
  //                 ],
  //               ),
  //               openCharachter
  //                   ? Column(
  //                     crossAxisAlignment: CrossAxisAlignment.end,
  //                     children: [
  //                       openCharachter
  //                           ? Padding(
  //                             padding: EdgeInsets.symmetric(
  //                               vertical: screenH * 0.03,
  //                             ),
  //                             child: Text(".. سنتعلم الوضوء مع "),
  //                           )
  //                           : Text(""),

  //                       StackList(name: false),
  //                     ],
  //                   )
  //                   : SizedBox(),
  //             ],
  //           ),

  //           // "m" speech-bubble avatar
  //         ],
  //       ),
  //     );
  //   }
  // }

  bool openCharachter = false;
  GetAllStoriesResponse res = GetAllStoriesResponse(status: '', data: []);
  EducationalSectionServiceImp model = EducationalSectionServiceImp(dio: Dio());
  bool isStoryHovered = false;
  bool isLoading = true;
  GetCharacters? charachterResponse;
  int num = 0;

  Future<GetCharacters?> fetchCharachter() async {
    final resulti;
    try {
      CharacterServiceImp serviceImp = CharacterServiceImp(dio: Dio());
      resulti = await serviceImp.getCharachters();
      setState(() {
        charachterResponse = resulti;
      });
    } catch (e) {
      print("chrachter error ");
    }

    return charachterResponse;
  }

  @override
  void initState() {
    super.initState();
    _loadData();
    fetchCharachter();
  }

  void _loadData() async {
    try {
      final result = await model.getAllStories();
      setState(() {
        res = result;
        isLoading = false;
      });
    } catch (e) {
      print("API call failed: $e");
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
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: screenH * 0.1),
                child: Container(
                  width: screenW * 0.46,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: const Center(
                    child: Text(
                      "لنتعلم معاً",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: ColorManager.deepPurple,
                      ),
                    ),
                  ),
                ),
              ),

              isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : SizedBox(
                    height: screenH * 0.18,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: res.data.length,
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      itemBuilder: (context, index) {
                        final item = res.data[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                openCharachter = true;
                              });
                            },
                            child: LearningCard(
                              imagePath: item.image,
                              label: item.name,
                              backgroundColor: const Color(0xFF95D1C8),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

              openCharachter
                  ? Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: screenH * 0.03),
                        child: Text(".. سنتعلم الوضوء مع "),
                      ),
                      StackList(name: false, charachters: charachterResponse),
                    ],
                  )
                  : const SizedBox(),
            ],
          ),
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
