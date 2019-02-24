import 'package:flutter/material.dart';

class PopupMenuButtonWidget extends StatefulWidget {
  @override
  _PopupMenuButtonWidgetState createState() => _PopupMenuButtonWidgetState();
}

class _PopupMenuButtonWidgetState extends State<PopupMenuButtonWidget> {
  String value = '请点击右上角图标';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PopupMenuButton'),
        centerTitle: true,
        elevation: 0.0,
        bottom: PreferredSize(
          child: Text(
            '点击或调用onSelected时显示一个弹出式菜单列表',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(30.0),
        ),
        actions: <Widget>[
          PopupMenuButton(
            icon: Icon(Icons.menu),
            onSelected: (value) {
              setState(() {
                this.value = '选择了选项$value';
              });
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<String>>[
                PopupMenuItem(value: "一", child: Text("选项一")),
                PopupMenuItem(value: '二', child: Text("选项二")),
                PopupMenuItem(value: "三", child: Text("选项三")),
              ];
            },
          )
        ],
      ),
      body: Center(child: Text(value)),
    );
  }
}
