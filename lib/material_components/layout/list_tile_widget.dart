import 'package:flutter/material.dart';

class ListTileWidget extends StatefulWidget {
  @override
  _ListTileWidgetState createState() => _ListTileWidgetState();
}

class _ListTileWidgetState extends State<ListTileWidget> {
  List<Map<String, dynamic>> dataMap = [
    {'title': '物品一', 'price': '￥21.90', 'selected': false},
    {'title': '物品二', 'price': '￥42.30', 'selected': false},
    {'title': '物品三', 'price': '￥67.50', 'selected': false},
    {'title': '物品四', 'price': '￥132.50', 'selected': false},
    {'title': '物品五', 'price': '￥155.80', 'selected': false},
    {'title': '物品六', 'price': '￥227.20', 'selected': false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListTile'),
        centerTitle: true,
        elevation: 0.0,
        bottom: PreferredSize(
          child: Text(
            '单个固定高度的行，通常包含一些文本以及前导或尾随图标',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      body: ListView(
          children: dataMap.map((item) {
        return ListTile(
//          dense: true, // 密集
//          contentPadding: EdgeInsets.all(10.0), // 内边距
          leading: item['selected'] ? Icon(Icons.check_box, color: Colors.green) : Icon(Icons.check_box_outline_blank),
          title: Text(item['title']),
          trailing: Text(item['price']),
          onTap: () {
            setState(() {
              item['selected'] = !item['selected'];
            });
          },
        );
      }).toList()),
    );
  }
}
