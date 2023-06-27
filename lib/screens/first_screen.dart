// ignore_for_file: must_be_immutable

import 'package:bmi_calculator/buttons/circle_buttons.dart';
import 'package:flutter/material.dart';
import '../buttons/calculate_buttons.dart';
import '../colors/colors.dart';
import '../widgets/gender_container.dart';

class FirstScreen extends StatefulWidget {
  bool reset;
  FirstScreen({required this.reset});

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  bool isMale = false;
  bool isFemale = false;
  late Size size;
  late int age = 19;
  int weight = 74;
  int weight2 = 74;
  double result2 = 22.1;
  double _currentSliderValue = 183;
  var height = 183;
  late bool reset2 = true;
  // var page = ResultScreen(result2, newValue, age, weight, isMale, isFemale)

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      // key: _scaffold,
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
          )),
      backgroundColor: kDarkNavyBlueColor,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GenderContainer(
                      isMale,
                      Icons.male,
                      'MALE',
                      () {
                        setState(() {
                          isMale = true;
                          isFemale = false;
                        });
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GenderContainer(isFemale, Icons.female, 'FEMALE', () {
                      setState(() {
                        isMale = false;
                        isFemale = true;
                      });
                    })
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 330,
                  height: 160,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: kNavyBlueColor),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 10),
                        child: Text(
                          'HEIGHT',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '$height',
                            style: TextStyle(
                              fontSize: 40,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 13),
                            child: Text(
                              ' cm',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 20),
                            ),
                          )
                        ],
                      ),
                      Slider(
                        value: _currentSliderValue,
                        min: 99,
                        max: 250,
                        divisions: 150,
                        activeColor: kPinkColor,
                        onChanged: (double value) {
                          setState(() {
                            _currentSliderValue = value;
                            height = _currentSliderValue.round();
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 160,
                      height: 185,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: kNavyBlueColor),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 10),
                            child: Text(
                              'WEIGHT',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 20),
                            ),
                          ),
                          Text(
                            '$weight',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleButtons(
                                Icons.remove,
                                () {
                                  setState(() {
                                    if (weight > 12) {
                                      weight--;
                                    }
                                    weight2 = weight;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              CircleButtons(Icons.add, () {
                                setState(() {
                                  if (weight < 450) {
                                    weight++;
                                  }
                                  weight2 = weight;
                                });
                              })
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 160,
                      height: 185,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: kNavyBlueColor),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 10),
                            child: Text(
                              'AGE',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 20),
                            ),
                          ),
                          Text(
                            '$age',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleButtons(
                                Icons.remove,
                                () {
                                  setState(() {
                                    if (age > 3) {
                                      age--;
                                    }
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              CircleButtons(
                                Icons.add,
                                () {
                                  setState(() {
                                    if (age < 120) {
                                      age ++;
                                    }
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Spacer(),
          CalculateButton(
            height,
            isMale,
            isFemale,
            age,
            weight,
            result2,
          ),
        ],
      ),
    );
  }

  reset() {
    if (widget.reset == true) {
      height = 183;
      weight = 74;
      age = 19;
    } else if (widget.reset == false) {
      print('doesn\'t reset');
      return;
    }
  }
}
