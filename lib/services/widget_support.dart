import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppWidget {
  static TextStyle whitetextstyle(double size){
    return TextStyle(
      color: Colors.white,
      fontSize: size,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle boldtextstyle(double size){
    return TextStyle(
      color: Colors.white,
      fontSize: size,
      fontWeight: FontWeight.bold,
    );
  }

    static TextStyle headlinetextstyle(double size){
    return TextStyle(
      color: Colors.black,
      fontSize: size,
      fontWeight: FontWeight.bold,
    );
  }

      static TextStyle normaltextstyle(double size){
    return TextStyle(
      color: Colors.black,
      fontSize: size,
      fontWeight: FontWeight.w500,
    );
  }
}