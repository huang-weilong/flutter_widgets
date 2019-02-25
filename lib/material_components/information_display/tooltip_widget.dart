import 'package:flutter/material.dart';

class TooltipWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tooltip'),
        centerTitle: true,
        elevation: 0.0,
        bottom: PreferredSize(
          child: Text(
            '一个文本提示工具，帮助解释一个按钮或其他用户界面，当widget长时间按下时显示一个提示标签。',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Tooltip(
              message: 'Tooltip提示信息',
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
                color: Color(0xff74c9ff),
                child: Text('长按我！！！'),
              ),
            ),
            Tooltip(
              height: 60.0,
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              message: '修改了height、padding',
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
                color: Color(0xff39b2ff),
                child: Text('长按我！！！'),
              ),
            ),
            Tooltip(
              message: '修改了tooltip显示位置preferBelow:false',
              preferBelow: false,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
                color: Color(0xff009cff),
                child: Text('长按我！！！'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
