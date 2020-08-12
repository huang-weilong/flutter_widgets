import 'package:flutter/material.dart';

class AnimatedOpacityWidget extends StatefulWidget {
  @override
  _AnimatedOpacityWidgetState createState() => _AnimatedOpacityWidgetState();
}

class _AnimatedOpacityWidgetState extends State<AnimatedOpacityWidget> {
  double opacity = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedOpacity'),
        elevation: 0.0,
        centerTitle: true,
        bottom: PreferredSize(
          child: Text(
            'Opacity的动画版本，在给定的透明度变化时，自动地在给定的一段时间内改变孩子的Opacity',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('更改'),
        onPressed: () {
          setState(() {
            if (opacity == 1.0)
              opacity = 0.2;
            else
              opacity = 1.0;
          });
        },
      ),
      body: AnimatedOpacity(
        opacity: opacity,
        duration: Duration(seconds: 2),
        child: Container(
          width: 200.0,
          height: 200.0,
          color: Colors.orange,
        ),
      ),
    );
  }
}
