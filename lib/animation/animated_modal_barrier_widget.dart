import 'package:flutter/material.dart';

class AnimatedModalBarrierWidget extends StatefulWidget {
  @override
  _AnimatedModalBarrierWidgetState createState() => _AnimatedModalBarrierWidgetState();
}

class _AnimatedModalBarrierWidgetState extends State<AnimatedModalBarrierWidget> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: Duration(seconds: 2), vsync: this);
    animation = ColorTween(begin: Colors.blue, end: Colors.red).animate(controller);
    controller.forward();
    controller.repeat();
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
        title: Text('AnimatedModalBarrier'),
        elevation: 0.0,
        centerTitle: true,
        bottom: PreferredSize(
          child: Text(
            'AnimatedModalBarrier控件可防止用户与其自身背后的小部件进行交互，并且可以使用颜色动画进行过渡',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          print('#############');
        },
        child: Container(
          width: 200,
          height: 200,
          color: Colors.orange,
          child: AnimatedModalBarrier(
            semanticsLabel: "StackBarrier",
            barrierSemanticsDismissible: true,
            dismissible: false,
            color: animation,
          ),
        ),
      ),
    );
  }
}
