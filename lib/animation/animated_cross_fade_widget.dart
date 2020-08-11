import 'package:flutter/material.dart';

class AnimatedCrossFadeWidget extends StatefulWidget {
  @override
  _AnimatedCrossFadeWidgetState createState() => _AnimatedCrossFadeWidgetState();
}

class _AnimatedCrossFadeWidgetState extends State<AnimatedCrossFadeWidget> {
  bool flag = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedCrossFade'),
        centerTitle: true,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
              icon: Text('切换'),
              onPressed: () {
                setState(() {
                  flag = !flag;
                });
              })
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 300.0,
            child: Center(
              child: AnimatedCrossFade(
                //解决过渡抖动问题
                layoutBuilder: (child1, key1, child2, key2) {
                  return Stack(
                    overflow: Overflow.visible,
                    alignment: Alignment.center,
                    children: <Widget>[
                      Positioned(
//                        top: 0,
//                        bottom: 0,
                        key: key2,
                        child: child2,
                      ),
                      Positioned(
                        key: key1,
                        child: child1,
                      ),
                    ],
                  );
                },
                duration: Duration(seconds: 3),
                firstChild: FlutterLogo(style: FlutterLogoStyle.horizontal, size: 300.0),
                secondChild: FlutterLogo(style: FlutterLogoStyle.stacked, size: 100.0),
                crossFadeState: flag ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              ),
            ),
          ),
          Text('一个小部件，它在两个给定的子节点之间交叉淡化，并在它们的大小之间设置动画。')
        ],
      ),
    );
  }
}
