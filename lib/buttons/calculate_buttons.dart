import 'package:flutter/material.dart';

import '../colors/colors.dart';
import '../screens/result_screen.dart';

// ignore: must_be_immutable
class CalculateButton extends StatelessWidget {
  late Size size;
  int age;
  int weight;
  double result2;
  int newValue;
  bool isMale;
  bool isFemale;

  CalculateButton(this.newValue, this.isMale, this.isFemale, this.age,
      this.weight,this.result2);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Tooltip(
      message: "Calculate your BMI",
      child: InkWell(
        onTap: () async {
          result2 = (weight / (newValue * newValue)) * 10000;
          result2 = double.parse((result2).toStringAsFixed(2));
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return ResultScreen(result2, newValue, age, weight, isMale, isFemale);
            }),
          );
        },
        child: Container(
          width: size.width,
          height: 60,
          color: kPinkColor,
          child: Center(
            child: Text(
              'CALCULATE YOUR BMI',
              style: TextStyle(
                  color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
