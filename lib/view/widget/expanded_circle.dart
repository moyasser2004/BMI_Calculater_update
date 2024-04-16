import 'package:flutter/material.dart';
import 'circle_ind.dart';


class ExpandedCircle extends StatefulWidget {
  const ExpandedCircle({
    super.key,
    required this.child,
    required this.percent,
    required this.radius
  });

  final Widget child;
  final double percent;
  final double radius;

  @override
  State<ExpandedCircle> createState() => _ExpandedCircleState();
}

class _ExpandedCircleState extends State<ExpandedCircle> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex:3,
      child: Align(
        child: CircleInd(
          percent: widget.percent,
        radius: widget.radius,
        child: widget.child,),
      ),
    );
  }
}
