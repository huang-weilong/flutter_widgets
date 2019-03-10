import 'package:flutter/material.dart';

class SizedBoxWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SizedBox'),
        centerTitle: true,
        elevation: 0.0,
        bottom: PreferredSize(
          child: Text(
            '一个特定大小的盒子。这个widget强制它的孩子有一个特定的宽度和高度',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            width: 100.0,
            height: 100.0,
            child: Container(color: Colors.orange),
          ),
          Text('child不为空时，强制把child的尺寸调整为SizedBox的尺寸。'),
          SizedBox(
            height: 100.0,
            width: 100.0,
          ),
          Text('child为空时，自身尺寸调整到此宽高，上面的空白是SizedBox设置了h:100, w:100 但child为空')
        ],
      ),
    );
  }
}
