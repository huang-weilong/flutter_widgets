import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawer'),
        centerTitle: true,
        elevation: 0.0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
//            DrawerHeader(child: Text('自定义布局面板头部')),
            UserAccountsDrawerHeader(
              accountName: Text('long'),
              accountEmail: Text('550456817@qq.com'),
              currentAccountPicture: ClipOval(
                child: Image.asset(
                  'assets/images/2.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ListTile(
              title: Text('选项一'),
              trailing: Icon(Icons.change_history),
              onTap: () {},
            ),
            ListTile(
              title: Text('选项二'),
              trailing: Icon(Icons.flag),
              onTap: () {},
            ),
            AboutListTile(
              icon: Icon(Icons.beach_access),
              child: Text('关于'),
              applicationName: 'flutter_widgets',
              applicationIcon: Icon(Icons.details),
              applicationLegalese: '根据flutter中文网widgets目录编写的demo',
              applicationVersion: 'v0.0.1',
              aboutBoxChildren: <Widget>[Icon(Icons.ac_unit)],
            )
          ],
        ),
      ),
      body: Center(
        child: Text(
          '从Scaffold边缘水平滑动以显示应用程序中导航链接的Material Design面板。\n'
              '抽屉通常与Scaffold.drawer属性一起使用。抽屉的子项通常是ListView，其第一个子项是DrawerHeader ，'
              '它显示有关当前用户的状态信息。其余的抽屉儿童往往与构建ListTile S，经常有结束AboutListTile。',
        ),
      ),
    );
  }
}
