import 'package:flutter/material.dart';

class AnimatedDefaultTextStyleWidget extends StatefulWidget {
  @override
  _AnimatedDefaultTextStyleWidgetState createState() => _AnimatedDefaultTextStyleWidgetState();
}

class _AnimatedDefaultTextStyleWidgetState extends State<AnimatedDefaultTextStyleWidget> {
  Color color = Colors.blue;
  double fontSize = 14.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedDefaultTextStyle'),
        elevation: 0.0,
        centerTitle: true,
        bottom: PreferredSize(
          child: Text(
            '文本样式切换时使用动画',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('更改'),
        onPressed: () {
          setState(() {
            if (fontSize == 14.0) {
              fontSize = 40.0;
              color = Colors.red;
            } else {
              fontSize = 14.0;
              color = Colors.blue;
            }
          });
        },
      ),
      body: AnimatedDefaultTextStyle(
        duration: Duration(seconds: 2),
        style: TextStyle(color: color, fontSize: fontSize),
        child: Text('文本样式动画'),
      ),
    );
  }
}
