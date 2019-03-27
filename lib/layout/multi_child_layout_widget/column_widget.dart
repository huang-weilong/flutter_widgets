import 'package:flutter/material.dart';

class ColumnWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Column布局'),
        centerTitle: true,
        elevation: 0.0,
        bottom: PreferredSize(
          child: Text(
            '在垂直方向上排列子widget的列表',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Icon(Icons.ac_unit, color: Colors.grey),
          Icon(Icons.track_changes, color: Colors.blue),
          Icon(Icons.android, color: Colors.green),
          Icon(Icons.audiotrack, color: Colors.indigo)
        ],
      ),
    );
  }
}
