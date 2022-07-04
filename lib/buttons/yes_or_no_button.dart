import 'package:flutter/material.dart';

import '../colors/colors.dart';

class YesNoButton extends StatelessWidget {

  final String text;
  final Color color;
  final Color textColor;
  final double width;
  final VoidCallback onTapped;

  YesNoButton(this.text, this.color, this.textColor,this.width, this.onTapped);


  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      borderRadius: BorderRadius.circular(30),
      child: InkWell(
        onTap: onTapped,
        splashColor: kPinkColor,
        borderRadius: BorderRadius.circular(30),
        child: Container(
          height: 70,
          width: width,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 20,
                  color: textColor,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
