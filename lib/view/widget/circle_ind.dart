import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';


class CircleInd extends StatelessWidget {

  const CircleInd({
    super.key,
    required this.child,
    required this.percent,
    required this.radius
  });

  final Widget child;
  final double percent;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      center:child,
      backgroundColor: Colors.white12,
      radius:radius ,
      lineWidth: 8,
      animation: true,
      percent: percent,
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: Colors.purple,
    );
  }
}
