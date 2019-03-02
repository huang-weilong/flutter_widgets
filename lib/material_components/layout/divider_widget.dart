import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Divider'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          Divider(),
          Text('一个逻辑1像素厚的水平分割线，两边都有填充'),
          Divider(height: 60.0),
          Text('height 分隔线的高度范围'),
          Divider(indent: 40.0),
          Text('indent 分隔符左侧的空白空间量'),
          Divider(color: Colors.red),
          Text('color 绘制线条时使用的颜色'),
        ],
      ),
    );
  }
}
