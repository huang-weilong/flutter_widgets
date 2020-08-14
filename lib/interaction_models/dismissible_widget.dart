import 'package:flutter/material.dart';

class DismissibleWidget extends StatefulWidget {
  @override
  _DismissibleWidgetState createState() => _DismissibleWidgetState();
}

class _DismissibleWidgetState extends State<DismissibleWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dismissible'),
        elevation: 0.0,
        centerTitle: true,
        bottom: PreferredSize(
          child: Text(
            '可以在拖动时隐藏的widget',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      body: Dismissible(
        key: ValueKey('value'),
        child: Container(
          height: 50.0,
          color: Colors.orange,
        ),
        // 是否移除组件
        confirmDismiss: (DismissDirection direction) async {
          return false;
        },
        background: Text('data'), //背景组件，显示在child下面
        secondaryBackground: Text('vvv'), // 背景组件，如果使用，则向左或向上滑动会显示
        onResize: () {
          print('***********onResize');
        },
        onDismissed: (DismissDirection direction) {
          print('***********onDismissed  ' + direction.toString());
        },
        // 拖动方向
        direction: DismissDirection.horizontal,
        resizeDuration: Duration(seconds: 2),
        dismissThresholds: {DismissDirection.endToStart: 0.8},
        crossAxisEndOffset: 0.5, //  交叉轴方向上偏移量
      ),
    );
  }
}
