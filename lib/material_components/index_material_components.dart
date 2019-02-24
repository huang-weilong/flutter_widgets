import 'package:flutter/material.dart';

import 'app_structure/scaffold_widget.dart';
import 'app_structure/app_bar_widget.dart';
import 'app_structure/bottom_navigation_bar_widget.dart';

class IndexMaterialComponents extends StatefulWidget {
  @override
  _IndexMaterialComponentsState createState() => _IndexMaterialComponentsState();
}

class _IndexMaterialComponentsState extends State<IndexMaterialComponents> {
  List<Map> page;

  @override
  void initState() {
    super.initState();
    page = [
      {'title': 'Scaffold', 'page': ScaffoldWidget()},
      {'title': 'AppBar', 'page': AppBarWidget()},
      {'title': 'BottomNavigationBar', 'page': BottomNavigationBarWidget()},
    ];
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material Components'),
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
