import 'package:bmi_end/core/style/app_decoration.dart';
import 'package:flutter/material.dart';

class TopExpandedContainer extends StatelessWidget {
  const TopExpandedContainer(
      {super.key, required this.child, required this.flex});

  final Widget child;
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
          decoration: AppDecorations.mainAppDecoration,
          child: SizedBox(
            height: 80,
            child: child,
          )),
    );
  }
}
