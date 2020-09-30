import 'package:flutter/material.dart';

Widget liveButton = Container(
  child: Center(
    child: Container(
      color: Colors.red,
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
      child: Text(
        "LIVE",
        style: TextStyle(
          fontSize: 12,
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),
      ),
    ),
  ),
);