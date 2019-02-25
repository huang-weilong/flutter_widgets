import 'package:flutter/material.dart';

class SimpleDialogWidget extends StatefulWidget {
  @override
  _SimpleDialogWidgetState createState() => _SimpleDialogWidgetState();
}

class _SimpleDialogWidgetState extends State<SimpleDialogWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SimpleDialog'),
        centerTitle: true,
        elevation: 0.0,
        bottom: PreferredSize(
          child: Text(
            '简单对话框可以显示附加的提示或操作',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return SimpleDialog(
                  title: Text('我是标题'),
                  children: <Widget>[
                    SimpleDialogOption(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.favorite, size: 36.0, color: Colors.red),
                          Padding(
                            padding: EdgeInsets.only(left: 16.0),
                            child: Text('SimpleDialogOption'),
                          ),
                        ],
                      ),
                    ),
                    SimpleDialogOption(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.ac_unit, size: 36.0, color: Colors.greenAccent),
                          Padding(
                            padding: EdgeInsets.only(left: 16.0),
                            child: Text('SimpleDialogOption'),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            );
          },
          child: Text('显示对话框'),
        ),
      ),
    );
  }
}
