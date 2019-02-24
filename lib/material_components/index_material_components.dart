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
import 'app_structure/popup_menu_button_widget.dart';
import 'app_structure/button_bar_widget.dart';
import 'app_structure/text_field_widget.dart';

class IndexMaterialComponents extends StatefulWidget {
  @override
  _IndexMaterialComponentsState createState() => _IndexMaterialComponentsState();
}

class _IndexMaterialComponentsState extends State<IndexMaterialComponents> {
  List<Map> page1;
  List<Map> page2;
  List<Map> page3;

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
      {'title': 'PopupMenuButton', 'page': PopupMenuButtonWidget()},
      {'title': 'ButtonBar', 'page': ButtonBarWidget()},
    ];
    page3 = [
      {'title': 'TextField', 'page': TextFieldWidget()},
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
          buildTitle('App结构和导航'),
          buildColumnItem(page1),
          buildTitle('按钮'),
          buildColumnItem(page2),
          buildTitle('输入框和选择框'),
          buildColumnItem(page3),
        ],
      ),
    );
  }

  Widget buildTitle(String title) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      color: Color(0xffd3d3d3),
      child: Text(title),
    );
  }

  Widget buildColumnItem(List<Map> page) {
    return Column(
      children: page.map((item) {
        return ListTile(
          title: Text(item['title']),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => item['page']));
          },
        );
      }).toList(),
    );
  }
}
