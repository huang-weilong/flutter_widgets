import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Container'),
        centerTitle: true,
        elevation: 0.0,
        bottom: PreferredSize(
          child: Text(
            'Container是一个拥有绘制、定位、调整大小的 widget。类似HTML里的div。',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 100.0,
              width: 100.0,
              color: Color(0xff63d6fb),
            ),
            Text('上面是一个100*100的填充了颜色的Container'),
            Container(
              alignment: Alignment.centerRight,
              height: 100.0,
              width: 100.0,
              color: Color(0xff8affb1),
              child: Container(
                height: 20.0,
                width: 20.0,
                color: Color(0xff8ab1ff),
              ),
            ),
            Text('上图展示了Container的定位功能，它是作用于它的child的，将child对齐到centerRight'),
            Container(
              height: 100.0,
              width: 100.0,
              decoration: BoxDecoration(
                color: Color(0xffffc18a),
                border: Border.all(color: Color(0xffff8a8a), width: 6.0),
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [BoxShadow(color: Colors.red, blurRadius: 10.0)],
              ),
            ),
            Text('上图展示了Container的装饰（decoration），添加了边框、边框圆角、阴影'),
            Container(
              height: 100.0,
              width: 100.0,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/images/1.jpg'), fit: BoxFit.fill),
              ),
              child: Text(
                '文字文字文字',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Text('在装饰中使用图片'),
            Container(
              height: 100.0,
              width: 100.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.green, Colors.red, Colors.yellow]),
              ),
            ),
            Text('在装饰中使用渐变色'),
            Container(
              width: 100.0,
              height: 100.0,
              constraints: BoxConstraints(minWidth: 200.0),
              color: Color(0xffe28aff),
            ),
            Text('constraints属性可以设置Container的最大（最小）宽、高'),
            Container(
              width: 100.0,
              height: 100.0,
              color: Colors.greenAccent,
              transform: Matrix4.rotationZ(1.0),
            ),
            Text('使用transform属性对Container进行转换效果'),
            Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.orange),
            ),
            Text('装饰shape属性设置形状'),
          ],
        ),
      ),
    );
  }
}
