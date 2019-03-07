import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CupertinoTabBarWidget extends StatefulWidget {
  @override
  _CupertinoTabBarWidgetState createState() => _CupertinoTabBarWidgetState();
}

class _CupertinoTabBarWidgetState extends State<CupertinoTabBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CupertinoTabBar'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: CupertinoTabScaffold(
        // 添加了CupertinoTabScaffold可以不使用onTap刷新currentIndex
        tabBar: CupertinoTabBar(
//          iconSize: 40.0,
//          backgroundColor: Colors.red,
          activeColor: Colors.blue,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), title: Text('home')),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.person), title: Text('mine')),
          ],
        ),
        tabBuilder: (BuildContext context, int index) {
          return CupertinoTabView(
            builder: (BuildContext context) {
              return CupertinoPageScaffold(
                navigationBar: CupertinoNavigationBar(
                  middle: Text('tab $index'),
                ),
                child: Center(child: Text('iOS风格的底部选项卡。通常和CupertinoTabScaffold一起使用。\n$index')),
              );
            },
          );
        },
      ),
    );
  }
}
