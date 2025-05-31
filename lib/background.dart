import 'package:flutter/material.dart';
import 'package:najati_test/register.dart';
import 'package:najati_test/main.dart';

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDEE9FD),
      body: Stack(
        children: [
          // Background containers first
          Positioned(
            top: 40,
            right: -65,
            child: Opacity(
              opacity: 0.7,
              child: Center(
                child: Container(
                  width: screenW * 0.4,
                  height: screenH * 0.25,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(106, 82, 59, 107),
                    boxShadow: [BoxShadow(blurRadius: 70)],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: -40,
            bottom: 170,
            child: Opacity(
              opacity: 0.4,
              child: Container(
                width: screenW * 0.2,
                height: screenH * 0.3,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(255, 196, 146, 39),
                  boxShadow: [BoxShadow(blurRadius: 50)],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -55,
            right: -45,
            child: Opacity(
              opacity: 0.6,
              child: Container(
                width: screenW * 0.36,
                height: screenH * 0.2,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xff955cbeb2),
                  boxShadow: [BoxShadow(blurRadius: 50)],
                ),
              ),
            ),
          ),
          // Main content last (to appear on top)
          Register(),
        ],
      ),
    );
  }
}
