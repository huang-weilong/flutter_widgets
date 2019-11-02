import 'package:flutter/material.dart';

class DefaultTextStyleWidget extends StatefulWidget {
  @override
  _DefaultTextStyleWidgetState createState() => _DefaultTextStyleWidgetState();
}

class _DefaultTextStyleWidgetState extends State<DefaultTextStyleWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DefaultTextStyle'),
        centerTitle: true,
        elevation: 0.0,
        bottom: PreferredSize(
          child: Text(
            '文字样式，用于指定Text widget的文字样式',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      body: Column(
        children: <Widget>[
          DefaultTextStyle(
            style: TextStyle(fontSize: 20.0, color: Colors.black, fontStyle: FontStyle.italic),
            child: Column(
              children: <Widget>[
                Text('DefaultTextStyle是一个特殊的Widget,它并不直接显示文本，'
                    '而是可以指定一种文本风格，那么它的子孙节点中的Text都可以继承它的文本风格'),
                Text('使用自己的设置的style', style: TextStyle(color: Colors.blue, inherit: false)),
                Text(
                  '如果style的inherit为true，则合并style和DefaultTextStyle指定的文本风格，发生冲突时，前者会覆盖后者',
                  style: TextStyle(color: Colors.blue, inherit: true),
                ),
                Text('如果style的inherit为false，则不会合并DefaultTextStyle指定的文本风格'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
