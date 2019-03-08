import 'package:flutter/material.dart';

class PaddingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Padding'),
        centerTitle: true,
        elevation: 0.0,
        bottom: PreferredSize(
          child: Text(
            '一个widget, 会给其子widget添加指定的填充',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            color: Colors.orange,
            child: Padding(padding: EdgeInsets.only(left: 20.0), child: Text('left:20.0')),
          ),
          Container(
            color: Colors.blue,
            child: Padding(padding: EdgeInsets.only(top: 40.0), child: Text('top:40.0')),
          ),
          Container(
            color: Colors.green,
            child: Padding(padding: EdgeInsets.all(40.0), child: Text('all:40.0')),
          ),
          Container(
            color: Colors.grey,
            child: Padding(padding: EdgeInsets.symmetric(horizontal: 40.0), child: Text('horizontal:40.0')),
          ),
        ],
      ),
    );
  }
}
