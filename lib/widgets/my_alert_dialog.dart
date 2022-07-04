import 'package:flutter/material.dart';

import '../buttons/yes_or_no_button.dart';
import '../colors/colors.dart';

class MyAlertDialog extends StatelessWidget {
  final String title;
  final double borderRadius;
  final VoidCallback onYesPressed;
  final VoidCallback onNoPressed;

  MyAlertDialog(
      this.title, this.borderRadius, this.onNoPressed, this.onYesPressed);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      backgroundColor: kGreenColor,
      title: Text(title),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          YesNoButton(
            'Yes',
            kDarkNavyBlueColor,
            Colors.white,
            100,
            onYesPressed,
          ),
          SizedBox(
            width: 10,
          ),
          YesNoButton(
            'No',
            Colors.white,
            kDarkNavyBlueColor,
            100,
            onNoPressed,
          ),
        ],
      ),
    );
  }
}
