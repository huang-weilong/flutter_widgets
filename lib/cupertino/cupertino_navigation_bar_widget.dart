import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CupertinoNavigationBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        previousPageTitle: 'back',
        middle: Text('CupertinoNavigationBar'),
        trailing: Text('Exit'),
        actionsForegroundColor: Colors.red, // 前导按钮、文字颜色
//        padding: EdgeInsetsDirectional.only(start: 10.0, top: 10.0),
//        backgroundColor: Colors.green,
      ),
      body: Center(child: Text('iOS风格的导航栏. 通常和CupertinoPageScaffold一起使用')),
    );
  }
}
