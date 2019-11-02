import 'package:flutter/material.dart';

class LayoutBuilderWidget extends StatefulWidget {
  @override
  _LayoutBuilderWidgetState createState() => _LayoutBuilderWidgetState();
}

class _LayoutBuilderWidgetState extends State<LayoutBuilderWidget> {
  double width = 100.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LayoutBuilder'),
        centerTitle: true,
        elevation: 0.0,
        bottom: PreferredSize(
          child: Text(
            '构建一个可以依赖父窗口大小的widget树',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            width = width > 100.0 ? 100.0 : 300.0;
          });
        },
        child: Text('切换'),
      ),
      body: Container(
        // Toggling width from 100 to 300 will change what is rendered
        // in the child container
        width: width,
        child: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 200.0) {
            return Center(child: Text('BIG'));
          } else {
            return Center(child: Text('SMALL'));
          }
        }),
      ),
    );
  }
}
