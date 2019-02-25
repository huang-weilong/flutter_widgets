import 'package:flutter/material.dart';

import 'app_structure/scaffold_widget.dart';
import 'app_structure/app_bar_widget.dart';
import 'app_structure/bottom_navigation_bar_widget.dart';
import 'app_structure/tab_bar_widget1.dart';
import 'app_structure/tab_bar_widget2.dart';
import 'app_structure/drawer_widget.dart';
import 'button/raised_button_widget.dart';
import 'button/floating_action_button_widget.dart';
import 'button/flat_button_widget.dart';
import 'button/icon_button_widget.dart';
import 'button/popup_menu_button_widget.dart';
import 'button/button_bar_widget.dart';
import 'input_and_selection_box/text_field_widget.dart';
import 'input_and_selection_box/checkbox_widget.dart';
import 'input_and_selection_box/radio_widget.dart';
import 'input_and_selection_box/switch_widget.dart';
import 'input_and_selection_box/slider_widget.dart';
import 'input_and_selection_box/show_date_picker_page.dart';
import 'dialog_alert_panel/simple_dialog_widget.dart';
import 'dialog_alert_panel/alert_dialog_widget.dart';
import 'dialog_alert_panel/bottom_sheet_widget.dart';
import 'dialog_alert_panel/expansion_panel_widget.dart';
import 'dialog_alert_panel/snack_bar_widget.dart';
import 'information_display/image_widget.dart';
import 'information_display/icon_widget.dart';

class IndexMaterialComponents extends StatefulWidget {
  @override
  _IndexMaterialComponentsState createState() => _IndexMaterialComponentsState();
}

class _IndexMaterialComponentsState extends State<IndexMaterialComponents> {
  List<Map> page1;
  List<Map> page2;
  List<Map> page3;
  List<Map> page4;
  List<Map> page5;

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
      {'title': 'Checkbox', 'page': CheckboxWidget()},
      {'title': 'Radio', 'page': RadioWidget()},
      {'title': 'Switch', 'page': SwitchWidget()},
      {'title': 'Slider', 'page': SliderWidget()},
      {'title': 'showDate(Time)Picker', 'page': ShowDatePickerPage()},
    ];
    page4 = [
      {'title': 'SimpleDialog', 'page': SimpleDialogWidget()},
      {'title': 'AlertDialog', 'page': AlertDialogWidget()},
      {'title': 'BottomSheet', 'page': BottomSheetWidget()},
      {'title': 'ExpansionPanel', 'page': ExpansionPanelWidget()},
      {'title': 'SnackBar', 'page': SnackBarWidget()},
    ];
    page5 = [
      {'title': 'Image', 'page': ImageWidget()},
      {'title': 'Icon', 'page': IconWidget()},
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
          buildTitle('对话框、Alert、Panel'),
          buildColumnItem(page4),
          buildTitle('信息展示'),
          buildColumnItem(page5),
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
