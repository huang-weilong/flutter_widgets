import 'package:flutter/material.dart';

class DecoratedBoxTransitionWidget extends StatefulWidget {
  @override
  _DecoratedBoxTransitionWidgetState createState() => _DecoratedBoxTransitionWidgetState();
}

class _DecoratedBoxTransitionWidgetState extends State<DecoratedBoxTransitionWidget> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    _animationController = AnimationController(duration: Duration(seconds: 2), vsync: this)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _animationController.forward();
        }
      });

    _animation = DecorationTween(
      begin: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(5)),
      end: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(55)),
    ).animate(_animationController);

    //开始动画
    _animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DecoratedBoxTransition'),
        elevation: 0.0,
        centerTitle: true,
        bottom: PreferredSize(
          child: Text(
            '装饰动画',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      body: Center(
        child: DecoratedBoxTransition(
          decoration: _animation,
          position: DecorationPosition.background,
          child: Container(
            height: 100,
            width: 100,
            alignment: Alignment.center,
            child: Text('装饰动画', style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
