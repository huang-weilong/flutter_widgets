import 'package:flutter/material.dart';

class LongPressDraggableWidget extends StatefulWidget {
  @override
  _LongPressDraggableWidgetState createState() => _LongPressDraggableWidgetState();
}

class _LongPressDraggableWidgetState extends State<LongPressDraggableWidget> {
  List<String> rows = ['AAAAAAAAAAAAA', 'BBBBBBBBBBBBBB', 'CCCCCCCCCCCCC', 'DDDDDDDDDDDDD'];

  void _handleAccept(int data, int index) {
    setState(() {
      String imageToMove = rows[data];
      rows.removeAt(data);
      rows.insert(index, imageToMove);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LongPressDraggable'),
        centerTitle: true,
        elevation: 0.0,
        bottom: PreferredSize(
          child: Text(
            '可以使其子widget在长按时可拖动',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      body: LayoutBuilder(builder: (context, constraint) {
        return ListView.builder(
          itemCount: rows.length,
          addRepaintBoundaries: true,
          itemBuilder: (context, index) {
            return LongPressDraggable(
              key: ObjectKey(index),
              data: index,
//              axis: Axis.horizontal, //只允许水平或垂直移动
              child: DragTarget<int>(
                onAccept: (int data) {
                  _handleAccept(data, index);
                },
                builder: (BuildContext context, List<int> data, List<dynamic> rejects) {
                  return Card(child: ListTile(leading: Icon(Icons.photo), title: Text(rows[index])));
                },
                onLeave: (data) {
                  // Debug
                  print('$data is Leaving row $index');
                },
                onWillAccept: (int data) {
                  // Debug
                  print('$index will accept row $data');

                  return true;
                },
              ),
              onDragStarted: () {
                print('开始拖动');
              },
              onDragEnd: (DraggableDetails details) {
                print('拖动结束');
              },
              onDraggableCanceled: (Velocity velocity, Offset offset) {
                print('未拖动到DragTarget回调');
              },
              onDragCompleted: () {
                print('拖动到DragTarget回调');
              },
              // 拖动时跟随移动的组件
              feedback: SizedBox(
                width: constraint.maxWidth,
                child: Card(child: ListTile(leading: Icon(Icons.photo), title: Text(rows[index])), elevation: 18.0),
              ),
              // 拖动时子组件显示，不使用则用原样式
              childWhenDragging: Card(
                color: Colors.grey,
                child: ListTile(
                  leading: Icon(Icons.photo, color: Colors.white),
                  title: Text(rows[index], style: TextStyle(color: Colors.white)),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
