import 'package:flutter/material.dart';

class SnackBarWidget extends StatefulWidget {
  @override
  _SnackBarWidgetState createState() => _SnackBarWidgetState();
}

class _SnackBarWidgetState extends State<SnackBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SnackBar'),
        centerTitle: true,
        elevation: 0.0,
        bottom: PreferredSize(
          child: Text(
            '具有可选操作的轻量级消息提示，在屏幕的底部显示',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      body: Center(
        child: Builder(
          builder: (BuildContext context) {
            return RaisedButton(
              onPressed: () {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    duration: Duration(seconds: 5),
                    backgroundColor: Colors.green,
                    action: SnackBarAction(
                      textColor: Colors.black,
                      label: '可点击按钮',
                      onPressed: () {},
                    ),
                    content: Text('SnackBar的内容，duration可以设置显示时间'),
                  ),
                );
              },
              child: Text('显示SnackBar'),
            );
          },
        ),
      ),
    );
  }
}
