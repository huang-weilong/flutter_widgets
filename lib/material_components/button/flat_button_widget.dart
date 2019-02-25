import 'package:flutter/material.dart';

class FlatButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FlatButton'),
        centerTitle: true,
        elevation: 0.0,
        bottom: PreferredSize(
          child: Text('一个扁平的Material按钮'),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      body: _buildFlatButton(),
    );
  }

  _buildFlatButton() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          FlatButton(
            color: Colors.blue,
            textColor: Colors.white,
            highlightColor: Colors.green,
            child: Text('改变文本颜色、背景颜色、高亮颜色'),
            onPressed: () {},
          ),
          FlatButton(
            disabledColor: Colors.grey,
            disabledTextColor: Colors.black,
            child: Text('不可点击'),
            onPressed: null,
          ),
          FlatButton.icon(
            splashColor: Colors.orange,
            shape: StadiumBorder(),
            icon: Icon(Icons.more),
            label: Text('添加了小图标(FlatButton.icon)'),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
