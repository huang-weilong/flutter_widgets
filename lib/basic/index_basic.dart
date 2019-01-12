import 'package:flutter/material.dart';

import 'container_widget.dart';
import 'row_widget.dart';

class IndexBasic extends StatefulWidget {
  @override
  _IndexBasicState createState() => _IndexBasicState();
}

class _IndexBasicState extends State<IndexBasic> {
  List<Map> page;

  @override
  void initState() {
    super.initState();
    page = [
      {'title': 'Container', 'page': ContainerWidget()},
      {'title': 'Row', 'page': RowWidget()},
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('基础组件'),
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
