import 'package:flutter/material.dart';

import '../../core/style/app_decoration.dart';

class ThirdRow extends StatelessWidget {
  const ThirdRow(
      {super.key, required this.child, this.v = 16, required this.h});

  final Widget child;
  final double v;
  final double h;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: h, horizontal: v),
        child: Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: AppDecorations.centerContainerAppDecoration,
          child: child,
        ),
      ),
    );
  }
}
