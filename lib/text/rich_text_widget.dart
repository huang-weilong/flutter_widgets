import 'package:flutter/material.dart';

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
        // 行样式
        // 在StrutStyle中指定的fontSize、fontWeight、fontStyle
        // 仅仅作为StrutStyle计算行高、行间距的标准，并不会应用到文本上
        strutStyle: StrutStyle(
          height: 2.0, // 行样式
          leading: 1.0, // 行间距
        ),
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
              text: '斜体\n',
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
