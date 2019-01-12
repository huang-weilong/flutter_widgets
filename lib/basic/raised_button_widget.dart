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
            'Material Design中的button， 一个凸起的材质矩形按钮',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
              textColor: Colors.white,
              color: Colors.blue,
              child: Text('改变文本、背景颜色'),
              onPressed: () {},
            ),
            RaisedButton(
//            disabledTextColor: Colors.white,
//            disabledElevation: 3.0,
//            disabledTextColor: Colors.green,
              child: Text('不可点击'),
              onPressed: null,
            ),
            RaisedButton(
              splashColor: Colors.red,
              child: Text('改变水波纹颜色、添加圆角'),
              shape: StadiumBorder(side: BorderSide(width: 1.0, color: Colors.red)),
              onPressed: () {},
            ),
            RaisedButton(
              highlightColor: Colors.green,
              elevation: 10.0,
              child: Text('改变高亮颜色、阴影强度'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
