import 'package:flutter/material.dart';
import 'package:flutter_widgets/input/form_widget.dart';
import 'package:flutter_widgets/input/raw_keyboard_listener_widget.dart';

class IndexInput extends StatefulWidget {
  @override
  _IndexInputState createState() => _IndexInputState();
}

class _IndexInputState extends State<IndexInput> {
  List<Map> page;

  @override
  void initState() {
    super.initState();
    page = [
      {'title': 'Form', 'page': FormWidget()},
      {'title': 'RawKeyboardListener', 'page': RawKeyboardListenerWidget()},
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Layout'),
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
