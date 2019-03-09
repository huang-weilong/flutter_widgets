import 'package:flutter/material.dart';

class AspectRatioWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AspectRatio'),
        centerTitle: true,
        elevation: 0.0,
        bottom: PreferredSize(
          child: Text(
            '尝试将子项调整为特定宽高比的小部件',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 200.0,
            color: Colors.green,
            child: AspectRatio(
              aspectRatio: 1.0 / 4.0,
              child: Container(
                color: Colors.red,
              ),
            ),
          ),
          Text('父容器h:200.0'),
          Text('aspectRatio:1/4，所以子widget的h:200.0,w:50.0'),
        ],
      ),
    );
  }
}
