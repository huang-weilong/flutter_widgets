import 'package:flutter/material.dart';

import 'cupertino_activity_indicator_widget.dart';
import 'cupertino_alert_dialog_widget.dart';
import 'cupertino_button_widget.dart';
import 'cupertino_dialog_widget.dart';
import 'cupertino_dialog_action_widget.dart';
import 'cupertino_slider_widget.dart';
import 'cupertino_switch_widget.dart';

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
