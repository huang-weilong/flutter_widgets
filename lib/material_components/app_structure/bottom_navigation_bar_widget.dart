import 'package:flutter/material.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  @override
  _BottomNavigationBarWidgetState createState() => _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BottomNavigationBar'),
        elevation: 0.0,
        centerTitle: true,
        bottom: PreferredSize(
          child: Text('底部导航条，可以很容易地在tap之间切换和浏览顶级视图。'),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      body: IndexedStack(
        children: <Widget>[
          Center(child: Text('首页')),
          Center(
            child: Text('消息'),
          ),
          Center(
            child: Text('我的'),
          ),
        ],
        index: currentIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('首页'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            title: Text('消息'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('我的'),
          ),
        ],
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
