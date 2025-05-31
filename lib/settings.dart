import 'package:flutter/material.dart';
import 'package:najati_test/create_child.dart';

import 'core/constants/image_manager.dart';
import 'core/widgets/textfield_common.dart';
import 'custom_widget.dart';
import 'main.dart';
import 'statistics.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

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
            top: screenH * 0.12,
            bottom: 20,
            left: 5,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // SizedBox(height: screenH * 0.1),
                  SizedBox(height: screenH * 0.1),
                  Container(
                    width: screenW * 0.9,
                    height: screenH * 0.63,
                    decoration: DecorationField.decorationContainer,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Boo image
                            Image.asset(
                              ImageManager.noImage,
                              height: screenH * 0.12,
                              fit: BoxFit.contain,
                            ),
                            Text("أحمد نابلسي"),
                            SizedBox(height: screenH * 0.03),

                            // First TextFormField with label
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Statistics(),
                                  ),
                                );
                              },
                              child: Container(
                                width: screenW * 0.88,
                                height: screenH * 0.1,
                                decoration: DecorationField.decorationContainer,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "hamza",
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Container(
                                        height: screenH * 0.15,
                                        width: screenW * 0.09,
                                        // fit: BoxFit.contain,
                                        child: Icon(
                                          Icons.stacked_line_chart_rounded,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
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
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => CreateChild()),
          // );
        },
      ),
    );
  }
}
