import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RichTextWidget extends StatefulWidget {
  @override
  _RichTextWidgetState createState() => _RichTextWidgetState();
}

class _RichTextWidgetState extends State<RichTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RichText'),
        centerTitle: true,
        elevation: 0.0,
        bottom: PreferredSize(
          child: Text(
            '一个富文本Text，可以显示多种样式的text。',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      body: RichText(
        text: TextSpan(
          text: 'RichText',
          style: TextStyle(color: Colors.black),
          children: [
            TextSpan(
              text: '换颜色',
              style: TextStyle(color: Colors.red),
            ),
            TextSpan(
              text: '换字号',
              style: TextStyle(fontSize: 20.0),
            ),
            TextSpan(
              text: '换字重',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: '斜体',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
            TextSpan(
              text: '  删除  ',
              style: TextStyle(decoration: TextDecoration.lineThrough),
            ),
          ],
        ),
      ),
    );
  }
}
