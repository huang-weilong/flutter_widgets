import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:typed_data';
import 'dart:ui' as ui;

class RawImageWidget extends StatefulWidget {
  @override
  _RawImageWidgetState createState() => _RawImageWidgetState();
}

class _RawImageWidgetState extends State<RawImageWidget> {
  ui.Image _img;

  @override
  void initState() {
    super.initState();
    _loadImageByAsset('assets/images/6.jpg').then((_urlImage) {
      setState(() {
        _img = _urlImage;
      });
    });
  }

// 注意这里必须使用ui.Image
  Future<ui.Image> _loadImageByAsset(String asset) async {
    ByteData data = await rootBundle.load(asset);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List());
    ui.FrameInfo fi = await codec.getNextFrame();

    return fi.image;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RawImage'),
        centerTitle: true,
        elevation: 0.0,
        bottom: PreferredSize(
          child: Text(
            '一个直接显示dart:ui.Image的widget。',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      body: _img == null
          ? Center(child: Text('找不到资源'))
          : Column(
              children: <Widget>[
                RawImage(image: _img),
                Text('RawImage 是通过 paintImage 绘制出来的Image'),
                Text('RawIamge很少使用，推荐使用Image'),
              ],
            ),
    );
  }
}
