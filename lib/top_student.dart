import 'package:flutter/material.dart';
import 'package:najati_test/core/constants/image_manager.dart';

import 'custom_widget.dart';
import 'main.dart';

class TopStudent extends StatelessWidget {
  const TopStudent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          TopRightCircle(),
          LeftBottomCircle(),
          RightBottomCircle(),
          Positioned(
            right: 5,
            top: screenH * 0.47,
            bottom: 20,
            left: 5,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,

                      //   alignment: Alignment.topCenter,
                      children: [
                        Container(
                          width: screenW * 0.31,
                          height: screenH * 0.28,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                              bottomLeft: Radius.circular(12),
                            ),
                            color: Colors.deepPurple.withAlpha(88),
                            // boxShadow: [BoxShadow(blurRadius: 7)],
                          ),
                        ),
                        Positioned(
                          top: -29,
                          left: screenW * 0.03,
                          bottom: screenH * 0.26,
                          child: Stack(
                            children: [
                              Container(
                                height: screenH * 0.2,
                                width: screenW * 0.24,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.orange,
                                ),
                              ),
                              Positioned(
                                top: -8,
                                left: screenW * 0.08,
                                child: Container(
                                  height: screenH * 0.1,
                                  width: screenW * 0.1,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                        ImageManager.firstchild,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: screenH * 0.07,
                          left: screenW * 0.13,
                          child: Text("3"),
                        ),
                        Positioned(
                          top: screenH * 0.12,
                          left: screenW * 0.09,
                          child: Text("أيمن أمين"),
                        ),
                      ],
                    ),
                    Stack(
                      alignment: Alignment.topCenter,
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: screenW * 0.29,
                          height: screenH * 0.35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                            ),
                            color: Colors.deepPurple.withAlpha(70),
                            // boxShadow: [BoxShadow(blurRadius: 7)],
                          ),
                        ),

                        Positioned(
                          top: -29,
                          // left: screenW * 0.03,
                          bottom: screenH / 3,
                          child: Stack(
                            children: [
                              Row(
                                children: [
                                  Transform(
                                    alignment: Alignment.center,
                                    transform: Matrix4.rotationY(
                                      3.1416,
                                    ), // 180 degrees in radians
                                    child: Image.asset(
                                      ImageManager.food,
                                      fit: BoxFit.cover,
                                    ),
                                  ),

                                  Image.asset(
                                    ImageManager.food,
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              ),
                              Container(
                                height: screenH * 0.2,
                                width: screenW * 0.24,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.orange,
                                ),
                              ),
                              Positioned(
                                top: -8,
                                left: screenW * 0.08,
                                child: Container(
                                  height: screenH * 0.1,
                                  width: screenW * 0.1,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                        ImageManager.firstchild,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      alignment: Alignment.topCenter,

                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: screenW * 0.31,
                          height: screenH * 0.28,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                              bottomRight: Radius.circular(12),
                            ),
                            color: Colors.deepPurple.withAlpha(100),
                            // boxShadow: [BoxShadow(blurRadius: 7)],
                          ),
                        ),
                        Positioned(
                          top: -29,
                          left: screenW * 0.03,
                          bottom: screenH * 0.26,
                          child: Stack(
                            children: [
                              Container(
                                height: screenH * 0.2,
                                width: screenW * 0.24,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.orange,
                                ),
                              ),
                              Positioned(
                                top: -8,
                                left: screenW * 0.08,
                                child: Container(
                                  height: screenH * 0.1,
                                  width: screenW * 0.1,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                        ImageManager.firstchild,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Text("مرتبتي"),
                Container(
                  color: Color.fromARGB(148, 155, 218, 226),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              shape: BoxShape.circle,
                            ),
                          ),
                          Container(
                            width: 5,
                            height: 5,
                            child: Image.asset(ImageManager.bronzie),
                          ),
                        ],
                      ),
                      Container(child: Image.asset(ImageManager.bronzie)),
                      Row(
                        children: [
                          Text("جميل جمال"),
                          Container(child: Image.asset(ImageManager.bronzie)),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenH * 0.06),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
