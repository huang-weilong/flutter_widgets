import 'package:flutter/material.dart';
import 'dart:math' as math;

class TransformWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transform'),
        centerTitle: true,
        elevation: 0.0,
        bottom: PreferredSize(
          child: Text(
            '在绘制其子项之前应用转换的窗口小部件',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.black,
              child: Transform(
                alignment: Alignment.topRight,
                transform: Matrix4.skewY(0.3)..rotateZ(-math.pi / 12.0),
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  color: Color(0xFFE8581C),
                  child: Text('Apartment for rent!'),
                ),
              ),
            ),
            Transform(
              transform: Matrix4.rotationX(1.0)..rotateY(1.0),
              origin: Offset(12.5, 1.5),
//            transformHitTests: false,
              child: Container(
                color: Colors.blue,
                width: 100.0,
                height: 100.0,
              ),
            ),
            Text('绕x轴、y轴旋转'),
            Transform(
              transform: Matrix4.rotationZ(0.3),
              child: Container(
                color: Colors.blue,
                width: 100.0,
                height: 100.0,
              ),
            ),
            Text('绕x轴旋转（垂直于手机屏幕的轴）'),
            Text('Matrix4提供了很多转换的构造函数，去探索吧！'),
            SizedBox(height: 20.0),
            Text('origin：坐标系原点，默认是左上角顶点'),
            Text('alignment:对齐方式'),
            Text('transformHitTests:点击区域是否也做相应的改变,默认 true'),
          ],
        ),
      ),
    );
  }
}
