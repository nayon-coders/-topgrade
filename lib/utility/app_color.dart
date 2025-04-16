import 'package:flutter/material.dart';
class AppColor{
  static const Color primaryColor = Color(0xFF031e34);
  static const Color secounderyColor = Color(0xFFA3850D);
  static const Color inputFieldColor = Color(0xFFD9D9D9);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF0000000);


  //liniar gradient
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF031e34), Color(0xFFFFFFFF)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}