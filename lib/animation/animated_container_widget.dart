import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedContainerWidget extends StatefulWidget {
  @override
  _AnimatedContainerWidgetState createState() => _AnimatedContainerWidgetState();
}

class _AnimatedContainerWidgetState extends State<AnimatedContainerWidget> {
  Color color = Colors.blue;
  double width = 100.0;
  double height = 100.0;
  double width2 = 1.0;
  double num = 0.0;
  double radius = 0.0;
  Timer timer;

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('AnimatedContainer'),
        centerTitle: true,
        elevation: 0.0,
        bottom: PreferredSize(
          child: Text(
            '在一段时间内逐渐改变其值的容器',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(30.0),
        ),
        actions: <Widget>[
          IconButton(
              icon: Text('变色'),
              onPressed: () {
                setState(() {
                  if (color == Colors.blue)
                    color = Colors.red;
                  else if (color == Colors.red)
                    color = Colors.green;
                  else
                    color = Colors.blue;
                });
              }),
          IconButton(
            icon: Text('宽高'),
            onPressed: () {
              setState(() {
                if (width == 100.0) {
                  radius = 30.0;
                  width = 300.0;
                  height = 300.0;
                } else if (width == 300.0) {
                  radius = 50.0;
                  width = 50.0;
                  height = 200.0;
                } else {
                  radius = 0.0;
                  width = 100.0;
                  height = 50.0;
                }
              });
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('更新'),
        elevation: 0.0,
        onPressed: () {
          setState(() {
            width2 = 380.0;
            timer = Timer.periodic(Duration(milliseconds: 50), (timer) {
              setState(() {
                num++;
              });
              if (num >= 100.0) {
                timer.cancel();
              }
            });
          });
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AnimatedContainer(
            duration: Duration(seconds: 2),
//            color: color,
            width: width,
            height: height,
            curve: Curves.linear,
            decoration: BoxDecoration(color: Colors.amberAccent),
            foregroundDecoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(radius)),
          ),
          Text('正在更新数据$num%'),
          AnimatedContainer(
            duration: Duration(seconds: 5),
            color: color,
            width: width2,
            height: 4.0,
            curve: Curves.linear,
          ),
        ],
      ),
    );
  }
}
