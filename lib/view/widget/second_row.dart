import 'package:bmi_end/view/widget/text_animation.dart';
import 'package:flutter/material.dart';

import '../../core/const/app_const.dart';
import '../../core/function.dart';
import 'expanded_circle.dart';

class SecondRow extends StatelessWidget {
  const SecondRow(
      {super.key,
      required this.bmi,
      required this.weight,
      required this.tall,
      required this.age,
      required this.isFemale,
      required this.width});

  final double bmi;
  final int weight;
  final int tall;
  final int age;
  final bool isFemale;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 4,
        child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 12, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ExpandedCircle(
                  percent: calculatePBF(
                          bmi, age, isFemale ? 'male' : 'female') /
                      100,
                  radius: width > 1000 ? width / 14 : 69,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const TextAnimation(
                        text: 'FAT',
                      ),
                      Text(
                          "${calculatePBF(bmi, age, isFemale ? 'male' : 'female').ceilToDouble()}",
                          style: const TextStyle(
                              height: 2,
                              color: Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.w700)),
                      const Text("Result ",
                          style: TextStyle(
                              fontSize: 10,
                              fontFamily: appFontFamily,
                              color: Colors.white70))
                    ],
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
                ExpandedCircle(
                    radius: width > 1000 ? width / 14 : 69,
                    percent: bmi < 100 ? bmi / 100 : 99 / 100,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const TextAnimation(
                          text: 'BMI',
                        ),
                        Text("${bmi.ceilToDouble()}",
                            style: const TextStyle(
                                height: 2,
                                color: Colors.red,
                                fontSize: 18,
                                fontWeight: FontWeight.w700)),
                        const Text("Result",
                            style: TextStyle(
                                fontSize: 10,
                                fontFamily: appFontFamily,
                                color: Colors.white70))
                      ],
                    )),
              ],
            )));
  }
}
