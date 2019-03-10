import 'package:flutter/material.dart';

class LimitedBoxWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LimitedBox'),
        centerTitle: true,
        elevation: 0.0,
        bottom: PreferredSize(
          child: Text(
            '当其自身不受约束时才限制其大小的盒子',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      body: Column(
        children: <Widget>[
          LimitedBox(
            maxHeight: 100.0,
            child: Container(color: Colors.green),
          ),
          Text('maxHeight:100.0，限制高度100.0'),
          LimitedBox(
            maxHeight: 100.0,
            maxWidth: 100.0,
            child: Container(
              width: 200.0,
              height: 200.0,
              color: Colors.orange,
            ),
          ),
          Text('maxHeight:100.0  maxWidth:100.0'),
          Text('子：h:200.0  w:200.0'),
          Text('这是在Column中的，所以在纵轴是无限的，即只要maxHeight会起作用（不受约束才限制）。maxWidth:100.0不起作用，所以此时子项width是200.0')
        ],
      ),
    );
  }
}
