import 'package:flutter/material.dart';

class FittedBoxWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FittedBox'),
        centerTitle: true,
        elevation: 0.0,
        bottom: PreferredSize(
          child: Text(
            '根据合适的尺度对孩子进行缩放和定位',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  height: 100.0,
                  width: 100.0,
                  color: Colors.orange,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Container(
                      color: Colors.red,
                      width: 50.0,
                      height: 300.0,
                    ),
                  ),
                ),
                Container(
                  height: 100.0,
                  width: 100.0,
                  color: Colors.orange,
                  child: FittedBox(
                    alignment: Alignment.centerLeft,
                    fit: BoxFit.contain,
                    child: Container(
                      color: Colors.red,
                      width: 50.0,
                      height: 300.0,
                    ),
                  ),
                ),
              ],
            ),
            Text('父：w:100,h:100    子：w:50,h:300'),
            Text('左：BoxFit.contain自动缩放以适应父widget大小'),
            Text('右：增加了Alignment.centerLeft居中左对齐'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  height: 100.0,
                  width: 100.0,
                  color: Colors.orange,
                  child: FittedBox(
                    fit: BoxFit.none,
                    child: Image.asset('assets/images/4.jpg', width: 50.0, height: 10.0, fit: BoxFit.fill),
                  ),
                ),
                Container(
                  height: 100.0,
                  width: 100.0,
                  color: Colors.orange,
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Image.asset('assets/images/4.jpg', width: 50.0, height: 10.0, fit: BoxFit.fill),
                  ),
                ),
                Container(
                  height: 100.0,
                  width: 100.0,
                  color: Colors.orange,
                  child: FittedBox(
                    fit: BoxFit.fitHeight,
                    child: Image.asset('assets/images/4.jpg', width: 50.0, height: 10.0, fit: BoxFit.fill),
                  ),
                ),
              ],
            ),
            Text('父：w:100,h:100    子：w:50,h:10'),
            Text('左：BoxFit.none无缩放'),
            Text('中：BoxFit.fitWidth缩放至宽度与父布局宽度一致'),
            Text('右：BoxFit.fitHeight缩放至高度与父布局高度一致'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  height: 100.0,
                  width: 100.0,
                  color: Colors.orange,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Image.asset('assets/images/4.jpg', width: 50.0, height: 10.0, fit: BoxFit.fill),
                  ),
                ),
                Container(
                  height: 100.0,
                  width: 100.0,
                  color: Colors.orange,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Image.asset('assets/images/4.jpg', width: 50.0, height: 10.0, fit: BoxFit.fill),
                  ),
                ),
              ],
            ),
            Text('父：w:100,h:100    子：w:50,h:10'),
            Text('左：BoxFit.fill宽、高都缩放至与父布局相同'),
            Text('右：BoxFit.cover尽可能小，同时仍覆盖整个目标盒'),
          ],
        ),
      ),
    );
  }
}
