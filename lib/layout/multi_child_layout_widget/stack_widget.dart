import 'package:flutter/material.dart';

class StackWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stack布局'),
        centerTitle: true,
        elevation: 0.0,
        bottom: PreferredSize(
          child: Text(
            '可以允许其子widget简单的堆叠在一起',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          Positioned(
            top: 10.0,
            left: 10.0,
            child: Container(
              width: 200.0,
              height: 200.0,
              color: Colors.red,
            ),
          ),
          Positioned(
            left: 0.0,
            child: Container(
              width: 180.0,
              height: 140.0,
              color: Colors.orange,
            ),
          ),
          Positioned(
            top: 50.0,
            right: 0.0,
            child: Container(
              width: 160.0,
              height: 160.0,
              color: Colors.green,
            ),
          ),
          Positioned(
            top: 100.0,
            child: Container(
              width: 140.0,
              height: 140.0,
              color: Colors.grey,
              child: Text('Stack的孩子使用Positioned进行定位'),
            ),
          ),
        ],
      ),
    );
  }
}
