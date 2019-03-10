import 'package:flutter/material.dart';

class OffstageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Offstage'),
        centerTitle: true,
        elevation: 0.0,
        bottom: PreferredSize(
          child: Text(
            '它将孩子放在树中，但不会绘制任何东西，也不会占用父母的任何空间',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Offstage(
              offstage: false,
              child: Container(
                alignment: Alignment.center,
                width: 100.0,
                height: 100.0,
                color: Colors.green,
                child: Text('offstage:false'),
              ),
            ),
            Text('offstage为true（默认）时，不显示子widget'),
            Text('offstage为false时，显示子widget'),
            Text('如果有动画，动画会继续运行，无论它是否可见，都会增加耗电和消耗CPU'),
            Text('如果是完全不用的widget更好的方式是从tree中移除，而不是保存在Offstage子树中')
          ],
        ),
      ),
    );
  }
}
