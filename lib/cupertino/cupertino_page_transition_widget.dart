import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CupertinoPageTransitionWidget extends StatefulWidget {
  @override
  _CupertinoPageTransitionWidgetState createState() => _CupertinoPageTransitionWidgetState();
}

class _CupertinoPageTransitionWidgetState extends State<CupertinoPageTransitionWidget> with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: Duration(milliseconds: 1500), vsync: this);
    animation = Tween(begin: 0.0, end: 2.0).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CupertinoPageTransition'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Center(child: Text('暂无')),
//          CupertinoPageTransition(
//        primaryRouteAnimation: animation,
//        secondaryRouteAnimation: animation,
//        child: Text('dasd'),
//        linearTransition: true,
//      ),
    );
  }
}
