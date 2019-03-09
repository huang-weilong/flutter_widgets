import 'package:flutter/material.dart';

class FractionallySizedBoxWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FractionallySizedBox'),
        centerTitle: true,
        elevation: 0.0,
        bottom: PreferredSize(
          child: Text(
            '将其子级调整为总可用空间的一小部分',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('FractionallySizedBox控件会根据父容器大小来调整child的尺寸，如果child设置了具体的尺寸数值，将不起作用。'),
            Text('当设置了具体的宽高因子，child的宽高根据父容器宽高 * 宽高因子，当宽高因子大于1的时候会超出父控件的范围'),
            Container(
              color: Colors.orange,
              height: 100.0,
              width: 100.0,
              child: FractionallySizedBox(
                alignment: Alignment.topLeft,
                widthFactor: 1.5,
                heightFactor: 0.5,
                child: Container(color: Colors.red),
              ),
            ),
            Text('父：h:100.0,width:100.0'),
            Text('widthFactor:1.5,  heightFactor:0.5'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  color: Colors.orange,
                  height: 100.0,
                  width: 100.0,
                  child: FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: 0.5,
                    child: Container(color: Colors.red),
                  ),
                ),
                Container(
                  color: Colors.orange,
                  height: 100.0,
                  width: 100.0,
                  child: FractionallySizedBox(
                    alignment: Alignment.center,
                    widthFactor: 1.5,
                    child: Container(color: Colors.red),
                  ),
                ),
              ],
            ),
            Text('父：h:100.0,width:100.0'),
            Text('左：widthFactor:0.5,  heightFactor:null'),
            Text('右：widthFactor:1.5,  heightFactor:null'),
            Container(
              color: Colors.orange,
              height: 100.0,
              width: 100.0,
              child: FractionallySizedBox(child: Container(color: Colors.red)),
            ),
            Text('父：h:100.0,width:100.0'),
            Text('左：widthFactor:null,  heightFactor:null'),
          ],
        ),
      ),
    );
  }
}
