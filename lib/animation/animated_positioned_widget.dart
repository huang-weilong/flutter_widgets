import 'package:flutter/material.dart';

class AnimatedPositionedWidget extends StatefulWidget {
  @override
  _AnimatedPositionedWidgetState createState() => _AnimatedPositionedWidgetState();
}

class _AnimatedPositionedWidgetState extends State<AnimatedPositionedWidget> {
  int index = 0;
  List<double> top = [0.0, 100.0, 100.0, 300.0];
  List<double> left = [0.0, 0.0, 100.0, 100.0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedPositioned'),
        elevation: 0.0,
        centerTitle: true,
        bottom: PreferredSize(
          child: Text(
            '动画版本的Positioned，每当给定位置的变化，自动在给定的时间内转换孩子的位置。',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Text('更改'),
          onPressed: () {
            setState(() {
              index++;
              if (index > 3) index = 0;
            });
          }),
      body: Stack(
        children: [
          AnimatedPositioned(
            top: top[index],
            left: left[index],
            child: Container(
              width: 100.0,
              height: 100.0,
              color: Colors.orange,
            ),
            duration: Duration(seconds: 2),
          ),
        ],
      ),
    );
  }
}
