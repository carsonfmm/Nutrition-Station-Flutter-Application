import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'metrics_day.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'foodEntryList.dart';
import 'addfood.dart';

class ViewMetricsDay extends StatefulWidget {
  final MetricsDay? metrics;

  const ViewMetricsDay({
    Key? key,
    this.metrics,
  }) : super(key: key);

  @override
  State<ViewMetricsDay> createState() => _ViewMetricsDay();
}

class _ViewMetricsDay extends State<ViewMetricsDay> {
  late DateTime dayDate;

  @override
  void initState() {
    super.initState();

    if (widget.metrics == null) {
      dayDate = DateTime.now();
    }
  }

  @override
  Widget build(BuildContext context) {
    var foodEntries = context.watch<FoodEntryListModel>();
    return Scaffold(
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
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Center(
                child: Text(
                  "Metrics for: ${DateTime.now().toString().split(" ")[0]}",
                  style: const TextStyle(
                      fontSize: 25,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(15, 30, 0, 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Food Consumption: ",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ListView.separated(
              shrinkWrap: true,
              itemCount: foodEntries.foodEntries.length + 1,
              itemBuilder: ((context, index) {
                if (index == foodEntries.foodEntries.length) {
                  return Row(
                    children: [
                      const Expanded(
                          child: Text("Total:",
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold))),
                      Text("\t${foodEntries.getTotalCal()}",
                          style: const TextStyle(fontSize: 18)),
                      const SizedBox(
                        height: 3,
                      )
                    ],
                  );
                } else {
                  return FoodItemEntry(foodEntries.foodEntries[index]);
                }
              }),
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(
                height: 5,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 30, 0, 0),
              child: LinearPercentIndicator(
                width: 140.0,
                lineHeight: 20.0,
                percent: 0.94,
                center: const Text(
                  " 9400/10000 steps",
                  style: TextStyle(fontSize: 12.0),
                ),
                leading: const Text(
                  "Steps Walked:     ",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                backgroundColor: Colors.grey.shade200,
                progressColor: Colors.pink,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 30, 0, 0),
              child: LinearPercentIndicator(
                width: 140.0,
                lineHeight: 20.0,
                percent: 0.63,
                center: const Text(
                  " 1900/3000 ml",
                  style: TextStyle(fontSize: 12.0),
                ),
                leading: const Text(
                  "Water Intake:       ",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                backgroundColor: Colors.grey.shade200,
                progressColor: Colors.lightBlueAccent,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 30, 0, 0),
              child: LinearPercentIndicator(
                width: 140.0,
                lineHeight: 20.0,
                percent: 0.94,
                center: const Text(
                  " 160.3/170.0 lbs",
                  style: TextStyle(fontSize: 12.0),
                ),
                leading: const Text(
                  "Current Weight:   ",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                backgroundColor: Colors.grey.shade200,
                progressColor: Colors.greenAccent,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 30, 0, 0),
              child: LinearPercentIndicator(
                width: 140.0,
                lineHeight: 20.0,
                percent: (foodEntries.getTotalCal()) / 2500,
                center: Text(
                  "\t${foodEntries.getTotalCal()}/2500",
                  style: TextStyle(fontSize: 12.0),
                ),
                leading: const Text(
                  "Calories For Today:   ",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                backgroundColor: Colors.grey.shade200,
                progressColor: Color.fromARGB(255, 190, 180, 32),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text:
                              "          \u2022   Today's Weight Difference: ",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.normal)),
                      TextSpan(
                          text: '+0.2 lbs',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: "          \u2022   Monthly Weight Goal: ",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.normal)),
                      TextSpan(
                          text: '161.5 lbs',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 5, 0, 30),
              child: Align(
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: "          \u2022   Yearly Weight Goal: ",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.normal)),
                      TextSpan(
                          text: '170.0 lbs',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
