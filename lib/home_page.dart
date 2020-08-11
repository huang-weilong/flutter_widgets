import 'package:flutter/material.dart';
import 'package:flutter_widgets/animation/index_animation.dart';
import 'package:flutter_widgets/assets_image_icon/index_assets_image_icon.dart';
import 'package:flutter_widgets/input/index_input.dart';
import 'package:flutter_widgets/text/index_text.dart';

import 'basic/index_basic.dart';
import 'material_components/index_material_components.dart';
import 'cupertino/index_cupertino.dart';
import 'layout/index_layout.dart';

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
      },
      {
        'title': 'Cupertino (iOS风格) Widgets',
        'description': '用于当前iOS设计语言的美丽和高保真widget。',
        'image': 'assets/images/3.jpg',
        'page': IndexCupertino(),
      },
      {
        'title': 'Layout',
        'description': '排列其它widget的columns、rows、grids和其它的layouts。',
        'image': 'assets/images/4.jpg',
        'page': IndexLayout(),
      },
      {
        'title': 'Text',
        'description': '文本显示和样式',
        'image': 'assets/images/5.jpg',
        'page': IndexText(),
      },
      {
        'title': 'Assets、图片、Icons',
        'description': '管理assets, 显示图片和Icon',
        'image': 'assets/images/6.jpg',
        'page': IndexAssetsImageIcon(),
      },
      {
        'title': '表单 Widgets',
        'description': '获取用户输入的widget',
        'image': 'assets/images/7.jpg',
        'page': IndexInput(),
      },
      {
        'title': '动画和Motion',
        'description': '在您的应用中使用动画',
        'image': 'assets/images/8.jpg',
        'page': IndexAnimation(),
      },
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
