import 'package:flutter/material.dart';

class AnimatedPhysicalModelWidget extends StatefulWidget {
  @override
  _AnimatedPhysicalModelWidgetState createState() => _AnimatedPhysicalModelWidgetState();
}

class _AnimatedPhysicalModelWidgetState extends State<AnimatedPhysicalModelWidget> {
  int index = 0;
  List<double> radius = [10, 150, 20, 100];
  List<double> elevation = [10, 20, 50, 15];
  List<Color> color = [Colors.blue, Colors.orange, Colors.green, Colors.redAccent];
  List<Color> shadowColor = [Colors.lightGreen, Colors.red, Colors.blueAccent, Colors.cyan];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedPhysicalModel'),
        elevation: 0.0,
        centerTitle: true,
        bottom: PreferredSize(
          child: Text(
            'PhysicalModel的动画版本',
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
      body: AnimatedPhysicalModel(
        borderRadius: BorderRadius.circular(radius[index]),
        shape: BoxShape.rectangle,
        color: color[index],
        elevation: elevation[index],
        shadowColor: shadowColor[index],
        child: Container(
          height: 300,
          width: 300,
        ),
        duration: Duration(seconds: 1),
      ),
    );
  }
}
