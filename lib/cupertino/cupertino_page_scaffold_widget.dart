import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CupertinoPageScaffoldWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CupertinoPageScaffold(
        backgroundColor: Color(0xffe3e3e3),
        navigationBar: CupertinoNavigationBar(
          middle: Text('CupertinoPageScaffold'),
        ),
        child: Center(child: Text('一个iOS风格的页面的基本布局结构。包含内容和导航栏')),
      ),
    );
  }
}
