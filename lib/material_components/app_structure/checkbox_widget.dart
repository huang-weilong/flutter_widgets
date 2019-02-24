import 'package:flutter/material.dart';

class CheckboxWidget extends StatefulWidget {
  @override
  _CheckboxWidgetState createState() => _CheckboxWidgetState();
}

class _CheckboxWidgetState extends State<CheckboxWidget> {
  bool checkboxValueA = true;
  bool checkboxValueB = false;
  bool checkboxValueC;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkbox'),
        centerTitle: true,
        elevation: 0.0,
        bottom: PreferredSize(
          child: Text(
            '复选框，允许用户从一组中选择多个选项。',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Checkbox(
              value: checkboxValueA,
              onChanged: (bool value) {
                setState(() {
                  checkboxValueA = value;
                });
              },
            ),
            Checkbox(
              value: checkboxValueB,
              onChanged: (bool value) {
                setState(() {
                  checkboxValueB = value;
                });
              },
            ),
            Checkbox(
              value: checkboxValueC,
              tristate: true, // 三态复选框
              activeColor: Colors.green,
              onChanged: (bool value) {
                setState(() {
                  checkboxValueC = value;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
