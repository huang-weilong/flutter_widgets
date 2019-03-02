import 'dart:async';

import 'package:flutter/material.dart';

class LinearProgressIndicatorWidget extends StatefulWidget {
  @override
  _LinearProgressIndicatorWidgetState createState() => _LinearProgressIndicatorWidgetState();
}

class _LinearProgressIndicatorWidgetState extends State<LinearProgressIndicatorWidget> {
  Animation<Color> animation = AlwaysStoppedAnimation(Colors.green);
  double loading = 0.0;
  int percentage = 0;
  Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
      setState(() {
        loading += 0.0008;
        percentage = (loading * 100).floor();
        if (loading >= 1) timer.cancel();
      });
    });
  }

  @override
  void dispose() {
    if (timer != null) timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LinearProgressIndicator'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text('一个线性进度条'),
          LinearProgressIndicator(),
          LinearProgressIndicator(valueColor: animation, backgroundColor: Colors.orange),
          LinearProgressIndicator(value: loading),
          Text('$percentage%'),
          Text('一个圆形进度条'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CircularProgressIndicator(),
              CircularProgressIndicator(valueColor: animation, backgroundColor: Colors.red),
              CircularProgressIndicator(value: loading),
              CircularProgressIndicator(strokeWidth: 10.0),
            ],
          ),
        ],
      ),
    );
  }
}
