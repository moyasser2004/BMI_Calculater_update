import 'package:bmi_end/view/widget/thidr_row_result_type.dart';
import 'package:flutter/material.dart';



class ThirdRowResultTypeList extends StatelessWidget {

  const ThirdRowResultTypeList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ThirdRowResultType(
          color: Colors.green,
          text: "UnderWeight",
          ),
        ThirdRowResultType(
          color: Colors.yellow,
          text: "HealthyWeight",
       ),
        ThirdRowResultType(
          color: Colors.red,
          text: "OverWeight",),
      ],
    );
  }
}
