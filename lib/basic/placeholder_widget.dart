import 'package:flutter/material.dart';

class PlaceholderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Placeholder'),
        centerTitle: true,
        elevation: 0.0,
        actions: <Widget>[
          Placeholder(
            fallbackWidth: 30.0,
          ),
        ],
        bottom: PreferredSize(
          child: Text(
            '一个小部件，用于绘制一个框，表示有一天会添加其他小部件的位置。',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Placeholder(
            fallbackHeight: 100.0,
            fallbackWidth: 100.0,
            strokeWidth: 10.0,
          ),
        ],
      ),
    );
  }
}
