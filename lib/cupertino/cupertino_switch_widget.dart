import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CupertinoSwitchWidget extends StatefulWidget {
  @override
  _CupertinoSwitchWidgetState createState() => _CupertinoSwitchWidgetState();
}

class _CupertinoSwitchWidgetState extends State<CupertinoSwitchWidget> {
  bool _flag1 = false;
  bool _flag2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CupertinoSwitch'),
        centerTitle: true,
        elevation: 0.0,
        bottom: PreferredSize(
          child: Text(
            'iOS风格的开关. 用于单一状态的开/关',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CupertinoSwitch(
              value: _flag1,
              onChanged: (bool value) {
                setState(() {
                  _flag1 = value;
                });
              },
            ),
            CupertinoSwitch(
              value: _flag2,
              activeColor: Colors.blue,
              onChanged: (bool value) {
                setState(() {
                  _flag2 = value;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
