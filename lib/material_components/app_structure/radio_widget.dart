import 'package:flutter/material.dart';

class RadioWidget extends StatefulWidget {
  @override
  _RadioWidgetState createState() => _RadioWidgetState();
}

class _RadioWidgetState extends State<RadioWidget> {
  int radioValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Radio'),
        centerTitle: true,
        elevation: 0.0,
        bottom: PreferredSize(
          child: Text(
            '单选框，允许用户从一组中选择一个选项',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Radio(value: 0, groupValue: radioValue, onChanged: handleRadioValueChanged),
            Radio(value: 1, groupValue: radioValue, activeColor: Colors.green, onChanged: handleRadioValueChanged),
            Radio(value: 2, groupValue: radioValue, onChanged: handleRadioValueChanged),
          ],
        ),
      ),
    );
  }

  handleRadioValueChanged(int value) {
    setState(() {
      radioValue = value;
    });
  }
}
