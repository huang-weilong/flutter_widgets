import 'package:flutter/material.dart';
import 'dart:math' as math;

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
            Text('关于图片分辨率的选择'),
            Text('在pubspec.yaml文件中声明文件夹assets/images/'),
            Text('若有对应的2x、3x文件，则会根据手机分辨率自动选择合适的图片显示，如下：'),
            Image.asset('assets/images/image.png'),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Text('(1x、2x、3x是三张名字相同内容不同的图片）'),
            ),
            Image.asset('assets/images/my_painting.jpg', height: 100.0),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Text('从本地资源获取图片'),
            ),
            Image.asset(
              'assets/images/my_painting.jpg',
              height: 200.0,
              width: double.maxFinite,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Text('fit: BoxFit.fill填充'),
            ),
            Image.network(
              'https://avatars2.githubusercontent.com/u/37101820?s=400&u=4c6356d8d94322a7684909af9594149d3c83d433&v=4',
              height: 200,
              width: 200,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Text('从Internet获取图片'),
            ),
            Image.asset(
              'assets/images/my_painting.jpg',
              width: 200.0,
              height: 200.0,
              color: Colors.blue, //配合colorBlendMode使用
              colorBlendMode: BlendMode.multiply,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Text('设置颜色混合模式'),
            ),
            Image.asset(
              'assets/images/my_painting.jpg',
              color: Colors.orangeAccent, //配合colorBlendMode使用
              colorBlendMode: BlendMode.multiply,
              scale: 7.3,
              width: 200.0,
              repeat: ImageRepeat.repeat, //图像没有占满容器时是否重复
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Text('重复'),
            ),
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: Image.asset(
                'assets/images/my_painting.jpg',
                width: 200.0,
                height: 200.0,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Text('圆矩形裁剪ClipRRect'),
            ),
            ClipOval(
              child: SizedBox(
                width: 200.0,
                height: 200.0,
                child: Image.asset(
                  'assets/images/my_painting.jpg',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Text('圆形裁剪ClipOval\n使用了SizedBox约束图像大小'),
            ),
            ClipRect(
              clipper: _MyClipper(),
              child: Image.asset(
                'assets/images/my_painting.jpg',
                width: 200.0,
                height: 200.0,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Text('矩形裁剪ClipRect\n需要定义clipper参数才有效果'),
            ),
            ClipPath(
              clipper: _StarCliper(radius: 100.0),
              child: Image.asset(
                'assets/images/my_painting.jpg',
                width: 200.0,
                height: 200.0,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Text('路径裁剪ClipPath'),
            ),
          ],
        ),
      ),
    );
  }
}

class _MyClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0.0, 0.0, size.width - size.width / 3, size.height - 10.0);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}

class _StarCliper extends CustomClipper<Path> {
  final double radius;

  _StarCliper({this.radius});

  /// 角度转弧度公式
  double degree2Radian(int degree) {
    return (math.pi * degree / 180);
  }

  @override
  Path getClip(Size size) {
    double radius = this.radius;
    Path path = new Path();
    double radian = degree2Radian(36); // 36为五角星的角度
    double radiusIn = (radius * math.sin(radian / 2) / math.cos(radian)); // 中间五边形的半径

    path.moveTo((radius * math.cos(radian / 2)), 0.0); // 此点为多边形的起点
    path.lineTo((radius * math.cos(radian / 2) + radiusIn * math.sin(radian)), (radius - radius * math.sin(radian / 2)));
    path.lineTo((radius * math.cos(radian / 2) * 2), (radius - radius * math.sin(radian / 2)));
    path.lineTo((radius * math.cos(radian / 2) + radiusIn * math.cos(radian / 2)), (radius + radiusIn * math.sin(radian / 2)));
    path.lineTo((radius * math.cos(radian / 2) + radius * math.sin(radian)), (radius + radius * math.cos(radian)));
    path.lineTo((radius * math.cos(radian / 2)), (radius + radiusIn));
    path.lineTo((radius * math.cos(radian / 2) - radius * math.sin(radian)), (radius + radius * math.cos(radian)));
    path.lineTo((radius * math.cos(radian / 2) - radiusIn * math.cos(radian / 2)), (radius + radiusIn * math.sin(radian / 2)));
    path.lineTo(0.0, (radius - radius * math.sin(radian / 2)));
    path.lineTo((radius * math.cos(radian / 2) - radiusIn * math.sin(radian)), (radius - radius * math.sin(radian / 2)));

    path.close(); // 使这些点构成封闭的多边形

    return path;
  }

  @override
  bool shouldReclip(_StarCliper oldClipper) {
    return this.radius != oldClipper.radius;
  }
}
