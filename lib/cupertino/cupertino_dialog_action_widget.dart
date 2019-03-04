import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CupertinoDialogActionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CupertinoDialogAction'),
        centerTitle: true,
        elevation: 0.0,
        bottom: PreferredSize(
          child: Text(
            '通常用于CupertinoAlertDialog的一个button',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      body: Container(
        height: 100.0,
        alignment: Alignment.center,
        child: CupertinoButton(
          color: Colors.blue,
          child: Text('显示对话框'),
          onPressed: () {
            showCupertinoDialog(
              context: context,
              builder: (BuildContext context) {
                return CupertinoAlertDialog(
                  title: Text('我是标题'),
                  content: Text('我是描述信息'),
                  actions: <Widget>[
                    CupertinoDialogAction(
                      child: Text('选项一'),
                      isDestructiveAction: true, //此操作是否会破坏对象(例如删除）
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    CupertinoDialogAction(
                      child: Text('选项二'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    CupertinoDialogAction(
                      child: Text('选项三'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
