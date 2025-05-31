import 'package:flutter/material.dart';

class DecorationField {
  static final decorationTextField = InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: Colors.white),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: Colors.white),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: Colors.white),
    ),
    filled: true,
    fillColor: Colors.transparent,
  );
  static final decorationContainer = BoxDecoration(
    color: Color(0x73C2CEE3).withOpacity(0.45),
    borderRadius: BorderRadius.circular(12),
    border: Border.all(color: Colors.white, width: 1),
    boxShadow: [
      BoxShadow(blurRadius: 18, color: Color(0x73C2CEE3).withOpacity(0.45)),
    ],
  );
}
