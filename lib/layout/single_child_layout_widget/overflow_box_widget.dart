import 'package:flutter/material.dart';

class OverflowBoxWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OverflowBox'),
        centerTitle: true,
        elevation: 0.0,
        bottom: PreferredSize(
          child: Text(
            '一个小部件对其子级施加不同于从其父级获得的约束，可能允许子级溢出父级',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            color: Colors.green,
            width: 100.0,
            height: 100.0,
            child: OverflowBox(
              alignment: Alignment.topLeft,
              maxWidth: 300.0,
              maxHeight: 300.0,
              minWidth: 50.0,
              minHeight: 50.0,
              child: Container(
                width: 400.0,
                height: 80.0,
                color: Color(0x332E11A1),
              ),
            ),
          ),
          Text('父（绿色）：w:100.0  h:100.0'),
          Text('OverflowBox:'),
          Text('maxWidth:300.0  maxHeight:300.0'),
          Text('minWidth:50.0  minHeight:50.0'),
          Text('子 w:400.0  h:80.0'),
          SizedBox(height: 20.0),
          Text('当OverflowBox的最大尺寸大于child的时候，child可以完整显示（如上的高度）'),
          Text('当其小于child的时候，则以最大尺寸为基准（如上宽度），这个尺寸都是可以突破父节点的。最后加上对齐方式，完成布局'),
          Text('如果不指定minWidth/minHeight则它的约束为父级的宽高'),
        ],
      ),
    );
  }
}
