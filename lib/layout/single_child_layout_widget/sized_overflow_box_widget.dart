import 'package:flutter/material.dart';

class SizedOverflowBoxWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SizedOverflowBox'),
        centerTitle: true,
        elevation: 0.0,
        bottom: PreferredSize(
          child: Text(
            '一个特定大小的widget，但是会将它的原始约束传递给它的孩子，它可能会溢出',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.green,
              alignment: Alignment.topLeft,
              width: 200.0,
              height: 200.0,
              child: SizedOverflowBox(
//            alignment: Alignment.topLeft,
                size: Size(100.0, 200.0),
                child: Container(
                  color: Colors.red,
                  width: 150.0,
                  height: 50.0,
                ),
              ),
            ),
            Text('没太懂这个widget的用法。。。后续更新')
          ],
        ),
      ),
    );
  }
}
