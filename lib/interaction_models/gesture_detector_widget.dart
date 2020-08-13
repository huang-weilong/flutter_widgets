import 'package:flutter/material.dart';

class GestureDetectorWidget extends StatefulWidget {
  @override
  _GestureDetectorWidgetState createState() => _GestureDetectorWidgetState();
}

class _GestureDetectorWidgetState extends State<GestureDetectorWidget> {
  String text1 = '按钮一';
  String text2 = '按钮二';
  String text3 = '手指在屏幕的位置：';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GestureDetector'),
        elevation: 0.0,
        centerTitle: true,
        bottom: PreferredSize(
          child: Text(
            '一个检测手势的widget',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text('尝试对下面的按钮单击、双击、长按'),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                text1 = '你单击了我';
              });
            },
            onTapCancel: () {
              setState(() {
                text1 = '你单击了我，但移开取消了';
              });
            },
            onDoubleTap: () {
              setState(() {
                text1 = '你双击了我';
              });
            },
            onLongPress: () {
              setState(() {
                text1 = '你长按了我';
              });
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 12.0),
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(6.0),
              ),
              child: Text(text1, style: TextStyle(color: Colors.white)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text('尝试对下面的按钮横向拖动、纵向拖动'),
          ),
          GestureDetector(
            onHorizontalDragCancel: () {
              setState(() {
                text2 = '沿水平拖动取消   onHorizontalDragCancel';
              });
            },
            onHorizontalDragStart: (startDetails) {
              setState(() {
                text2 = '横向拖动开始起点--' + startDetails.globalPosition.toString();
              });
            },
            onHorizontalDragEnd: (endDetails) {
              setState(() {
                text2 = '横向拖动结束';
              });
            },
            onHorizontalDragUpdate: (updateDetails) {
              setState(() {
                text3 = '手指在屏幕的位置：' + updateDetails.globalPosition.toString();
              });
            },
            onVerticalDragCancel: () {
              setState(() {
                text2 = '沿垂直方向拖动取消   onVerticalDragCancel';
              });
            },
            onVerticalDragStart: (startDetails) {
              setState(() {
                text2 = '纵向拖动开始起点--' + startDetails.globalPosition.toString();
              });
            },
            onVerticalDragEnd: (endDetails) {
              setState(() {
                text2 = '纵向拖动结束';
              });
            },
            onVerticalDragUpdate: (updateDetails) {
              setState(() {
                text3 = '手指在屏幕的位置：' + updateDetails.globalPosition.toString();
              });
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 12.0),
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(6.0),
              ),
              child: Text(
                text2,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(text3),
          ),
        ],
      ),
    );
  }
}
