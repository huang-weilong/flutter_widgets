import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListBodyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListBody'),
        centerTitle: true,
        elevation: 0.0,
        bottom: PreferredSize(
          child: Text(
            '一个widget，它沿着一个给定的轴，顺序排列它的子元素',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      body: Column(
        children: <Widget>[
          ListBody(
            children: <Widget>[
              Text('一个小部件，它沿着给定的轴顺序排列其子级，将其强制为另一个轴上父级的尺寸'),
              Text('此小部件很少直接使用。相反，可以考虑使用结合了类似布局算法和滚动行为的ListView或 Column，它可以使您更加灵活地控制垂直框的布局。'),
              Text('不常用！不常用！不常用！', style: TextStyle(color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }
}
