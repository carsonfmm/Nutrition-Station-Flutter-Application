import 'package:flutter/material.dart';
import 'package:group8/foodItemList.dart';
import 'package:group8/settings.dart';
import 'package:provider/provider.dart';
import 'addfood.dart';
import 'foodEntryList.dart';
import './dashboard.dart';
import './calendar.dart';
import './view_metrics_day.dart';
import './view_metrics_month.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
          create: (BuildContext context) => FoodItemListModel()),
      ChangeNotifierProvider(
          create: (BuildContext context) => FoodEntryListModel()),
    ],
    builder: (context, child) {
      return const MyApp();
    },
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nutrition Station',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Nutrition Station'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Dashboard(),
    AddFoodPage(),
    Calendar(),
    Settings(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 239, 226),
      body: _widgetOptions.elementAt(_selectedIndex),
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.blue,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank),
            label: 'Food',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
