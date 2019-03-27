import 'package:flutter/material.dart';

class IndexedStackWidget extends StatefulWidget {
  @override
  _IndexedStackWidgetState createState() => _IndexedStackWidgetState();
}

class _IndexedStackWidgetState extends State<IndexedStackWidget> {
  int index = 0;
  List<Color> list = [
    Colors.orange,
    Colors.green,
    Colors.blue,
    Colors.red,
    Colors.yellow,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IndexedStack'),
        centerTitle: true,
        elevation: 0.0,
        bottom: PreferredSize(
          child: Text(
            '从一个子widget列表中显示单个孩子的Stack',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 50.0),
            IndexedStack(
              index: index,
              children: list.map((item) {
                return buildItem(item);
              }).toList(),
            ),
            RaisedButton(
              child: Text('切换'),
              onPressed: () {
                setState(() {
                  index++;
                  if (index > 4) {
                    index = 0;
                  }
                });
              },
            )
          ],
        ),
      ),
    );
  }

  Widget buildItem(Color color) {
    return Container(
      color: color,
      width: 100.0,
      height: 100.0,
      child: Text('列表中的第${list.indexOf(color)}项'),
    );
  }
}
