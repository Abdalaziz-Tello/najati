import 'package:flutter/material.dart';

import 'core/widgets/textfield_common.dart';
import 'custom_widget.dart';
import 'main.dart';

class SunnahPrayers extends StatefulWidget {
  const SunnahPrayers({super.key});

  @override
  State<SunnahPrayers> createState() => _SunnahPrayersState();
}

class _SunnahPrayersState extends State<SunnahPrayers> {
  bool isSwitched = false;
  bool showAllSunnahPrayers = false;
  bool sunnahListField = true;
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
            top: screenH * 0.10,
            bottom: 20,
            left: 5,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return sunnahListField == false
                    ? Container(
                      width: screenW * 0.88,
                      height: screenH * 0.08,
                      decoration: DecorationField.decorationContainer,
                      child: ListTile(
                        title: Text(
                          "لقد التزم طفلك بالصلاة لمدة شهر",
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                        subtitle: Text(
                          "ل بالصلاة لمدة شهر",
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                        leading: Container(
                          height: screenH * 0.15,
                          width: screenW * 0.09,
                          // fit: BoxFit.contain,
                          child: Switch(
                            value: isSwitched,
                            onChanged: (value) {
                              setState(() {
                                isSwitched = value;
                              });
                            },
                          ),
                        ),
                      ),
                    )
                    : showAllSunnahPrayers == false
                    ? Container(
                      width: screenW * 0.88,
                      height: screenH * 0.08,
                      decoration: DecorationField.decorationContainer,
                      child: ListTile(
                        title: Text(
                          "لقد التزم طفلك بالصلاة لمدة شهر",
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                        subtitle: Text(
                          "ل بالصلاة لمدة شهر",
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.arrow_upward_rounded),
                          onPressed: () {
                            setState(() {
                              showAllSunnahPrayers = !showAllSunnahPrayers;
                            });
                          },
                        ),
                        leading: Container(
                          height: screenH * 0.15,
                          width: screenW * 0.09,
                          // fit: BoxFit.contain,
                          child: Switch(
                            value: isSwitched,
                            onChanged: (value) {
                              setState(() {
                                isSwitched = value;
                              });
                            },
                          ),
                        ),
                      ),
                    )
                    : Container(
                      // height: screenH / 26,
                      //width: screenW * 0.88,
                      decoration: DecorationField.decorationContainer,
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(
                              "لقد التزم طفلك بالصلاة لمدة شهر",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                            subtitle: Text(
                              "ل بالصلاة لمدة شهر",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                            trailing: IconButton(
                              icon: Icon(Icons.arrow_upward_rounded),
                              onPressed: () {
                                setState(() {
                                  showAllSunnahPrayers = !showAllSunnahPrayers;
                                });
                              },
                            ),
                            leading: Container(
                              height: screenH * 0.15,
                              width: screenW * 0.09,
                              // fit: BoxFit.contain,
                              child: Switch(
                                value: isSwitched,
                                onChanged: (value) {
                                  setState(() {
                                    isSwitched = value;
                                  });
                                },
                              ),
                            ),
                          ),
                          Divider(color: Colors.white),
                          Expanded(
                            child: ListView.builder(
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(
                                    "لقد التزم طفلك بالصلاة لمدة شهر",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                  ),
                                  subtitle: Text(
                                    "ل بالصلاة لمدة شهر",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                  ),

                                  leading: Container(
                                    height: screenH * 0.15,
                                    width: screenW * 0.09,
                                    // fit: BoxFit.contain,
                                    child: Switch(
                                      value: isSwitched,
                                      onChanged: (value) {
                                        setState(() {
                                          isSwitched = value;
                                        });
                                      },
                                    ),
                                  ),
                                );
                              },
                              itemCount: 4,
                            ),
                          ),
                        ],
                      ),
                    );
              },
              itemCount: 5,
            ),
          ),
        ],
      ),
    );
  }
}
