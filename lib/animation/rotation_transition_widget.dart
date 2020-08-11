import 'dart:async';

import 'package:flutter/material.dart';

class RotationTransitionWidget extends StatefulWidget {
  @override
  _RotationTransitionWidgetState createState() => _RotationTransitionWidgetState();
}

class _RotationTransitionWidgetState extends State<RotationTransitionWidget> with TickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  Timer timer;
  bool flag = true;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: const Duration(seconds: 3), vsync: this)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    animation = Tween(begin: 0.0, end: 1.0).animate(controller);
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RotationTransition'),
        elevation: 0.0,
        bottom: PreferredSize(
          child: Text(
            '旋转动画',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      body: Center(
        child: RotationTransition(
          turns: animation,
          child: Image.asset('assets/images/my_painting.jpg'),
        ),
      ),
    );
  }
}
