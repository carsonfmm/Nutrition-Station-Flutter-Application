import 'package:flutter/material.dart';
import 'package:group8/view_metrics_month.dart';
import 'view_metrics_day.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});
  @override
  State<Calendar> createState() => _Calendar();
}

class _Calendar extends State<Calendar> {
  // In order for the calendar to run to run the following steps were taken:
  // - Go to 'Run > Edit Configurations'
  // - Find the "Additional run args" text box
  // - Copy and paste the following into the text box: '--no-sound-null-safety'
  // - Click 'Apply' in the bottom right corner
  // - Click 'OK' in the bottom right corner
  // - Hot Restart the flutter application

  DateTime selectedDate = DateTime.now();
  DateTime todaysDate = DateTime.now();
  void _selectDay(DateTime day, DateTime focusedDay) {
    setState(() {
      selectedDate = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 7, 7),
            child: Text(
              "Today's Date: " + todaysDate.toString().split(" ")[0],
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 7, 7, 0),
            child: Text(
              "Selected Date: " + selectedDate.toString().split(" ")[0],
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ),
          Expanded(
            child: TableCalendar(
              locale: "en_US",
              shouldFillViewport: true,
              headerStyle:
                  HeaderStyle(formatButtonVisible: false, titleCentered: true),
              availableGestures: AvailableGestures.all,
              selectedDayPredicate: (day) => isSameDay(day, selectedDate),
              focusedDay: DateTime.now(),
              firstDay: DateTime.utc(2020, 01, 01),
              lastDay: DateTime.utc(2030, 01, 01),
              onDaySelected: _selectDay,
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                    child: Padding(
                  padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                  child: FloatingActionButton.extended(
                      heroTag: "btn1",
                      label: Text('Daily Metrics'),
                      onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => ViewMetricsDay()),
                          )),
                )),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                    child: FloatingActionButton.extended(
                        heroTag: "btn2",
                        label: Text('Monthly Metrics'),
                        onPressed: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => ViewMetricsMonth()),
                            )),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
