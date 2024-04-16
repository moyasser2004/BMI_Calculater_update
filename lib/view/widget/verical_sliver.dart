import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class VerticalSliver extends StatefulWidget {
  final void Function(double) onValueChanged;

  const VerticalSliver({super.key, required this.onValueChanged});

  @override
  State<VerticalSliver> createState() => _VerticalSliverState();
}

class _VerticalSliverState extends State<VerticalSliver> {
  double value = 160.0;

  @override
  Widget build(BuildContext context) {
    return SfSlider.vertical(
      min: 120.0,
      max: 200.0,
      interval: 10,
      showTicks: true,
      showLabels: true,
      enableTooltip: true,
      value: value.round(),
      onChanged: (dynamic newValue) {
        setState(() {
          value = newValue;
          widget.onValueChanged(value);
        });
      },
    );
  }
}
