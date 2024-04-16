import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../core/function.dart';

class RadianRange extends StatefulWidget {
  const RadianRange({super.key, required this.value});
  final double value;

  @override
  State<RadianRange> createState() => _RadianRangeState();
}

class _RadianRangeState extends State<RadianRange> {
  @override
  Widget build(BuildContext context) {
    double bmiValue = widget.value;
    double pointerValue;
    pointerValue = calculateBmi(bmiValue);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: SfRadialGauge(
          axes: <RadialAxis>[
            RadialAxis(
              radiusFactor: 1,
              startAngle: 145,
              endAngle: 38,
              showLabels: false,
              showAxisLine: false,
              showTicks: false,
              minimum: 0,
              maximum: 100,
              ranges: <GaugeRange>[
                GaugeRange(
                  startValue: 0,
                  endValue: 16,
                  color: const Color(0xFF53A10A),
                  sizeUnit: GaugeSizeUnit.factor,
                  startWidth: 0.40,
                  endWidth: 0.40,
                ),
                GaugeRange(
                  startValue: 16.5,
                  endValue: 33,
                  color: const Color(0xFF6DBE21),
                  sizeUnit: GaugeSizeUnit.factor,
                  startWidth: 0.40,
                  endWidth: 0.40,
                ),
                GaugeRange(
                  startValue: 33.5,
                  endValue: 49,
                  color: const Color(0xFFFFDF10),
                  startWidth: 0.40,
                  endWidth: 0.40,
                  sizeUnit: GaugeSizeUnit.factor,
                ),
                GaugeRange(
                  startValue: 49.5,
                  endValue: 66,
                  color: const Color(0xFFFAC257),
                  startWidth: 0.40,
                  endWidth: 0.40,
                  sizeUnit: GaugeSizeUnit.factor,
                ),
                GaugeRange(
                  startValue: 66.5,
                  endValue: 83,
                  color: const Color(0xFFFE4101),
                  sizeUnit: GaugeSizeUnit.factor,
                  startWidth: 0.40,
                  endWidth: 0.40,
                ),
                GaugeRange(
                  startValue: 83.5,
                  endValue: 100,
                  color: const Color(0xFFDD3800),
                  sizeUnit: GaugeSizeUnit.factor,
                  startWidth: 0.40,
                  endWidth: 0.40,
                ),
              ],
              pointers: <GaugePointer>[
                NeedlePointer(
                  value: pointerValue,
                  animationDuration: 800,
                  enableAnimation: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
