import 'package:flutter/material.dart';

class BaselineWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Baseline'),
        centerTitle: true,
        elevation: 0.0,
        bottom: PreferredSize(
          child: Text(
            '根据孩子的基线定位孩子的小部件',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Baseline(
                baseline: 50.0,
//                baselineType: TextBaseline.alphabetic, // 对齐字符底部的水平线
                baselineType: TextBaseline.ideographic, // 对齐表意字符的水平线
                child: Text(
                  'fontSize：12.0',
                  style: TextStyle(fontSize: 12.0),
                ),
              ),
              Baseline(
                baseline: 50.0,
                baselineType: TextBaseline.ideographic,
                child: Container(
                  width: 30.0,
                  height: 30.0,
                  color: Colors.red,
                ),
              ),
              Baseline(
                baseline: 50.0,
                baselineType: TextBaseline.ideographic,
                child: Text(
                  '字号：25.0',
                  style: TextStyle(fontSize: 25.0),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
