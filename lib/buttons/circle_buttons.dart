import 'package:flutter/material.dart';

import '../colors/colors.dart';

// ignore: must_be_immutable
class CircleButtons extends StatelessWidget {
  final IconData icon;
  VoidCallback operation;
  CircleButtons(this.icon, this.operation);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 60,
      child: FloatingActionButton(
        onPressed: operation,
        backgroundColor: kLightNavyBlueColor,
        child: Icon(
          icon,
          color: Colors.grey,
        ),
      ),
    );
  }
}
