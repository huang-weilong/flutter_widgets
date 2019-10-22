import 'package:flutter/material.dart';

class CustomMultiChildLayoutWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CustomMultiChildLayout'),
        centerTitle: true,
        elevation: 0.0,
        bottom: PreferredSize(
          child: Text(
            '使用一个委托来对多个孩子进行设置大小和定位的小部件',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      body: _buildTest1(),
    );
  }

  Widget _buildTest1() {
    return CustomMultiChildLayout(
      delegate: _StatusPageLayoutDelegate(),
      children: <Widget>[
        LayoutId(
          id: _StatusPageLayoutDelegate.actionBar,
          child: Container(
            width: 300.0,
            height: 20.0,
            color: Colors.red,
          ),
        ),
        LayoutId(
          id: _StatusPageLayoutDelegate.body,
          child: Container(
            width: 200.0,
            color: Colors.orange,
          ),
        ),
      ],
    );
  }

  Widget _buildTest2() {
    return Container(
      width: 200.0,
      height: 100.0,
      color: Colors.yellow,
      child: CustomMultiChildLayout(
        delegate: TestLayoutDelegate(),
        children: <Widget>[
          LayoutId(
            id: TestLayoutDelegate.title,
            child: new Text("This is title", style: TextStyle(fontSize: 20.0, color: Colors.black)),
          ),
          LayoutId(
            id: TestLayoutDelegate.description,
            child: new Text("This is description", style: TextStyle(fontSize: 14.0, color: Colors.red)),
          ),
        ],
      ),
    );
  }
}

class _StatusPageLayoutDelegate extends MultiChildLayoutDelegate {
  static const String actionBar = 'action_bar';
  static const String body = 'body';

  @override
  void performLayout(Size size) {
    //大小
    Size actionBarSize = layoutChild(actionBar, new BoxConstraints(maxHeight: size.height, maxWidth: size.width));
    //offset（0，0），放在顶部
    positionChild(actionBar, Offset(0.0, 0.0));
    //布局body，约束为剩下的空间
//    layoutChild(body, BoxConstraints.tight(Size(size.width, size.height)));
    layoutChild(body, BoxConstraints(maxHeight: 200.0, maxWidth: 200.0));
    //offset（0，actionbar高度），排在actionbar下方
    positionChild(body, Offset(10.0, actionBarSize.height));
  }

  //是否需要重新布局
  @override
  bool shouldRelayout(MultiChildLayoutDelegate oldDelegate) => false;
}

class TestLayoutDelegate extends MultiChildLayoutDelegate {
  TestLayoutDelegate();

  static const String title = 'title';
  static const String description = 'description';

  @override
  void performLayout(Size size) {
    final BoxConstraints constraints = new BoxConstraints(maxWidth: size.width);

    final Size titleSize = layoutChild(title, constraints);
    positionChild(title, new Offset(0.0, 0.0));

    final double descriptionY = titleSize.height;
    layoutChild(description, constraints);
    positionChild(description, new Offset(0.0, descriptionY));
  }

  @override
  bool shouldRelayout(TestLayoutDelegate oldDelegate) => false;
}
