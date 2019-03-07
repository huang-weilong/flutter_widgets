import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CupertinoTabScaffoldWidget extends StatefulWidget {
  @override
  _CupertinoTabScaffoldWidgetState createState() => _CupertinoTabScaffoldWidgetState();
}

class _CupertinoTabScaffoldWidgetState extends State<CupertinoTabScaffoldWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CupertinoTabScaffold'),
        centerTitle: true,
        elevation: 0.0,
        bottom: PreferredSize(
          child: Text(
            '标签式iOS应用程序的结构。将选项卡栏放在内容选项卡之上',
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
                  child: CupertinoButton(
                    child: Text('下一页'),
                    onPressed: () {
                      Navigator.of(context).push(
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
                ),
              );
            },
          );
        },
      ),
    );
  }
}
