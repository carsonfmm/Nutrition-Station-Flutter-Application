import 'package:flutter/material.dart';
import 'package:group8/view_metrics_day.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:counter/counter.dart';
import 'package:intl/intl.dart';
import 'foodEntryList.dart';
import 'addfood.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});
  @override
  State<Dashboard> createState() => _Dashboard();
}

DateTime now = DateTime.now();
String formattedDate = DateFormat('EEE, MMM d, ' 'yy').format(now);

class _Dashboard extends State<Dashboard> {
  DateTime dateToday = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var foodEntries = context.watch<FoodEntryListModel>();

    return ListView(
        padding: const EdgeInsets.only(top: 28, left: 30, right: 30),
        children: [
          Column(children: [
            Row(
              children: [
                const Text(
                  "Welcome, Kevin!",
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(child: Container()),
                const CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage(
                        "https://i.pinimg.com/236x/65/3b/ba/653bba0fd618b44e0c2c9410bf55c7a7--kevin-hart-kevin-oleary.jpg"),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  formattedDate,
                  style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontStyle: FontStyle.italic),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                //navigate to differnent page
                print("Navigating to Dashboard");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ViewMetricsDay()),
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: const Offset(-1, -2),
                        color: Colors.grey.shade300,
                      )
                    ],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(10),
                      topRight: Radius.circular(30),
                    )),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircularPercentIndicator(
                        radius: 50.0,
                        lineWidth: 8.0,
                        percent: foodEntries.getTotalCal() / 2500,
                        center: Text(
                          "\t${foodEntries.getTotalCal()}",
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.bold),
                        ),
                        progressColor: Colors.red,
                        footer: Padding(
                          padding: EdgeInsets.only(top: 15.0),
                          child: Text(
                            "\t${2500 - foodEntries.getTotalCal()}",
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(11.0),
                            child: LinearPercentIndicator(
                              width: MediaQuery.of(context).size.width * 0.25,
                              lineHeight: 20.0,
                              percent: 0.88,
                              center: const Text(
                                " 7/8 glasses",
                                style: TextStyle(fontSize: 10.0),
                              ),
                              trailing: const Text(
                                "Water    ",
                                style: TextStyle(
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              backgroundColor: Colors.grey.shade200,
                              progressColor: Colors.blue,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: LinearPercentIndicator(
                              width: MediaQuery.of(context).size.width * 0.25,
                              lineHeight: 20.0,
                              percent: 0.5,
                              center: const Text(
                                "100g/200g",
                                style: TextStyle(fontSize: 10.0),
                              ),
                              trailing: const Text(
                                "Protein ",
                                style: TextStyle(
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              backgroundColor: Colors.grey.shade200,
                              progressColor: Colors.green,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(13.0),
                            child: LinearPercentIndicator(
                              width: MediaQuery.of(context).size.width * 0.25,
                              lineHeight: 20.0,
                              percent: 0.3,
                              center: const Text(
                                "10g/33g",
                                style: TextStyle(fontSize: 10.0),
                              ),
                              trailing: const Text(
                                "Fat         ",
                                style: TextStyle(
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              backgroundColor: Colors.grey.shade200,
                              progressColor: Colors.pink,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: LinearPercentIndicator(
                              width: MediaQuery.of(context).size.width * 0.25,
                              lineHeight: 20.0,
                              percent: 0.8,
                              center: const Text(
                                "52g/80g",
                                style: TextStyle(fontSize: 10.0),
                              ),
                              trailing: const Text(
                                "Carbs    ",
                                style: TextStyle(
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              backgroundColor: Colors.grey.shade200,
                              progressColor: Colors.yellow,
                            ),
                          ),
                        ],
                      )
                    ]),
              ),
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              var waterController = TextEditingController();
                              var proteinController = TextEditingController();
                              var fatsController = TextEditingController();
                              var carbsController = TextEditingController();
                              var caloriesController = TextEditingController();
                              return AlertDialog(
                                scrollable: true,
                                title: const Text('Edit Daily Goals'),
                                content: Padding(
                                  padding: const EdgeInsets.all(9.0),
                                  child: Form(
                                    child: Column(
                                      children: <Widget>[
                                        TextFormField(
                                          keyboardType: TextInputType.number,
                                          controller: waterController,
                                          decoration: const InputDecoration(
                                            labelText:
                                                'Water Intake (per 250oz glass)',
                                            icon: Icon(Icons.local_drink),
                                          ),
                                        ),
                                        TextFormField(
                                          keyboardType: TextInputType.number,
                                          controller: proteinController,
                                          decoration: const InputDecoration(
                                            labelText: 'Protein (grams)',
                                            icon: Icon(Icons.fitness_center),
                                          ),
                                        ),
                                        TextFormField(
                                          keyboardType: TextInputType.number,
                                          controller: carbsController,
                                          decoration: const InputDecoration(
                                            labelText: 'Carbs (grams)',
                                            icon:
                                                Icon(Icons.food_bank_outlined),
                                          ),
                                        ),
                                        TextFormField(
                                          keyboardType: TextInputType.number,
                                          controller: fatsController,
                                          decoration: const InputDecoration(
                                            labelText: 'Fats (grams)',
                                            icon: Icon(Icons.food_bank_rounded),
                                          ),
                                        ),
                                        TextFormField(
                                          keyboardType: TextInputType.number,
                                          controller: caloriesController,
                                          decoration: const InputDecoration(
                                            labelText: 'Calories (kCal)',
                                            icon: Icon(Icons.fireplace),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                actions: [
                                  ElevatedButton(
                                      child: const Text("Cancel"),
                                      onPressed: () => Navigator.pop(context)),
                                  ElevatedButton(
                                      child: const Text("Submit"),
                                      onPressed: () {
                                        var waterGoal = waterController.value;
                                        var proteinGoal =
                                            proteinController.value;
                                        var carbsGoal = carbsController.value;
                                        var fatsGoal = fatsController.value;
                                        Navigator.pop(context);
                                      })
                                ],
                              );
                            });
                      },
                      icon: const Icon(Icons.add, size: 24),
                      label: const Text("Edit Goals"),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: const [
                Text(
                  "Add Water",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Counter(
                  min: 0,
                  max: 10,
                  bound: 1,
                  step: 1,
                  onValueChanged: print,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: const [
                Text(
                  "Today's Foods (kCal)",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
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
          ]),
        ]);
  }
}
