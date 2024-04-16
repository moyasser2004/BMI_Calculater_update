import 'package:bmi_end/core/style/app_text_scale.dart';
import 'package:bmi_end/view/widget/radian_range.dart';
import 'package:bmi_end/view/widget/third_row_list_result_type.dart';
import 'package:flutter/material.dart';

import '../../core/const/app_const.dart';

class ThirdRowChild extends StatelessWidget {
  const ThirdRowChild({super.key, required this.value});

  final double value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: 35,
          color: Colors.tealAccent,
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 14, vertical: 6),
            child: Text(
              "My BMI",
              style: TextStyle(
                color: Colors.black87,
                fontSize: AppTextScales.textScaleFactor(context) * 14,
                fontFamily: appFontFamily,
              ),
            ),
          ),
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 26, 10, 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(child: ThirdRowResultTypeList()),
              Expanded(
                  flex: 2,
                  child: RadianRange(
                    value: value,
                  )),
            ],
          ),
        ))
      ],
    );
  }
}
