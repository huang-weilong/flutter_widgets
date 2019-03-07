import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CupertinoTabViewWidget extends StatefulWidget {
  @override
  _CupertinoTabViewWidgetState createState() => _CupertinoTabViewWidgetState();
}

class _CupertinoTabViewWidgetState extends State<CupertinoTabViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CupertinoTabView'),
        centerTitle: true,
        elevation: 0.0,
        bottom: PreferredSize(
          child: Text(
            '支持选项卡间并行导航项卡的根内容。通常与CupertinoTabScaffolde一起使用',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      body: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
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
                  middle: Text('页面 1 - 选项卡 $index'),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('要在CupertinoTabView上方而不是在其内部推送路径（例如在所有选项卡上显示对话框时），请使用 Navigator.of(rootNavigator: true),如下'),
                      CupertinoButton(
                        child: Text('下一页'),
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true).push(
                            CupertinoPageRoute<void>(
                              builder: (BuildContext context) {
                                return CupertinoPageScaffold(
                                  navigationBar: CupertinoNavigationBar(
                                    middle: Text('页面 2 - 选项卡 $index'),
                                  ),
                                  child: Center(
                                    child: CupertinoButton(
                                      child: Text('返回'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
