import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CupertinoActivityIndicatorWidget extends StatefulWidget {
  @override
  _CupertinoActivityIndicatorWidgetState createState() => _CupertinoActivityIndicatorWidgetState();
}

class _CupertinoActivityIndicatorWidgetState extends State<CupertinoActivityIndicatorWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CupertinoActivityIndicator'),
        centerTitle: true,
        elevation: 0.0,
        bottom: PreferredSize(
          child: Text('一个iOS风格的loading指示器。显示一个圆形的转圈菊花', style: TextStyle(fontWeight: FontWeight.bold)),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CupertinoActivityIndicator(),
            CupertinoActivityIndicator(radius: 30.0),
            CupertinoActivityIndicator(animating: false, radius: 30.0)
          ],
        ),
      ),
    );
  }
}
