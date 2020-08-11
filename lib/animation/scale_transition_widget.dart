import 'package:flutter/material.dart';

class ScaleTransitionWidget extends StatefulWidget {
  @override
  _ScaleTransitionWidgetState createState() => _ScaleTransitionWidgetState();
}

class _ScaleTransitionWidgetState extends State<ScaleTransitionWidget> with TickerProviderStateMixin {
  Animation<double> animation1;
  Animation<double> animation2;
  AnimationController controller1;
  AnimationController controller2;

  initState() {
    super.initState();
    controller1 = AnimationController(duration: const Duration(seconds: 2), vsync: this)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller1.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller1.forward();
        }
      });
    animation1 = Tween(begin: 1.0, end: 4.5).animate(controller1);

    controller2 = AnimationController(duration: const Duration(seconds: 2), vsync: this)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller2.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller2.forward();
        }
      });
    animation2 = Tween(begin: 4.5, end: 1.0).animate(controller2);

    controller1.forward();
    controller2.forward();
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ScaleTransition'),
        elevation: 0.0,
        centerTitle: true,
        bottom: PreferredSize(
          child: Text(
            '缩放动画',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ScaleTransition(
              scale: animation1,
              child: Image.asset(
                'assets/images/my_painting.jpg',
                width: 50.0,
                height: 50.0,
              ),
            ),
            ScaleTransition(
              scale: animation2,
              child: Image.asset(
                'assets/images/my_painting.jpg',
                width: 50.0,
                height: 50.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
