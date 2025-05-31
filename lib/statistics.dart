import 'package:flutter/material.dart';

import 'core/constants/image_manager.dart';
import 'core/widgets/textfield_common.dart';
import 'custom_widget.dart';
import 'main.dart';

class Statistics extends StatelessWidget {
  const Statistics({super.key});

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
                mainAxisSize: MainAxisSize.min,
                children: [
                  // SizedBox(height: screenH * 0.1),
                  Text("data"),
                  SizedBox(height: screenH * 0.1),
                  ThisWeek(),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Statistics()),
                      );
                    },
                    child: Container(
                      width: screenW * 0.88,
                      height: screenH * 0.07,
                      decoration: DecorationField.decorationContainer,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "الإشعارات",
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
                              child: Icon(Icons.arrow_back),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Statistics()),
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
                              "إدراج السنن للبرنامج",
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
                              child: Icon(Icons.stacked_line_chart_rounded),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Statistics()),
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
                              "الشخصيات و السمات",
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
                              child: Icon(Icons.stacked_line_chart_rounded),
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
        ],
      ),
    );
  }
}

class ThisWeek extends StatelessWidget {
  const ThisWeek({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: screenW * 0.9,
        height: screenH * 0.33,
        decoration: DecorationField.decorationContainer,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
                           

                      
                          ],
                        ),
          ),
        ),
      ),
    );
  }
}
