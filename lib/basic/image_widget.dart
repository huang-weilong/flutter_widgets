import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image'),
        centerTitle: true,
        elevation: 0.0,
        bottom: PreferredSize(
          child: Text(
            '一个显示图片的widget。',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.asset(
              'assets/images/1.jpg',
            ),
            Text('加载项目资源图片'),
            Image.asset(
              'assets/images/1.jpg',
              color: Colors.blue,
              colorBlendMode: BlendMode.darken,
            ),
            Text('添加混合模式'),
            Image.asset(
              'assets/images/2.jpg',
              width: 200.0,
              scale: 6.0,
              repeat: ImageRepeat.repeat,
            ),
            Text('缩放、重复'),
            Image.network(
              'https://avatars2.githubusercontent.com/u/37101820?s=400&u=4c6356d8d94322a7684909af9594149d3c83d433&v=4',
              width: 200.0,
            ),
            Text('加载网络资源图片'),
            Text('Image.file()加载本地图片文件'),
            Text('Image.memory()加载从unit8List获取的ImageStream'),
          ],
        ),
      ),
    );
  }
}
