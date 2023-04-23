import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const List<Widget> media = <Widget>[
  Icon(
    FontAwesomeIcons.instagram,
    size: 20,
  ),
  Icon(
    FontAwesomeIcons.facebook,
  ),
  Icon(
    FontAwesomeIcons.snapchat,
  ),
];

class Settings extends StatefulWidget {
  const Settings({super.key});
  @override
  State<Settings> createState() => _Settings();
}

class _Settings extends State<Settings> {
  final List<bool> _selectedMedia = <bool>[true, false, false];

  bool vertical = false;
  bool isWater = false;
  bool isCalorie = false;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(7),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Center(
                child: Text(
                  "Settings",
                  style: const TextStyle(
                      fontSize: 25,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 180,
                decoration: BoxDecoration(
                    color: Colors.white60,
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
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
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
                                    text: "Goals: ",
                                    style: TextStyle(
                                        fontSize: 24,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
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
                                    text: "     Current Calorie Goal: ",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal)),
                                TextSpan(
                                    text: '2500 kcal',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
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
                                    text: "     Current Water Intake Goal: ",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal)),
                                TextSpan(
                                    text: '1900 ml',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
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
                                    text: "     Current Weight Goal: ",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal)),
                                TextSpan(
                                    text: '170.0 lbs',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 20, 0, 30),
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
                          text: "Favourite Recipes: ",
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.black87,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: const DecorationImage(
                      image: NetworkImage(
                          "https://www.thespruceeats.com/thmb/0Xlm3149BBLOSo3y3MiUNS8-1Bg=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/risotto-recipe-for-beginners-996008-hero-01-9ca07ec80a024c80909e0c8a92f0674c.jpg"),
                      fit: BoxFit.cover,
                      opacity: 0.3),
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
              child: const Text(
                "Risotto",
                style: TextStyle(
                  fontSize: 20,
                ),
                textAlign: TextAlign.right,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: const DecorationImage(
                      image: NetworkImage(
                          "https://dinnerthendessert.com/wp-content/uploads/2019/11/BBQ-Chicken-Wings-4x3-768x576.jpg"),
                      fit: BoxFit.cover,
                      opacity: 0.3),
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
              child: const Text(
                "Barbeque Chicken Wings",
                style: TextStyle(
                  fontSize: 20,
                ),
                textAlign: TextAlign.right,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: const DecorationImage(
                      image: NetworkImage(
                          "https://www.recipevibes.com/wp-content/uploads/2022/10/How-to-cook-sirloin-steak-sirloin-steak-recipe-easy.jpeg"),
                      fit: BoxFit.cover,
                      opacity: 0.3),
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
              child: const Text(
                "Sirloin Steak",
                style: TextStyle(
                  fontSize: 20,
                ),
                textAlign: TextAlign.right,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 50, 0, 0),
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
                          text: "Change Username: ",
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.black87,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(18, 0, 18, 0),
              child: TextFormField(
                decoration:
                    InputDecoration(hintText: "Please enter your new username"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Username Saved!')),
                  );
                },
                child: const Text('Save'),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 50, 0, 0),
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
                          text: "Change Weight: ",
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.black87,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(18, 0, 18, 0),
              child: TextFormField(
                decoration:
                    InputDecoration(hintText: "Please enter your new weight"),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(18, 16, 18, 20),
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Weight Saved!')),
                  );
                },
                child: const Text('Save'),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 160,
                decoration: BoxDecoration(
                    color: Colors.white60,
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
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
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
                                    text: "Notification Settings: ",
                                    style: TextStyle(
                                        fontSize: 24,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: <Widget>[
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
                                        text: "     Water Intake Reminder: ",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.normal)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(5, 19, 0, 0),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Switch(
                                    value: isWater,
                                    onChanged: (_isWater) {
                                      setState(() {
                                        isWater = _isWater;
                                      });
                                    })),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(1, 0, 0, 0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: RichText(
                                text: const TextSpan(
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.black,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: "     Calories Intake Reminder: ",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.normal)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Switch(
                                    value: isCalorie,
                                    onChanged: (_isCalorie) {
                                      setState(() {
                                        isCalorie = _isCalorie;
                                      });
                                    })),
                          ),
                        ],
                      ),
                    ]),
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
                          text: "Social Media: ",
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.black87,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ToggleButtons(
              direction: vertical ? Axis.vertical : Axis.horizontal,
              onPressed: (int index) {
                // All buttons are selectable.
                setState(() {
                  _selectedMedia[index] = !_selectedMedia[index];
                });
              },
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              selectedBorderColor: Colors.blue[700],
              selectedColor: Colors.white,
              fillColor: Colors.green[200],
              color: Colors.blue[400],
              constraints: const BoxConstraints(
                minHeight: 40.0,
                minWidth: 80.0,
              ),
              isSelected: _selectedMedia,
              children: media,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
