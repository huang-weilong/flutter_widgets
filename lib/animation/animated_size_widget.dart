import 'package:flutter/material.dart';

class AnimatedSizeWidget extends StatefulWidget {
  @override
  _AnimatedSizeWidgetState createState() => _AnimatedSizeWidgetState();
}

class _AnimatedSizeWidgetState extends State<AnimatedSizeWidget> with SingleTickerProviderStateMixin {
  int index = 0;
  List<double> width = [50.0, 100.0, 100.0, 80.0];
  List<double> height = [50.0, 200.0, 100.0, 180.0];
  List<Color> color = [Colors.orange, Colors.cyan, Colors.redAccent, Colors.blue];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedSize'),
        elevation: 0.0,
        centerTitle: true,
        bottom: PreferredSize(
          child: Text(
            '动画widget，当给定的孩子的大小变化时，它自动地在给定时间内转换它的大小。',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Text('更改'),
          onPressed: () {
            setState(() {
              index++;
              if (index > 3) index = 0;
            });
          }),
      body: AnimatedSize(
        duration: Duration(seconds: 2),
        vsync: this,
        child: Container(
          width: width[index],
          height: height[index],
          color: color[index],
        ),
      ),
    );
  }
}
