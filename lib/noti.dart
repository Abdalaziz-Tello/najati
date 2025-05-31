import 'package:flutter/material.dart';

import 'core/widgets/textfield_common.dart';
import 'main.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
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
              trailing: Container(
                height: screenH * 0.15,
                width: screenW * 0.09,
                // fit: BoxFit.contain,
                child: Icon(Icons.stacked_line_chart_rounded),
              ),
              leading: Text(
                "12/8/2025",
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
          );
        },
        itemCount: 3,
      ),
    );
  }
}
