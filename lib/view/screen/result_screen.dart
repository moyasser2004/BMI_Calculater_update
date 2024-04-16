import 'package:flutter/material.dart';

import '../../core/function.dart';
import '../widget/first_row.dart';
import '../widget/fourth_row.dart';
import '../widget/second_row.dart';
import '../widget/third_row_child.dart';
import '../widget/third_row.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key,
      required this.result,
      required this.isFemale,
      required this.age,
      required this.weight,
      required this.tall});

  final double result;
  final bool isFemale;
  final int age;
  final int weight;
  final int tall;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height <= 760
        ? 760
        : MediaQuery.sizeOf(context).height;
    return Scaffold(
        backgroundColor: const Color(0xff333333),
        body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 12, horizontal: 20),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: SizedBox(
                  height: height * 1.12,
                  child: Column(
                    children: [
                      FirstRow(
                        weightNumber:
                            calculateBSA(tall, weight).ceilToDouble(),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SecondRow(
                        bmi: result,
                        weight: weight,
                        tall: tall,
                        age: age,
                        isFemale: isFemale,
                        width: height,
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      ThirdRow(
                          v: 20,
                          h: 0,
                          child: ThirdRowChild(
                            value: result,
                          )),
                      const SizedBox(
                        height: 7,
                      ),
                      FourthRow(
                        age: age,
                        weight: weight,
                        height: tall,
                        isMale: isFemale,
                      ),
                      SizedBox(height: 60),
                    ],
                  ),
                ),
              )),
        ));
  }
}
