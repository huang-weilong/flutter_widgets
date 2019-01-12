import 'package:flutter/material.dart';

class ColumnWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Column'),
        centerTitle: true,
        elevation: 0.0,
        bottom: PreferredSize(
          child: Text(
            '在垂直方向上排列子widget的列表。',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 主轴方向（竖直）对齐方式
          crossAxisAlignment: CrossAxisAlignment.center, // 交叉轴（横向）对其方式
          children: <Widget>[
            Icon(
              Icons.ac_unit,
              color: Colors.blue,
            ),
            Icon(Icons.star),
            Icon(
              Icons.extension,
              color: Colors.orange,
            )
          ],
        ),
      ),
    );
  }
}
