import 'package:flutter/material.dart';

import 'basic/index_basic.dart';
import 'material_components/index_material_components.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map> list;

  @override
  void initState() {
    super.initState();
    list = [
      {
        'title': '基础组件',
        'description': '在构建您的第一个Flutter应用程序之前，您绝对需要了解这些widget。',
        'image': 'assets/images/1.jpg',
        'page': IndexBasic(),
      },
      {
        'title': 'Material Components',
        'description': '实现了Material Design 指南的视觉、效果、motion-rich的widget。',
        'image': 'assets/images/2.jpg',
        'page': IndexMaterialComponents(),
      }
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Widget Learning'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView(
        children: list.map((item) {
          return Padding(
            padding: EdgeInsets.all(12.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => item['page']));
              },
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Image.asset(item['image']),
                        Positioned(
                          bottom: 10.0,
                          left: 10.0,
                          right: 10.0,
                          child: Text(
                            item['description'],
                            maxLines: 2,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        item['title'],
                        style: TextStyle(fontSize: 24.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
