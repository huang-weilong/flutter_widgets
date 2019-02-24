import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AppBar'),
        centerTitle: true,
        elevation: 0.0,
        bottom: PreferredSize(
          child: Text('bottom，改变了不透明度'),
          preferredSize: Size.fromHeight(50.0),
        ),
        backgroundColor: Color(0xff69b1de),
        iconTheme: IconThemeData(color: Colors.orange, size: 30.0), // AppBar内Icon的默认颜色
        toolbarOpacity: 0.8, // toolbar的不透明度
        bottomOpacity: 0.8, // bottom的不透明度
        actions: <Widget>[
          Icon(Icons.refresh),
          IconButton(icon: Icon(Icons.ac_unit), onPressed: () {}),
        ],
      ),
      body: Center(
        child: Text(
          '一个Material Design应用程序栏，由工具栏和其他可能的widget（如TabBar和FlexibleSpaceBar）组成。',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
