import 'package:flutter/material.dart';

class SlideTransitionWidget extends StatefulWidget {
  @override
  _SlideTransitionWidgetState createState() => _SlideTransitionWidgetState();
}

class _SlideTransitionWidgetState extends State<SlideTransitionWidget> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: Duration(seconds: 2), vsync: this)..repeat(reverse: true);
    animation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(1.5, 1.0),
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.elasticIn,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SlideTransition'),
        elevation: 0.0,
        centerTitle: true,
        bottom: PreferredSize(
          child: Text(
            '对相对于其正常位置的某个位置之间使用动画。平移动画',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      body: Container(
        color: Colors.lightGreen,
        width: 100.0,
        height: 100.0,
        child: SlideTransition(
          position: animation,
          child: FlutterLogo(size: 150.0),
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
