import 'package:flutter/material.dart';

class WrapWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wrap'),
        centerTitle: true,
        elevation: 0.0,
        bottom: PreferredSize(
          child: Text(
            '可以在水平或垂直方向多行显示其子widget',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      body: Column(
        children: <Widget>[
          Wrap(
            spacing: 10.0,
            children: <Widget>[
              Text('Text1'),
              Text('Text2'),
            ],
          ),
          Text('//////////////////////////////////'),
          Wrap(
            spacing: 10.0,
            direction: Axis.vertical,
            children: <Widget>[
              Text('Text1'),
              Text('Text2'),
              Icon(Icons.ac_unit),
            ],
          ),
          Text('//////////////////////////////////'),
          Wrap(
            spacing: 10.0,
            direction: Axis.vertical,
            verticalDirection: VerticalDirection.up,
            children: <Widget>[
              Text('Text1'),
              Text('Text2'),
              Text('VerticalDirection.up'),
              Icon(Icons.ac_unit),
            ],
          ),
        ],
      ),
    );
  }
}
