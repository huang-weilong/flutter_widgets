import 'package:flutter/material.dart';

class FloatingActionButtonWidget extends StatefulWidget {
  @override
  _FloatingActionButtonWidgetState createState() => _FloatingActionButtonWidgetState();
}

class _FloatingActionButtonWidgetState extends State<FloatingActionButtonWidget> {
  List<FloatingActionButtonLocation> list = [
    FloatingActionButtonLocation.centerDocked,
    FloatingActionButtonLocation.centerFloat,
    FloatingActionButtonLocation.endDocked,
    FloatingActionButtonLocation.endFloat,
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FloatingActionButton'),
        centerTitle: true,
        elevation: 0.0,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
          setState(() {
            index++;
            if (index == 4) {
              index = 0;
            }
          });
        },
        child: Icon(Icons.refresh),
      ),
      floatingActionButtonLocation: list[index],
      body: Center(
        child: Text('材料设计浮动动作按钮。\n浮动操作按钮是一个圆形图标按钮，悬停在内容上以提升应用程序中的主要操作。'
            '浮动操作按钮最常用于Scaffold.floatingActionButton字段中。\n每个屏幕最多使用一个浮动操作按钮。'
            '浮动操作按钮应用于积极操作，例如“创建”，“共享”或“导航”。'),
      ),
    );
  }
}
