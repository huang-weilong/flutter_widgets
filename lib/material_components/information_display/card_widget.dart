import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card'),
        centerTitle: true,
        elevation: 0.0,
        bottom: PreferredSize(
          child: Text(
            '一个 Material Design 卡片。拥有一个圆角和阴影',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.only(left: 100.0),
            elevation: 6.0,
            color: Colors.orange,
            child: SizedBox(height: 40.0, width: 100.0, child: Text('卡片布局')),
          ),
          Card(
            margin: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                ListTile(
                  contentPadding: EdgeInsets.all(16.0),
                  dense: true,
                  leading: Icon(Icons.favorite, color: Colors.red),
                  title: Text('材料设计卡。卡片有圆角和阴影'),
                  subtitle: Text('卡片是用于表示一些相关信息的一张材料，例如相册，地理位置，用餐，联系方式等。'),
                ),
                ButtonTheme.bar(
                  child: ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: Text('BUY TICKETS'),
                        onPressed: () {},
                      ),
                      FlatButton(
                        child: Text('LISTEN'),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
