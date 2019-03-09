import 'package:flutter/material.dart';

class ConstrainedBoxWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ConstrainedBox'),
        centerTitle: true,
        elevation: 0.0,
        bottom: PreferredSize(
          child: Text(
            '一个小部件，对其子级施加额外的约束',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ConstrainedBox(
            constraints: BoxConstraints(minWidth: 100.0, minHeight: 100.0, maxWidth: 200.0, maxHeight: 200.0),
            child: Container(color: Colors.green),
          ),
          Text('minWidth: 100.0, minHeight: 100.0'),
          Text('maxWidth: 200.0,maxHeight: 200.0'),
          Text('子项未指定宽高'),
          SizedBox(
            height: 100.0,
            width: 180.0,
            child: ConstrainedBox(
              constraints: BoxConstraints.expand(),
              child: Container(width: 50.0, height: 50.0, color: Colors.orange),
            ),
          ),
          Text('BoxConstraints.expand()扩展以填充父布局'),
          Text('父：h:100.0,w:180.0   子：h:50.0,w:50.0'),
        ],
      ),
    );
  }
}
