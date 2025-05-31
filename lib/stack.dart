import 'package:flutter/material.dart';
import 'package:najati_test/main.dart';

import 'AfterSelectCharachter.dart';
import 'models/charachter_model.dart';

class StackList extends StatelessWidget {
  StackList({super.key, required this.name, this.charachters});
  bool name = false;
  GetCharacters? charachters;
  @override
  Widget build(BuildContext context) {
    // List of colors and images for each item

    return Container(
      height: screenH * 0.26,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: charachters!.data.length,
        itemBuilder: (context, index) {
          return Stack(
            //      alignment: Alignment.topCenter,
            children: [
              // Bottom container
              Positioned(
                bottom: 26,
                left: name ? 28 : 0,
                child: Container(
                  width: screenW * 0.35,
                  height: screenH * 0.15,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                ),
              ),
              // Top image
              Padding(
                padding: EdgeInsets.only(top: screenH * 0.02),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => AfterSelectCharachter(
                              charachters!.data[index].image,
                              charachters!.data[index].name,
                            ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Container(
                      width: screenW * 0.44,
                      height: screenH * 0.27,
                      child: Image.asset(charachters!.data[index].image),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
