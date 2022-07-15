import 'package:bmi_calculator/screens/first_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstScreen(reset: false),
    ),
  );
}
