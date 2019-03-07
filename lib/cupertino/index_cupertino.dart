import 'package:flutter/material.dart';

import 'cupertino_activity_indicator_widget.dart';
import 'cupertino_alert_dialog_widget.dart';
import 'cupertino_button_widget.dart';
import 'cupertino_dialog_widget.dart';
import 'cupertino_dialog_action_widget.dart';
import 'cupertino_slider_widget.dart';
import 'cupertino_switch_widget.dart';
import 'cupertino_page_transition_widget.dart';
import 'cupertino_fullscreen_dialog_transition_widget.dart';
import 'cupertino_navigation_bar_widget.dart';
import 'cupertino_tab_bar_widget.dart';

class IndexCupertino extends StatefulWidget {
  @override
  _IndexCupertinoState createState() => _IndexCupertinoState();
}

class _IndexCupertinoState extends State<IndexCupertino> {
  List<Map> page;

  @override
  void initState() {
    super.initState();
    page = [
      {'title': 'CupertinoActivityIndicator', 'page': CupertinoActivityIndicatorWidget()},
      {'title': 'CupertinoAlertDialog', 'page': CupertinoAlertDialogWidget()},
      {'title': 'CupertinoButton', 'page': CupertinoButtonWidget()},
      {'title': 'CupertinoDialog', 'page': CupertinoDialogWidget()},
      {'title': 'CupertinoDialogAction', 'page': CupertinoDialogActionWidget()},
      {'title': 'CupertinoSlider', 'page': CupertinoSliderWidget()},
      {'title': 'CupertinoSwitch', 'page': CupertinoSwitchWidget()},
      {'title': 'CupertinoPageTransition', 'page': CupertinoPageTransitionWidget(), 'finish': false},
      {'title': 'CupertinoFullscreenDialogTransition', 'page': CupertinoFullscreenDialogTransitionWidget(), 'finish': false},
      {'title': 'CupertinoNavigationBar', 'page': CupertinoNavigationBarWidget()},
      {'title': 'CupertinoTabBar', 'page': CupertinoTabBarWidget()},
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cupertino'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView(
        children: page.map((item) {
          return ListTile(
            title: Text(item['title'], style: TextStyle(color: item['finish'] == null ? Colors.black : Colors.red)),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => item['page']));
            },
          );
        }).toList(),
      ),
    );
  }
}
