import 'package:bmi_calculator/screens/first_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstScreen(reset: false,),
    ),
  );
}
