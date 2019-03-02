import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CupertinoButtonWidget extends StatefulWidget {
  @override
  _CupertinoButtonWidgetState createState() => _CupertinoButtonWidgetState();
}

class _CupertinoButtonWidgetState extends State<CupertinoButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CupertinoButton'),
        centerTitle: true,
        elevation: 0.0,
        bottom: PreferredSize(
          child: Text(
            'iOS风格的button',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CupertinoButton(
              minSize: 100.0,
              color: Colors.blue,
              pressedOpacity: 0.4,
              child: Text('更改颜色、最小size'),
              onPressed: () {},
            ),
            CupertinoButton(
              color: Colors.blue,
              disabledColor: Colors.grey,
              child: Text('不可点击'),
              onPressed: null,
            ),
            CupertinoButton(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(20.0),
              child: Text('更改圆角'),
              onPressed: () {},
            ),
            CupertinoButton(
              padding: EdgeInsets.all(20.0),
              color: Colors.green,
              borderRadius: BorderRadius.circular(20.0),
              child: Text('更改padding'),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
