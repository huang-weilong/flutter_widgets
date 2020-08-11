import 'package:flutter/material.dart';

class PositionedTransitionWidget extends StatefulWidget {
  @override
  _PositionedTransitionWidgetState createState() => _PositionedTransitionWidgetState();
}

class _PositionedTransitionWidgetState extends State<PositionedTransitionWidget> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: Duration(seconds: 2), vsync: this);

    animation = RelativeRectTween(
      begin: RelativeRect.fromLTRB(10.0, 10.0, 10.0, 10.0),
      end: RelativeRect.fromLTRB(80.0, 20.0, 150.0, 50.0),
    ).animate(controller);

    //开始动画
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PositionedTransition'),
        elevation: 0.0,
        centerTitle: true,
        bottom: PreferredSize(
          child: Text(
            'Positioned的动画版本，它需要一个特定的动画来将孩子的位置从动画的生命周期的起始位置移到结束位置。',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      body: Container(
        height: 300,
        width: 300,
        color: Colors.blue,
        child: Stack(
          children: <Widget>[
            PositionedTransition(
              rect: animation,
              child: Container(
                color: Colors.green,
              ),
            )
          ],
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
