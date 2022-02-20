import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:provider/provider.dart';
import 'provider.dart';
import 'dataSource.dart';
import 'Task.dart';

class listView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final name_provider = Provider.of<provider>(context);
    final found_tasks = name_provider.taskFromDate;
    return Container(
      child: SfCalendar(
        dataSource: DataSource(found_tasks),
        view: CalendarView.schedule,
        scheduleViewSettings: ScheduleViewSettings(
            dayHeaderSettings: DayHeaderSettings(
                dayFormat: 'EEEE',
                width: 70,
                dayTextStyle: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w300,
                  color: Colors.red,
                ),
                dateTextStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: Colors.red,
                )
            )
        ),
      ),
    );
  }
}

