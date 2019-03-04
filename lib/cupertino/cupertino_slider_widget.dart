import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CupertinoSliderWidget extends StatefulWidget {
  @override
  _CupertinoSliderWidgetState createState() => _CupertinoSliderWidgetState();
}

class _CupertinoSliderWidgetState extends State<CupertinoSliderWidget> {
  double _value1 = 10.0;
  double _value2 = 15.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CupertinoSlider'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CupertinoSlider(
              value: _value1,
              min: 0.0,
              max: 100.0,
              onChanged: (double value) {
                setState(() {
                  _value1 = value;
                });
              },
            ),
            Text('滑块1的值：${_value1.toStringAsFixed(1)}'),
            CupertinoSlider(
              value: _value2,
              divisions: 5, //如果不设置，滑块滑动是连续的
              min: 0.0,
              max: 100.0,
              activeColor: Colors.green,
              onChanged: (double value) {
                setState(() {
                  _value2 = value;
                });
              },
              onChangeStart: (v) {
                print('滑动开始时的滑块数值$v');
              },
              onChangeEnd: (v) {
                print('滑动结束时的滑块数值$v');
              },
            ),
            Text('滑块2的值：${_value2.toString()}'),
          ],
        ),
      ),
    );
  }
}
