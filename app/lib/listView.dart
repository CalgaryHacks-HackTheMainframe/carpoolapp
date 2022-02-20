import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class listView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      child: SfCalendar(
        view: CalendarView.schedule,
        scheduleViewSettings: ScheduleViewSettings(
            hideEmptyScheduleWeek: true,
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