import 'package:flutter/material.dart';

class ShowDatePickerPage extends StatefulWidget {
  @override
  _ShowDatePickerPageState createState() => _ShowDatePickerPageState();
}

class _ShowDatePickerPageState extends State<ShowDatePickerPage> {
  String dateString = '选择日期';
  String timeString = '选择时间';
  DateTime dateTime = DateTime.now();
  TimeOfDay timeOfDay = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('showDate(Time)Picker'),
        centerTitle: true,
        elevation: 0.0,
        bottom: PreferredSize(
          child: Text(
            '日期&时间选择器',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                showDatePicker(
                  context: context,
                  initialDate: dateTime,
                  firstDate: DateTime(2019),
                  lastDate: DateTime(2020),
                ).then((result) {
                  setState(() {
                    if (result != null) {
                      dateTime = result;
                      dateString = result.toString();
                    }
                  });
                });
              },
              child: Text(dateString),
            ),
            RaisedButton(
              onPressed: () {
                showTimePicker(context: context, initialTime: timeOfDay).then((result) {
                  setState(() {
                    if (result != null) {
                      timeOfDay = result;
                      timeString = result.toString();
                    }
                  });
                });
              },
              child: Text(timeString),
            ),
          ],
        ),
      ),
    );
  }
}
