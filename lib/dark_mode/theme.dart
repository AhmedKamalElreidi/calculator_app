import 'package:flutter/material.dart';

ThemeData lightMode=ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Colors.white,
    primary:  Colors.grey.shade300,
    secondary:Colors.black,
   
  ),
);
ThemeData darkMode=ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Colors.grey.shade900,
    primary:  Colors.grey.withOpacity(0.1),
    secondary:Colors.white,
  )

);
