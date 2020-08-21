import 'package:flutter/material.dart';

class NtvTexts {

  static Widget homeSubTitle(String text) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 3, horizontal: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topRight: Radius.circular(5), bottomRight: Radius.circular(5)),
          color: Colors.white
      ),
      child: Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
//            color: Colors.white
          color: Color(0xFF0e6b39)
        ),
      ),
    );
  }

  static Widget newsSubTitle(String text) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 3, horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topRight: Radius.circular(5), bottomRight: Radius.circular(5)),
        color: Colors.red
      ),
      child: Text(
          "  " + text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: Colors.white
//          color: Color(0xFF0e6b39)
        ),
      ),
    );
  }
}