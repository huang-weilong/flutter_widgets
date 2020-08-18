import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ScrollableWidget extends StatefulWidget {
  @override
  _ScrollableWidgetState createState() => _ScrollableWidgetState();
}

class _ScrollableWidgetState extends State<ScrollableWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scrollable'),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Scrollable(
        viewportBuilder: (BuildContext context, ViewportOffset position) {
          return Text('实现了可滚动widget的交互模型，但不包含UI显示相关的逻辑，一般不直接使用');
        },
      ),
    );
  }
}
