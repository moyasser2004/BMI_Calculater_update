import 'package:bmi_end/core/const/app_const.dart';
import 'package:bmi_end/view/widget/third_row.dart';
import 'package:flutter/material.dart';

import 'bottom_column.dart';
import 'char.dart';

class FourthRow extends StatelessWidget {
  const FourthRow(
      {super.key,
      required this.age,
      required this.weight,
      required this.height,
      required this.isMale});

  final int age;
  final int weight;
  final int height;
  final bool isMale;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 8,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          margin: const EdgeInsets.only(top: 10),
          child: Row(
            children: [
              BottomColumn(
                age: '$age',
                weight: '$weight',
                height: '$height',
                isMale: !isMale,
              ),
              const Spacer(),
              ThirdRow(
                h: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: 30,
                      color: Colors.tealAccent,
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 5,
                        ),
                        child: Text(
                          "Diagram",
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 14,
                              fontFamily: appFontFamily,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Expanded(
                      child: BarChartContainer(),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
