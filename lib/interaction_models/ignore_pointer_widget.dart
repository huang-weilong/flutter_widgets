import 'package:flutter/material.dart';

class IgnorePointerWidget extends StatefulWidget {
  @override
  _IgnorePointerWidgetState createState() => _IgnorePointerWidgetState();
}

class _IgnorePointerWidgetState extends State<IgnorePointerWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IgnorePointer'),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            width: 200,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Listener(
                  onPointerDown: (v) {
                    print('点击了橙色盒子');
                  },
                  child: Container(color: Colors.orange),
                ),
                Listener(
                  onPointerDown: (v) {
                    print('点击了蓝色盒子');
                  },
                  child: IgnorePointer(
                    child: Listener(
                      onPointerDown: (v) {
                        print('点击了蓝色内部');
                      },
                      child: Container(
                        color: Colors.blue,
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 200,
            width: 200,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Listener(
                  onPointerDown: (v) {
                    print('点击了绿色盒子');
                  },
                  child: Container(color: Colors.green),
                ),
                Listener(
                  onPointerDown: (v) {
                    print('点击了蓝色盒子');
                  },
                  child: AbsorbPointer(
                    child: Listener(
                      onPointerDown: (v) {
                        print('点击了蓝色内部');
                      },
                      child: Container(
                        color: Colors.blue,
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text('AbsorbPointer本身可以接收点击事件，消耗掉事件，而IgnorePointer无法接收点击事件，在他下面的控件（不是子组件）可以接收到点击事件'),
        ],
      ),
    );
  }
}
