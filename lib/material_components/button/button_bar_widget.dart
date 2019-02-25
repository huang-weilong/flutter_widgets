import 'package:flutter/material.dart';

class ButtonBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ButtonBar'),
        centerTitle: true,
        elevation: 0.0,
        bottom: PreferredSize(
          child: Text(
            '水平排列的按钮组，一般用于dialog底部按钮排列',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      body: Center(
        child: ButtonBar(
          children: <Widget>[
            FlatButton(
              onPressed: () {},
              child: Text('取消'),
            ),
            FlatButton(
              color: Colors.blue,
              onPressed: () {},
              child: Text('确定'),
            ),
          ],
        ),
      ),
    );
  }
}
