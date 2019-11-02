import 'package:flutter/material.dart';
import 'package:flutter_widgets/assets_image_icon/image_widget.dart';

class IndexAssetsImageIcon extends StatefulWidget {
  @override
  _IndexAssetsImageIconState createState() => _IndexAssetsImageIconState();
}

class _IndexAssetsImageIconState extends State<IndexAssetsImageIcon> {
  List<Map> page;

  @override
  void initState() {
    super.initState();
    page = [
      {'title': 'Image', 'page': ImageWidget()},
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Assets、图片、Icons'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView(
        children: page.map((item) {
          return ListTile(
            title: Text(item['title']),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => item['page']));
            },
          );
        }).toList(),
      ),
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
