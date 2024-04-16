import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../core/function.dart';

class BarChartContainer extends StatefulWidget {
  const BarChartContainer({Key? key}) : super(key: key);

  @override
  State<BarChartContainer> createState() => _BarChartContainerState();
}

class _BarChartContainerState extends State<BarChartContainer> {
  Map<String, dynamic> data = {};
  Map<String, dynamic> time = {};

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    data = await getAllSharedPreferences();
    time = await getAllDateTimeSharedPreferences();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return GestureDetector(
      onTapDown: (details) {
        print(data);
        print(time);
        final x = details.localPosition.dx;

        int index =
            (x / ((MediaQuery.of(context).size.width / 2.3) / 6))
                    .floor() +
                1;

        index = index > 6 ? 6 : index;

        String formattedDate =
            time['column${index}date'] ?? calculate_date();

        int bmi = data['column${index}'] ?? 0;

        print("index $index");
        print("bmi $bmi");
        print("time $formattedDate");

        String getMessageFromBMI(int bmi) {
          if (bmi < 18.5) {
            return 'Underweight: Your BMI Result is ${bmi.toStringAsFixed(1)}';
          } else if (bmi >= 18.5 && bmi < 25) {
            return 'Normal weight: Your BMI Result is ${bmi.toStringAsFixed(1)}';
          } else if (bmi >= 25 && bmi < 30) {
            return 'Overweight: Your BMI Result is ${bmi.toStringAsFixed(1)}';
          } else {
            return 'Obese: Your BMI Result is ${bmi.toStringAsFixed(1)}';
          }
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.transparent.withOpacity(0.1),
            content: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Icon(
                        Icons
                            .accessibility_new_outlined, // Icon to indicate information
                        color: Colors.red,
                        size: 30, // Size of the icon
                      ),
                      SizedBox(
                          width: 8), // Space between icon and text
                      Expanded(
                        child: Text(
                          getMessageFromBMI(
                              bmi), // BMI category message
                          style: TextStyle(
                            color: Colors.white, // Text color
                            fontSize: 14, // Font size
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                    width:
                        16), // Space between the two Expanded widgets
                Expanded(
                  child: Row(
                    children: [
                      Icon(
                        Icons
                            .calendar_month_outlined, // Icon to indicate date
                        color: Colors.blue,
                      ),
                      SizedBox(
                          width: 4), // Space between icon and date
                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            Text(
                              "on date: $formattedDate ", // Formatted date
                              style: TextStyle(
                                color: Colors.white, // Text color
                                fontSize: 14, // Font size
                              ),
                            ),
                            Text(
                              "on column: ${index}", // Column index
                              style: TextStyle(
                                color: Colors.white, // Text color
                                fontSize: 14, // Font size
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
      child: BarChart(
        BarChartData(
          barTouchData: barTouchData,
          titlesData: titlesData,
          borderData: borderData,
          barGroups: barGroups,
          gridData: const FlGridData(show: false),
          alignment: BarChartAlignment.spaceAround,
          maxY: 11,
        ),
      ),
    );
  }

  BarTouchData get barTouchData => BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.transparent,
          tooltipPadding: EdgeInsets.zero,
          tooltipMargin: 2,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              rod.toY.round().toString(),
              const TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      );

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.bold,
      fontSize: 10,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = '1';
        break;
      case 1:
        text = '2';
        break;
      case 2:
        text = '3';
        break;
      case 3:
        text = '4';
        break;
      case 4:
        text = '5';
        break;
      case 5:
        text = '6';
        break;
      case 6:
        text = '7';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: Text(text, style: style),
    );
  }

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 20,
            getTitlesWidget: (value, meta) {
              return getTitles(value, meta);
            },
          ),
        ),
        leftTitles: AxisTitles(), // Empty AxisTitles for leftTitles
        topTitles: AxisTitles(), // Empty AxisTitles for topTitles
        rightTitles: AxisTitles(), // Empty AxisTitles for rightTitles
      );

  FlBorderData get borderData => FlBorderData(
        show: false,
      );

  LinearGradient get _barsGradient => const LinearGradient(
        colors: [
          Colors.black87,
          Colors.white54,
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      );

  List<BarChartGroupData> get barGroups {
    return List.generate(6, (index) {
      final columnName = 'column${index + 1}';
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: calculateBmiBar(data[columnName] ?? 9.0),
            gradient: _barsGradient,
          )
        ],
        showingTooltipIndicators: [0],
      );
    });
  }
}

class BarChartSample3 extends StatelessWidget {
  const BarChartSample3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AspectRatio(
      aspectRatio: 1.3,
      child: BarChartContainer(),
    );
  }
}
