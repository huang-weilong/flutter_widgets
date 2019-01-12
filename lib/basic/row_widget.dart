import 'package:flutter/material.dart';

class RowWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Row'),
        centerTitle: true,
        elevation: 0.0,
        bottom: PreferredSize(
          child: Text(
            '在水平方向上排列子widget的列表。',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, // // 主轴方向（横向）对齐方式
          crossAxisAlignment: CrossAxisAlignment.start, // 交叉轴（竖直）对其方式
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
