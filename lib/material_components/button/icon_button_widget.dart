import 'package:flutter/material.dart';

class IconButtonWidget extends StatefulWidget {
  @override
  _IconButtonWidgetState createState() => _IconButtonWidgetState();
}

class _IconButtonWidgetState extends State<IconButtonWidget> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IconButton'),
        centerTitle: true,
        elevation: 0.0,
        bottom: PreferredSize(
          child: Text(
            '一个Material图标按钮，点击时会有水波动画',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      body: _buildIconButton(),
    );
  }

  _buildIconButton() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
            iconSize: 40.0,
            icon: Icon(Icons.favorite),
            onPressed: () {
              setState(() => value = !value);
            },
            color: value ? Colors.red : Colors.grey,
          ),
          IconButton(
            tooltip: 'tooltip',
            color: Colors.orange,
            highlightColor: Colors.red,
            icon: Icon(Icons.favorite),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
