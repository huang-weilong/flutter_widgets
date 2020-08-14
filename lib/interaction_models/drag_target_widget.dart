import 'package:flutter/material.dart';

class DragTargetWidget extends StatefulWidget {
  @override
  _DragTargetWidgetState createState() => _DragTargetWidgetState();
}

class _DragTargetWidgetState extends State<DragTargetWidget> {
  bool flag1 = true;
  bool flag2 = false;
  bool flag3 = false;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DragTarget'),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            flag1 ? _buildDraggable(0) : _buildTarget(),
            Text('拖动盒子到另一个位置'),
            flag2 ? _buildDraggable(1) : _buildTarget(),
          ],
        ),
      ),
    );
  }

  Widget _buildDraggable(int flag) {
    return Draggable(
      data: flag,
      onDraggableCanceled: (Velocity velocity, Offset offset) {
        print('未拖动到DragTarget回调');
        setState(() {
          if (flag == 0) {
            flag1 = true;
            flag2 = false;
          } else {
            flag1 = false;
            flag2 = true;
          }
        });
      },
      onDragCompleted: () {
        setState(() {
          if (flag == 0) {
            flag1 = false;
            flag2 = true;
          } else {
            flag1 = true;
            flag2 = false;
          }
        });
        print('拖动到DragTarget回调' + flag.toString());
      },
      onDragStarted: () {
        print('开始拖动');
      },
      child: _buildBox(),
      feedback: _buildBox(),
      childWhenDragging: _buildEmptyBox(),
    );
  }

  // 目标盒子
  Widget _buildTarget() {
    return DragTarget<int>(
      builder: (BuildContext context, List<int> candidateData, List<dynamic> rejectedData) {
        return _buildEmptyBox();
      },
      onWillAccept: (int color) {
        print('**********onWillAccept  ' + color.toString());
        return true;
      },
      onAccept: (int color) {
        print('**********onAccept  ' + color.toString());
      },
      onLeave: (var color) {
        print('**********onLeave  ' + color.toString());
      },
    );
  }

  // 空白占位盒子
  Widget _buildEmptyBox() {
    return Container(
      height: 100,
      width: 100,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.blue),
      ),
    );
  }

  // 有内容的盒子
  Widget _buildBox() {
    return Container(
      height: 100,
      width: 100,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(10)),
      child: Text('widget', style: TextStyle(color: Colors.white, fontSize: 18)),
    );
  }
}
