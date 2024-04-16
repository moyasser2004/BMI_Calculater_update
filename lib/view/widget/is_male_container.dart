import 'package:bmi_end/core/style/app_text_scale.dart';
import 'package:flutter/material.dart';

import '../../core/style/app_decoration.dart';

class IsMaleContainer extends StatelessWidget {
  const IsMaleContainer({
    super.key,
    required this.height,
    required this.isFemale,
    required this.title,
    required this.icon,
    required this.color,
  });

  final double height;
  final bool isFemale;
  final String title;
  final IconData icon;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecorations.calculateAppDecoration,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
              child: FittedBox(
            child: Icon(
              icon,
              size: 65,
              color: color,
            ),
          )),
          Text(
            title,
            style: TextStyle(
              fontSize: AppTextScales.textScaleFactor(context) * 19,
              color: color,
            ),
          )
        ],
      ),
    );
  }
}
