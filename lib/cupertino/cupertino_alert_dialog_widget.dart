import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CupertinoAlertDialogWidget extends StatefulWidget {
  @override
  _CupertinoAlertDialogWidgetState createState() => _CupertinoAlertDialogWidgetState();
}

class _CupertinoAlertDialogWidgetState extends State<CupertinoAlertDialogWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CupertinoAlertDialog'),
        centerTitle: true,
        elevation: 0.0,
        bottom: PreferredSize(
          child: Text('iOS风格的alert dialog', style: TextStyle(fontWeight: FontWeight.bold)),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      body: Center(
        child: CupertinoButton(
          color: Colors.blue,
          pressedOpacity: 0.4,
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
                      child: Text('确认'),
                      isDestructiveAction: true, //此操作是否会破坏对象(例如删除）
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    CupertinoDialogAction(
                      child: Text('取消'),
                      isDefaultAction: true, //内容加粗
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )
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
