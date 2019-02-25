import 'package:flutter/material.dart';

class RaisedButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RaisedButton'),
        centerTitle: true,
        elevation: 0.0,
        bottom: PreferredSize(
          child: Text(
            '材料设计“凸起按钮”',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      body: _buildRaisedButton(),
    );
  }

  _buildRaisedButton() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          RaisedButton(
            textColor: Colors.white,
            color: Colors.blue,
            highlightColor: Colors.orange,
            child: Text('改变文本颜色、背景颜色、高亮颜色'),
            onPressed: () {},
          ),
          RaisedButton(
            disabledTextColor: Colors.white,
            disabledColor: Colors.grey,
            child: Text('不可点击'),
            onPressed: null,
          ),
          RaisedButton.icon(
            icon: Icon(Icons.add),
            label: Text('添加了小图标（RaisedButton.icon）'),
            onPressed: () {},
          ),
          RaisedButton(
            textColor: Colors.white,
            color: Colors.blue,
            splashColor: Colors.redAccent,
            shape: StadiumBorder(),
            child: Text('体育场边界使用shape: StadiumBorder()'),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
