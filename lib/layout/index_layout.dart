import 'package:flutter/material.dart';
import 'single_child_layout_widget/container_widget.dart';
import 'single_child_layout_widget/padding_widget.dart';

class IndexLayout extends StatefulWidget {
  @override
  _IndexLayoutState createState() => _IndexLayoutState();
}

class _IndexLayoutState extends State<IndexLayout> {
  List<Map> page1;

  @override
  void initState() {
    super.initState();
    page1 = [
      {'title': 'Container', 'page': ContainerWidget()},
      {'title': 'Padding', 'page': PaddingWidget()},
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Layout'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView(children: <Widget>[
        buildTitle('拥有单个子元素的布局widget'),
        buildColumnItem(page1),
      ]),
    );
  }

  Widget buildTitle(String title) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      color: Color(0xffd3d3d3),
      child: Text(title),
    );
  }

  Widget buildColumnItem(List<Map> page) {
    return Column(
      children: page.map((item) {
        return ListTile(
          title: Text(item['title'], style: TextStyle(color: item['finish'] == null ? Colors.black : Colors.red)),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => item['page']));
          },
        );
      }).toList(),
    );
  }
}
