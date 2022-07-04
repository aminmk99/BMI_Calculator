import 'dart:io';

import 'package:flutter/material.dart';
import '../colors/colors.dart';
import '../widgets/my_alert_dialog.dart';
import 'first_screen.dart';

class ResultScreen extends StatelessWidget {
  double result2;
  int age;
  int newValue;
  int weight;
  bool isMale;
  bool isFemale;
  bool reset2 = false;

  ResultScreen(
    this.result2,
    this.newValue,
    this.age,
    this.weight,
    this.isMale,
    this.isFemale,
  );

  String resultStr = 'NORMAL';
  late Size size;

  //String comment2 = 'You have a normal body weight. Good job!';

  //String result = r.toString();

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kDarkNavyBlueColor,
        centerTitle: true,
        title: Text(
          'BMI CALCULATOR',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.sort,
            color: kLightGreyColor,
            size: 30,
          ),
        ),
      ),
      backgroundColor: kDarkNavyBlueColor,
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Your Result',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 400,
                  height: 500,
                  decoration: BoxDecoration(
                      color: kLightNavyBlueColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          comment(),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        '$result2',
                        style: TextStyle(
                            fontSize: 100,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Normal BMI range:',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '18,5 - 25 kg/m2',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 50),
                              child: comment2(),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: 250,
                          height: 80,
                          decoration: BoxDecoration(color: kDarkNavyBlueColor),
                          child: Center(
                            child: Text(
                              'SAVE RESULT',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return MyAlertDialog(
                    'Would you like to reset fields:',
                    20,
                    () {
                      onNoPressed(context);
                    },
                    () {
                      onYesPressed(context);
                    },
                  );
                },
              ); // Navigator.pop(context);
            },
            child: Container(
              width: size.width,
              height: 60,
              color: kPinkColor,
              child: Center(
                child: Text(
                  'RE-CALCULATE YOUR BMI',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onYesPressed(BuildContext context) async {
    // reset();
    // reset2 = true;
    // Navigator.pop(context);
    // Navigator.pop(context, reset2);
    // await Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) {
    //     return FirstScreen(newValue, age);
    //   }),
    // );
    reset2 = true;
    // navigate(context, reset2);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return FirstScreen(reset: reset2);
    }));
  }

  void onNoPressed(BuildContext context) {
    reset2 = false;
    // Navigator.pop(context);
    // Navigator.pop(context);
    // naviage(context, reset2);
    // navigate(context, reset2);
    Navigator.pop(context, reset);
    Navigator.pop(context, reset);
  }

  void reset() {
    age = 19;
    newValue = 183;
    weight = 74;
    isMale = false;
    isFemale = false;
  }

  Widget comment() {
    if (result2 < 18.5) {
      resultStr = "UNDERWEIGHT";
      return Text(
        resultStr,
        style: TextStyle(
            color: kYellowColor, fontSize: 25, fontWeight: FontWeight.w700),
      );
    } else if (result2 >= 18.5 && result2 <= 24.9) {
      resultStr = "NORMAL";
      return Text(
        resultStr,
        style: TextStyle(
            color: kGreenColor, fontSize: 25, fontWeight: FontWeight.w700),
      );
    } else {
      resultStr = " OVERWEIGHT";
      return Text(
        resultStr,
        style: TextStyle(
            color: kRedColor, fontSize: 25, fontWeight: FontWeight.w700),
      );
    }
  }

  Widget comment2() {
    if (result2 < 18.5) {
      // comment2 = 'You have a skinny body. You need to gain weight!';
      return Text(
        'You have a skinny body. You need to gain weight!',
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
      );
    } else if (result2 >= 18.5 && result2 <= 24.9) {
      return Text(
        'You have a normal body weight. Good job!',
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
      );
    } else {
      return Text(
        'You have a fat body weight. You need to lose weight!',
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
      );
    }
  }

  navigate(BuildContext context, bool reset) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return FirstScreen(
            reset: reset,
          );
        },
      ),
    );
  }

  navigte2(BuildContext context, bool reset) {
    Navigator.pop(context, reset);
    Navigator.pop(context, reset);
  }
}
