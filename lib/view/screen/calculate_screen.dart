import 'dart:math';

import 'package:bmi_end/view/screen/result_screen.dart';
import 'package:flutter/material.dart';

import '../../core/class/translation.dart';
import '../../core/function.dart';
import '../../core/style/app_decoration.dart';
import '../../core/style/app_text_scale.dart';
import '../widget/app_bar.dart';
import '../widget/bottom_na_bar.dart';
import '../widget/is_male_container.dart';
import '../widget/verical_sliver.dart';

class CalculateScreen extends StatefulWidget {
  const CalculateScreen({super.key});

  @override
  State<CalculateScreen> createState() => CalculateScreenState();
}

class CalculateScreenState extends State<CalculateScreen> {
  @override
  void initState() {
    super.initState();
  }

  final FixedExtentScrollController _weightController =
      FixedExtentScrollController();
  final FixedExtentScrollController _ageController =
      FixedExtentScrollController();

  double tall = 60.0;
  int age = 12;
  int indexAge = 0;
  var weight = 0;
  int indexWeight = 0;
  bool isFemale = true;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height < 700
        ? 650
        : MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
        backgroundColor: const Color(0xff2c2b2b),
        bottomNavigationBar: BottomNavBar(
          width: width,
          onPressed: onPressed,
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(22, 0, 22, 20),
          child: SingleChildScrollView(
            child: SizedBox(
              height: height / 1.1,
              child: Column(
                children: [
                  const Expanded(
                    flex: 2,
                    child: CalculateScreenAppBar(),
                  ),
                  Expanded(
                      flex: 5,
                      child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  radius: .5,
                                  highlightColor: Colors.transparent,
                                  onTap: () {
                                    setState(() {
                                      isFemale = false;
                                    });
                                  },
                                  child: IsMaleContainer(
                                      height: height,
                                      isFemale: isFemale,
                                      title: "MALE",
                                      icon: Icons.face,
                                      color: !isFemale
                                          ? Colors.blueAccent
                                          : Colors.white),
                                ),
                              ),
                              const SizedBox(
                                width: 22,
                              ),
                              Expanded(
                                child: InkWell(
                                  radius: .5,
                                  highlightColor: Colors.transparent,
                                  onTap: () {
                                    setState(() {
                                      isFemale = true;
                                    });
                                  },
                                  child: IsMaleContainer(
                                      height: height,
                                      isFemale: !isFemale,
                                      title: "FEMALE",
                                      icon: Icons.face_4,
                                      color: isFemale
                                          ? Colors.pink
                                          : Colors.white),
                                ),
                              ),
                            ],
                          ))),
                  Expanded(
                    flex: 10,
                    child: IntrinsicHeight(
                      child: Row(
                        children: [
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Container(
                                alignment: Alignment.center,
                                padding:
                                    const EdgeInsets.only(top: 16),
                                decoration: AppDecorations
                                    .calculateAppDecoration,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "Height",
                                      style: TextStyle(
                                          fontSize: AppTextScales
                                                  .textScaleFactor(
                                                      context) *
                                              16,
                                          color: Colors.white),
                                    ),
                                    Expanded(child: VerticalSliver(
                                      onValueChanged: (double value) {
                                        tall = value;
                                      },
                                    ))
                                  ],
                                )),
                          )),
                          Expanded(
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 20),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          padding:
                                              const EdgeInsets.all(
                                                  16),
                                          margin:
                                              const EdgeInsets.only(
                                                  left: 10),
                                          decoration: AppDecorations
                                              .calculateAppDecoration,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment
                                                    .center,
                                            children: [
                                              Text(
                                                " AGE ",
                                                style: TextStyle(
                                                    fontSize: AppTextScales
                                                            .textScaleFactor(
                                                                context) *
                                                        16,
                                                    height: 2,
                                                    color:
                                                        Colors.white),
                                              ),
                                              const SizedBox(
                                                height: 7,
                                              ),
                                              Expanded(
                                                  child:
                                                      ListWheelScrollView
                                                          .useDelegate(
                                                controller:
                                                    _ageController,
                                                itemExtent: 29.5,
                                                perspective: 0.005,
                                                diameterRatio: 1.2,
                                                onSelectedItemChanged:
                                                    (index) {
                                                  setState(() {
                                                    indexAge = index;
                                                    age = index + 5;
                                                  });
                                                },
                                                childDelegate:
                                                    ListWheelChildBuilderDelegate(
                                                  childCount:
                                                      80 - 5 + 1,
                                                  builder: (context,
                                                      index) {
                                                    final value =
                                                        index + 5;
                                                    return Text(
                                                        value
                                                            .toString(),
                                                        style: index ==
                                                                indexAge
                                                            ? const TextStyle(
                                                                fontSize:
                                                                    20,
                                                                fontWeight: FontWeight
                                                                    .w500,
                                                                color:
                                                                    Color(0xffCFBDFB))
                                                            : const TextStyle(
                                                                fontSize:
                                                                    15,
                                                                fontWeight:
                                                                    FontWeight.w400,
                                                                color:
                                                                    Colors.white38,
                                                              ));
                                                  },
                                                ),
                                              )),
                                              const SizedBox(
                                                height: 7,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 23,
                                      ),
                                      Expanded(
                                        child: Container(
                                          padding:
                                              const EdgeInsets.all(
                                                  16),
                                          margin:
                                              const EdgeInsets.only(
                                                  left: 10),
                                          decoration: AppDecorations
                                              .calculateAppDecoration,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment
                                                    .center,
                                            children: [
                                              Text(
                                                "WEIGHT (kg)",
                                                style: TextStyle(
                                                    fontSize: AppTextScales
                                                            .textScaleFactor(
                                                                context) *
                                                        14,
                                                    height: 2,
                                                    color:
                                                        Colors.white),
                                              ),
                                              const SizedBox(
                                                height: 7,
                                              ),
                                              Expanded(
                                                  child:
                                                      ListWheelScrollView
                                                          .useDelegate(
                                                controller:
                                                    _weightController,
                                                itemExtent: 29.5,
                                                perspective: 0.005,
                                                diameterRatio: 1.2,
                                                onSelectedItemChanged:
                                                    (index) {
                                                  setState(() {
                                                    indexWeight =
                                                        index;
                                                    weight =
                                                        index + 15;
                                                  });
                                                },
                                                childDelegate:
                                                    ListWheelChildBuilderDelegate(
                                                  childCount:
                                                      200 - 5 + 1,
                                                  builder: (context,
                                                      index) {
                                                    final value =
                                                        index + 15;
                                                    return Text(
                                                        value
                                                            .toString(),
                                                        style: index ==
                                                                indexWeight
                                                            ? const TextStyle(
                                                                fontSize:
                                                                    20,
                                                                fontWeight: FontWeight
                                                                    .w500,
                                                                color:
                                                                    Color(0xffCFBDFB))
                                                            : const TextStyle(
                                                                fontSize:
                                                                    15,
                                                                fontWeight:
                                                                    FontWeight.w400,
                                                                color:
                                                                    Colors.white38,
                                                              ));
                                                  },
                                                ),
                                              )),
                                              const SizedBox(
                                                height: 7,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ))),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  void onPressed() {
    var result = weight / pow(tall.round() / 100, 2);
    if (result > 0) {
      setBmiValue((result).ceil());
    }
    Navigator.push(
        context,
        PageSizeTransition(
          ResultScreen(
            result: result,
            isFemale: isFemale,
            age: age,
            weight: weight,
            tall: tall.round(),
          ),
        ));
  }
}
