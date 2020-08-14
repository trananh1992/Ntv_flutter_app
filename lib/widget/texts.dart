import 'package:flutter/material.dart';

class NtvTexts {
  static Text homeSubTitle(String text) {
    return Text(
        text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
        color: Color(0xFF0e6b39)
      ),
    );
  }
}