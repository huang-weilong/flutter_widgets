import 'package:flutter/material.dart';

class SwitchWidget extends StatefulWidget {
  @override
  _SwitchWidgetState createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  bool switchValue1 = true;
  bool switchValue2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Switch'),
        centerTitle: true,
        elevation: 0.0,
        bottom: PreferredSize(
          child: Text(
            'On/off 用于切换一个单一状态',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Switch(
              activeThumbImage: AssetImage('assets/images/1.jpg'),
              value: switchValue1,
              onChanged: (bool value) {
                setState(() {
                  switchValue1 = value;
                });
              },
            ),
            Switch(
              value: switchValue2,
              activeColor: Colors.greenAccent,
              activeTrackColor: Colors.green,
              inactiveThumbColor: Colors.orange,
              inactiveTrackColor: Colors.orangeAccent,
              onChanged: (bool value) {
                setState(() {
                  switchValue2 = value;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
