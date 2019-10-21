import 'package:flutter/material.dart';

class ListViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView'),
        centerTitle: true,
        elevation: 0.0,
        bottom: PreferredSize(
          child: Text(
            '可滚动的列表控件。ListView是最常用的滚动widget，它在滚动方向上一个接一个地显示它的孩子。在纵轴上，孩子们被要求填充ListView。',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        padding: EdgeInsets.all(12.0),
        children: <Widget>[
          Text(
            'ListView是最常用的滚动小部件。它在滚动方向上一个接一个地显示其子级。在横轴上，要求子级填充ListView。',
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 10.0),
          Text(
            '如果不为null，则itemExtent强制子级在滚动方向上具有给定范围。指定itemExtent比让孩子确定自己的范围更有效，因为滚动机械可以利用孩子的范围的知识来节省工作，例如在滚动位置急剧变化时。',
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 10.0),
          Text(
            '若要控制滚动视图的初始滚动偏移量，请为controller提供其ScrollController.initialScrollOffset属性集',
            style: TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}
