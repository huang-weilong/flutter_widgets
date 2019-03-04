import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CupertinoDialogWidget extends StatefulWidget {
  @override
  _CupertinoDialogWidgetState createState() => _CupertinoDialogWidgetState();
}

class _CupertinoDialogWidgetState extends State<CupertinoDialogWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CupertinoDialog'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Center(
        child: Text('请不要直接使用这个小部件\n而应考虑使用 CupertinoAlertDialog'),
      ),
    );
  }
}
