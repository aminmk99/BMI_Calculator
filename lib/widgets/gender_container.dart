import 'package:flutter/material.dart';

import '../colors/colors.dart';

class GenderContainer extends StatelessWidget {
  bool gender;
  final IconData icon;
  final String text;
  final VoidCallback func;

  GenderContainer(this.gender, this.icon, this.text, this.func);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kDarkNavyBlueColor,
      ),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        color: kDarkNavyBlueColor,
        child: InkWell(
          splashColor: kDarkNavyBlueColor,
          borderRadius: BorderRadius.circular(10),
          onTap: () {
            func();
          },
          child: Container(
            width: 160,
            height: 160,
            decoration: BoxDecoration(
              color: kLightNavyBlueColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    color: (gender) ? Colors.white : Colors.grey,
                    size: 80,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 20,
                      color: (gender) ? Colors.white : Colors.grey,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
