import 'package:flutter/material.dart';
import 'package:flutter_widgets/text/default_text_style_widget.dart';
import 'package:flutter_widgets/text/rich_text_widget.dart';
import 'package:flutter_widgets/text/text_widget.dart';

class IndexText extends StatefulWidget {
  @override
  _IndexTextState createState() => _IndexTextState();
}

class _IndexTextState extends State<IndexText> {
  List<Map> page;

  @override
  void initState() {
    super.initState();
    page = [
      {'title': 'Text', 'page': TextWidget()},
      {'title': 'RichText', 'page': RichTextWidget()},
      {'title': 'DefaultTextStyle', 'page': DefaultTextStyleWidget()},
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView(
        children: page.map((item) {
          return ListTile(
            title: Text(item['title']),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => item['page']));
            },
          );
        }).toList(),
      ),
    );
  }
}
