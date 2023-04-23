import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class ViewMetricsMonth extends StatefulWidget {
  const ViewMetricsMonth({super.key});

  @override
  State<ViewMetricsMonth> createState() => _ViewMetricsMonth();
}

class _ViewMetricsMonth extends State<ViewMetricsMonth> {
  late DateTime dayDate;

  @override
  void initState() {
    super.initState();
  }

  List<MonthData> data = [
    MonthData('1', 940, 1100, 160.3),
    MonthData('5', 957, 1387, 161),
    MonthData('10', 952, 1497, 161.2),
    MonthData('15', 963, 1504, 163),
    MonthData('20', 974, 1657, 164.5),
    MonthData('25', 984, 1766, 165),
    MonthData('30', 1015, 1900, 165.1),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: const Color.fromARGB(255, 248, 239, 226),
    appBar: AppBar(
      title: const Text("Nutrition Station"),
      centerTitle: true,
    ),
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(7),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: Center (
              child: Text(
                "Metrics for: ${DateFormat.MMMM().format(DateTime.now())} ${DateFormat.y().format(DateTime.now())}",
                style: const TextStyle(fontSize: 25, color: Colors.black87, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
              height: MediaQuery.of(context).size.height-180,
              width: MediaQuery.of(context).size.width-35,
              child: SfCartesianChart(
                  tooltipBehavior: TooltipBehavior(enable: true),
                  primaryXAxis: CategoryAxis(
                      title: AxisTitle(
                          text: 'Day',
                          textStyle: const TextStyle(
                              color: Colors.blueAccent,
                              fontFamily: 'Roboto',
                              fontSize: 16,
                              fontWeight: FontWeight.w800
                          )
                      )
                  ),
                  legend: Legend(isVisible: true, position: LegendPosition.bottom),
                  series: <ChartSeries<MonthData, String>>[
                    LineSeries<MonthData, String>(
                      dataSource: data,
                      xValueMapper: (MonthData detail, _) => detail.day,
                      yValueMapper: (MonthData detail, _) => detail.measurementSteps,
                      name: 'Steps (0.1x)',
                      dataLabelSettings: DataLabelSettings(isVisible: true),
                    ),
                    LineSeries<MonthData, String>(
                      dataSource: data,
                      xValueMapper: (MonthData detail, _) => detail.day,
                      yValueMapper: (MonthData detail, _) => detail.measurementWater,
                      name: 'Water (ml)',
                      dataLabelSettings: DataLabelSettings(isVisible: true),
                    ),
                    LineSeries<MonthData, String>(
                      dataSource: data,
                      xValueMapper: (MonthData detail, _) => detail.day,
                      yValueMapper: (MonthData detail, _) => detail.measurementWeight,
                      name: 'Weight (lbs)',
                      dataLabelSettings: DataLabelSettings(isVisible: true),
                    ),
                  ],
              ),
          )
        ],
      ),
    ),
  );
}

class MonthData{

  final String day;
  final double measurementSteps;
  final double measurementWater;
  final double measurementWeight;

  MonthData(this.day, this.measurementSteps, this.measurementWater, this.measurementWeight);

}