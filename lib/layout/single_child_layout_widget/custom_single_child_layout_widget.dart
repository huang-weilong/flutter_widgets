import 'package:flutter/material.dart';

class CustomSingleChildLayoutWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('CustomSingleChildLayout'),
        centerTitle: true,
        elevation: 0.0,
        bottom: PreferredSize(
          child: Text(
            '通过delegate传入的布局来对子级布局的控件',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      body: _buildTest1(),
    );
  }

  Widget _buildTest1() {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.all(5.0),
      child: CustomSingleChildLayout(
        delegate: FixedSizeLayoutDelegate(Size(200.0, 200.0)),
        child: Container(color: Colors.red),
      ),
    );
  }

  Widget _buildTest2(Size size) {
    return Container(
      height: 60.0,
      width: 60.0,
      color: Colors.red,
      child: CustomSingleChildLayout(
        delegate: _MySingleChildLayoutDelegate(
          //send the size of the viewport to the delegate for computation
          widgetSize: size,
        ),
      ),
    );
  }
}

class FixedSizeLayoutDelegate extends SingleChildLayoutDelegate {
  FixedSizeLayoutDelegate(this.size);

  final Size size;

  @override
  Size getSize(BoxConstraints constraints) => size;

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return BoxConstraints.tight(size);
  }

  @override
  bool shouldRelayout(FixedSizeLayoutDelegate oldDelegate) {
    return size != oldDelegate.size;
  }
}

class _MySingleChildLayoutDelegate extends SingleChildLayoutDelegate {
  _MySingleChildLayoutDelegate({@required this.widgetSize});

  final Size widgetSize;

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    //we expand the layout to our predefined sizes
    return BoxConstraints.expand(width: 120.0, height: 120.0);
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    //we place the widget at the cnter, by dividing the width and height by 2 to get the center
    return Offset(widgetSize.width / 2, widgetSize.height / 2);
  }

  @override
  bool shouldRelayout(_MySingleChildLayoutDelegate oldDelegate) {
    return widgetSize != oldDelegate.widgetSize;
  }
}
