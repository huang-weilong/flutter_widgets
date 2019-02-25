import 'package:flutter/material.dart';

class ExpansionPanelWidget extends StatefulWidget {
  @override
  _ExpansionPanelWidgetState createState() => _ExpansionPanelWidgetState();
}

class _ExpansionPanelWidgetState extends State<ExpansionPanelWidget> {
  List<bool> _isExpanded = [false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ExpansionPanel'),
        centerTitle: true,
        elevation: 0.0,
        bottom: PreferredSize(
          child: Text(
            '材料扩展面板。它有一个标题和一个正文，可以展开或折叠',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      body: Column(
        children: <Widget>[
          ExpansionPanelList(
            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                _isExpanded[index] = !isExpanded;
              });
            },
            children: [
              ExpansionPanel(
                headerBuilder: (BuildContext context, bool flag) {
                  return Text('标题');
                },
                body: Text('内容'),
                isExpanded: _isExpanded[0],
              ),
              ExpansionPanel(
                headerBuilder: (BuildContext context, bool flag) {
                  return Text('标题');
                },
                body: Text('内容'),
                isExpanded: _isExpanded[1],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
