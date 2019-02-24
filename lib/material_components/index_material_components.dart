import 'package:flutter/material.dart';

import 'app_structure/scaffold_widget.dart';
import 'app_structure/app_bar_widget.dart';
import 'app_structure/bottom_navigation_bar_widget.dart';
import 'app_structure/tab_bar_widget1.dart';
import 'app_structure/tab_bar_widget2.dart';
import 'app_structure/drawer_widget.dart';
import 'app_structure/raised_button_widget.dart';
import 'app_structure/floating_action_button_widget.dart';
import 'app_structure/flat_button_widget.dart';
import 'app_structure/icon_button_widget.dart';

class IndexMaterialComponents extends StatefulWidget {
  @override
  _IndexMaterialComponentsState createState() => _IndexMaterialComponentsState();
}

class _IndexMaterialComponentsState extends State<IndexMaterialComponents> {
  List<Map> page1;
  List<Map> page2;

  @override
  void initState() {
    super.initState();
    page1 = [
      {'title': 'Scaffold', 'page': ScaffoldWidget()},
      {'title': 'AppBar', 'page': AppBarWidget()},
      {'title': 'BottomNavigationBar', 'page': BottomNavigationBarWidget()},
      {'title': 'TabBar1', 'page': TabBarWidget1()},
      {'title': 'TabBar2', 'page': TabBarWidget2()},
      {'title': 'Drawer', 'page': DrawerWidget()},
    ];
    page2 = [
      {'title': 'RaisedButton', 'page': RaisedButtonWidget()},
      {'title': 'FloatingActionButton', 'page': FloatingActionButtonWidget()},
      {'title': 'FlatButton', 'page': FlatButtonWidget()},
      {'title': 'IconButton', 'page': IconButtonWidget()},
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
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 4.0),
            color: Color(0xffd3d3d3),
            child: Text('App结构和导航'),
          ),
          Column(
            children: page1.map((item) {
              return ListTile(
                title: Text(item['title']),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => item['page']));
                },
              );
            }).toList(),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 4.0),
            color: Color(0xffd3d3d3),
            child: Text('按钮'),
          ),
          Column(
            children: page2.map((item) {
              return ListTile(
                title: Text(item['title']),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => item['page']));
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
