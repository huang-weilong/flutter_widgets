import 'package:flutter/material.dart';

class SizeTransitionWidget extends StatefulWidget {
  @override
  _SizeTransitionWidgetState createState() => _SizeTransitionWidgetState();
}

class _SizeTransitionWidgetState extends State<SizeTransitionWidget> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: const Duration(seconds: 1), vsync: this)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    animation = Tween(begin: 0.0, end: 2.0).animate(controller);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SizeTransition'),
        elevation: 0.0,
        centerTitle: true,
        bottom: PreferredSize(
          child: Text(
            '设置自己的动画大小并剪辑和对齐孩子',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      body: Center(
        child: SizeTransition(
          sizeFactor: animation,
//          axis: Axis.horizontal,
          child: Image.asset('assets/images/my_painting.jpg'),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
