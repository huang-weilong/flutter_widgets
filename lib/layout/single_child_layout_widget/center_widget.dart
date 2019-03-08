import 'package:flutter/material.dart';

class CenterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Center'),
        centerTitle: true,
        elevation: 0.0,
        bottom: PreferredSize(
          child: Text(
            '将其子widget居中显示在自身内部的widget',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: Center(child: Text('不加系数的Center')),
          ),
          Text('不加系数的Center尽可能的大'),
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: Center(
              child: Text('居中'),
              heightFactor: 10.0,
              widthFactor: 2.0,
            ),
          ),
          Text('heightFactor高度系数，其高度设置为子高度乘以此系数'),
          Text('widthFactor宽度系数，其宽度设置为子宽度乘以此系数'),
        ],
      ),
    );
  }
}
