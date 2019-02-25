import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Icon'),
        centerTitle: true,
        elevation: 0.0,
        bottom: PreferredSize(
          child: Text(
            'A Material Design icon.',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(
              Icons.star,
              size: 60.0,
              semanticLabel: '图标语义标签，辅助功能模式下使用',
            ),
            Icon(
              Icons.ac_unit,
              size: 60.0,
              color: Colors.lightBlueAccent,
            ),
            Icon(
              Icons.memory,
              size: 60.0,
              color: Colors.brown,
            ),
            Icon(
              Icons.timer,
              size: 60.0,
              color: Colors.deepPurple,
            ),
            Icon(
              Icons.assistant_photo,
              size: 60.0,
              color: Colors.red,
            ),
            Icon(
              Icons.done,
              size: 60.0,
              color: Colors.green,
            )
          ],
        ),
      ),
    );
  }
}
